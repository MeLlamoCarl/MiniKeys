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
            case .notConnected: "El teclado no está conectado."
            case .noEndpoint: "El teclado no aceptó la conexión."
            }
        }
    }

    @Published private(set) var isConnected = false

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
            let result = Result { try Self.write(packets) }
            DispatchQueue.main.async { completion?(result) }
        }
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
        if service != 0 { IOObjectRelease(service) }
    }

    // MARK: - Writing

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

    private static func write(_ packets: [[UInt8]]) throws {
        let service = findInterface()
        guard service != 0 else { throw DeviceError.notConnected }
        defer { IOObjectRelease(service) }

        let interface = try IOUSBHostInterface(__ioService: service, options: [], queue: nil, interestHandler: nil)
        defer { interface.destroy() }
        guard let pipe = try outPipe(of: interface) else { throw DeviceError.noEndpoint }

        // IOUSBHost only transfers buffers it allocated itself.
        let buffer = try interface.ioData(withCapacity: packetSize)
        for packet in packets {
            var bytes = [UInt8](repeating: 0, count: packetSize)
            bytes[0] = reportID
            bytes.replaceSubrange(1...packet.count, with: packet)
            buffer.replaceBytes(in: NSRange(location: 0, length: packetSize), withBytes: bytes)
            var transferred = 0
            // Interrupt pipes require a completion timeout of 0.
            try pipe.__sendIORequest(with: buffer, bytesTransferred: &transferred, completionTimeout: 0)
            usleep(15_000)
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
