import Foundation
import IOKit
import IOUSBHost

/// Watches for the keypad and writes command packets to its programming interface.
///
/// Interface 1 of the keypad is a HID interface that macOS leaves unclaimed (its descriptor has no
/// usable collection), so it is opened directly with IOUSBHost: no driver, root or permission needed.
final class KeyboardDevice: ObservableObject {
    static let vendorID = 0x1189
    static let productID = 0x8890
    private static let programmingInterface = 1
    private static let packetSize = 65
    private static let reportID: UInt8 = 3

    enum DeviceError: LocalizedError {
        case notConnected, noEndpoint

        var errorDescription: String? {
            switch self {
            case .notConnected: "The keypad isn't connected."
            case .noEndpoint: "The keypad refused the connection."
            }
        }
    }

    @Published private(set) var isConnected = false
    /// MiniKeys firmware version (bcdDevice 0x20xx), or nil for the stock firmware.
    @Published private(set) var firmwareVersion: Int?

    var hasMiniKeysFirmware: Bool { firmwareVersion != nil }

    private var notifyPort: IONotificationPortRef?
    private var iterators: [io_iterator_t] = []
    private let queue = DispatchQueue(label: "MiniKeys.usb")

    init() {
        startWatching()
    }

    deinit {
        iterators.forEach { IOObjectRelease($0) }
        if let notifyPort { IONotificationPortDestroy(notifyPort) }
    }

    /// Sends the packets in order on a background queue; `completion` runs on the main queue.
    func send(_ packets: [[UInt8]], completion: ((Result<Void, Error>) -> Void)? = nil) {
        queue.async {
            let result = Result { try self.transmit(packets) }
            self.closeSessionWhenIdle()
            DispatchQueue.main.async { completion?(result) }
        }
    }

    /// Blocking variant, for the last write before the app quits.
    func sendAndWait(_ packets: [[UInt8]]) {
        queue.sync { _ = try? transmit(packets) }
    }

    // MARK: - Connection

    private func startWatching() {
        guard let port = IONotificationPortCreate(kIOMainPortDefault) else { return }
        IONotificationPortSetDispatchQueue(port, .main)
        notifyPort = port
        let context = Unmanaged.passUnretained(self).toOpaque()
        let callback: IOServiceMatchingCallback = { context, iterator in
            guard let context else { return }
            let device = Unmanaged<KeyboardDevice>.fromOpaque(context).takeUnretainedValue()
            device.drain(iterator)
            // Terminated services can linger for a moment; check again once the registry settles.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { device.refresh() }
        }
        for type in [kIOFirstMatchNotification, kIOTerminatedNotification] {
            let matching = IOServiceMatching("IOUSBHostDevice") as NSMutableDictionary
            matching["idVendor"] = Self.vendorID
            matching["idProduct"] = Self.productID
            var iterator: io_iterator_t = 0
            if IOServiceAddMatchingNotification(port, type, matching, callback, context, &iterator) == KERN_SUCCESS {
                drain(iterator)
                iterators.append(iterator)
            }
        }
        refresh()
    }

    private func drain(_ iterator: io_iterator_t) {
        while case let service = IOIteratorNext(iterator), service != 0 {
            IOObjectRelease(service)
        }
    }

    private func refresh() {
        let service = Self.findInterface()
        isConnected = service != 0
        let bcd = isConnected ? Self.deviceVersion() : 0
        let version = bcd >> 8 == 0x20 ? bcd & 0xFF : nil
        if version != firmwareVersion { firmwareVersion = version }
        if service != 0 {
            IOObjectRelease(service)
        } else {
            queue.async { self.closeSession() }
        }
    }

    // MARK: - Writing

    private static func deviceVersion() -> Int {
        let matching = IOServiceMatching("IOUSBHostDevice") as NSMutableDictionary
        matching["idVendor"] = vendorID
        matching["idProduct"] = productID
        let service = IOServiceGetMatchingService(kIOMainPortDefault, matching)
        guard service != 0 else { return 0 }
        defer { IOObjectRelease(service) }
        return IORegistryEntryCreateCFProperty(service, "bcdDevice" as CFString, kCFAllocatorDefault, 0)?
            .takeRetainedValue() as? Int ?? 0
    }

    private static func findInterface() -> io_service_t {
        var iterator: io_iterator_t = 0
        guard IOServiceGetMatchingServices(kIOMainPortDefault, IOServiceMatching("IOUSBHostInterface"), &iterator)
            == KERN_SUCCESS else { return 0 }
        defer { IOObjectRelease(iterator) }
        while case let service = IOIteratorNext(iterator), service != 0 {
            func property(_ key: String) -> Int? {
                IORegistryEntryCreateCFProperty(service, key as CFString, kCFAllocatorDefault, 0)?
                    .takeRetainedValue() as? Int
            }
            if property("idVendor") == vendorID, property("idProduct") == productID,
               property("bInterfaceNumber") == programmingInterface {
                return service
            }
            IOObjectRelease(service)
        }
        return 0
    }

    /// An open programming interface, kept between writes so live light effects stay cheap.
    /// Only touched on `queue`.
    private struct Session {
        let interface: IOUSBHostInterface
        let pipe: IOUSBHostPipe
        let buffer: NSMutableData
    }

    private var session: Session?

    private func transmit(_ packets: [[UInt8]]) throws {
        do {
            try Self.write(packets, using: openSession())
        } catch {
            // The keypad may have been unplugged and plugged in again: retry once with a new session.
            closeSession()
            try Self.write(packets, using: openSession())
        }
    }

    private func openSession() throws -> Session {
        if let session { return session }
        let service = Self.findInterface()
        guard service != 0 else { throw DeviceError.notConnected }
        defer { IOObjectRelease(service) }
        let interface = try IOUSBHostInterface(__ioService: service, options: [], queue: nil, interestHandler: nil)
        guard let pipe = try Self.outPipe(of: interface) else {
            interface.destroy()
            throw DeviceError.noEndpoint
        }
        // IOUSBHost only transfers buffers it allocated itself.
        let session = Session(interface: interface, pipe: pipe, buffer: try interface.ioData(withCapacity: Self.packetSize))
        self.session = session
        return session
    }

    private var lastUse = Date.distantPast

    /// Releases the interface after a few idle seconds, so tools like the firmware flasher can open it.
    private func closeSessionWhenIdle() {
        lastUse = Date()
        queue.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self, Date().timeIntervalSince(lastUse) >= 2.9 else { return }
            closeSession()
        }
    }

    private func closeSession() {
        session?.interface.destroy()
        session = nil
    }

    private static func write(_ packets: [[UInt8]], using session: Session) throws {
        for packet in packets {
            var bytes = [UInt8](repeating: 0, count: packetSize)
            bytes[0] = reportID
            bytes.replaceSubrange(1...packet.count, with: packet)
            session.buffer.replaceBytes(in: NSRange(location: 0, length: packetSize), withBytes: bytes)
            var transferred = 0
            // Interrupt pipes require a completion timeout of 0.
            try session.pipe.__sendIORequest(with: session.buffer, bytesTransferred: &transferred, completionTimeout: 0)
            if packets.count > 1 { usleep(15_000) }
        }
    }

    private static func outPipe(of interface: IOUSBHostInterface) throws -> IOUSBHostPipe? {
        let configuration = interface.configurationDescriptor
        let interfaceDescriptor = interface.interfaceDescriptor
        var current = UnsafeRawPointer(interfaceDescriptor).assumingMemoryBound(to: IOUSBDescriptorHeader.self)
        while let endpoint = IOUSBGetNextEndpointDescriptor(configuration, interfaceDescriptor, current) {
            if endpoint.pointee.bEndpointAddress & 0x80 == 0 {
                return try interface.copyPipe(withAddress: Int(endpoint.pointee.bEndpointAddress))
            }
            current = UnsafeRawPointer(endpoint).assumingMemoryBound(to: IOUSBDescriptorHeader.self)
        }
        return nil
    }
}
