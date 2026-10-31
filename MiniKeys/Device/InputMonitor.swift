import AppKit
import IOKit.hid

/// Listens to what the keypad itself sends (keys, media keys, mouse), to light up the on-screen keypad.
/// Reading input from a keyboard requires the Input Monitoring permission; without it, key presses are
/// still seen while MiniKeys is the active app (from any keyboard, so less precise).
final class InputMonitor: ObservableObject {
    enum Event {
        case key(UInt8, isDown: Bool)
        case consumer(UInt16, isDown: Bool)
        case mouseButton(Int, isDown: Bool)
        case wheel(up: Bool)
    }

    enum Access { case granted, denied, unknown }

    @Published private(set) var access: Access = .unknown

    var onEvent: ((Event) -> Void)?

    private var manager: IOHIDManager?
    private var localMonitor: Any?

    init() {
        refreshAccess()
        localMonitor = NSEvent.addLocalMonitorForEvents(matching: [.keyDown, .keyUp, .flagsChanged]) { [weak self] event in
            self?.handleLocal(event)
            return event
        }
        NotificationCenter.default.addObserver(
            forName: NSApplication.didBecomeActiveNotification, object: nil, queue: .main
        ) { [weak self] _ in
            self?.start()
        }
    }

    func start() {
        refreshAccess()
        guard access == .granted else { return }
        openManager()
    }

    /// Asks macOS for Input Monitoring. The system prompt only shows once per app signature, so the
    /// Settings pane is opened too: MiniKeys can be switched on there (or added with +).
    func requestAccess() {
        if IOHIDRequestAccess(kIOHIDRequestTypeListenEvent) {
            start()
            return
        }
        // Trying to open the keypad registers MiniKeys in the Input Monitoring list.
        openManager()
        refreshAccess()
        if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_ListenEvent") {
            NSWorkspace.shared.open(url)
        }
    }

    private func openManager() {
        guard manager == nil else { return }
        let manager = IOHIDManagerCreate(kCFAllocatorDefault, IOOptionBits(kIOHIDOptionsTypeNone))
        IOHIDManagerSetDeviceMatching(manager, [
            kIOHIDVendorIDKey: KeyboardDevice.vendorID,
            kIOHIDProductIDKey: KeyboardDevice.productID
        ] as CFDictionary)
        let context = Unmanaged.passUnretained(self).toOpaque()
        IOHIDManagerRegisterInputValueCallback(manager, { context, _, _, value in
            guard let context else { return }
            Unmanaged<InputMonitor>.fromOpaque(context).takeUnretainedValue().handle(value)
        }, context)
        IOHIDManagerScheduleWithRunLoop(manager, CFRunLoopGetMain(), CFRunLoopMode.commonModes.rawValue)
        guard IOHIDManagerOpen(manager, IOOptionBits(kIOHIDOptionsTypeNone)) == kIOReturnSuccess else {
            IOHIDManagerUnscheduleFromRunLoop(manager, CFRunLoopGetMain(), CFRunLoopMode.commonModes.rawValue)
            return
        }
        self.manager = manager
    }

    private func refreshAccess() {
        switch IOHIDCheckAccess(kIOHIDRequestTypeListenEvent) {
        case kIOHIDAccessTypeGranted: access = .granted
        case kIOHIDAccessTypeDenied: access = .denied
        default: access = .unknown
        }
    }

    private var localModifiers: NSEvent.ModifierFlags = []

    private func handleLocal(_ event: NSEvent) {
        guard manager == nil else { return }
        switch event.type {
        case .keyDown where !event.isARepeat, .keyUp:
            if let key = KeyCatalog.key(macKeyCode: event.keyCode) {
                onEvent?(.key(key.usage, isDown: event.type == .keyDown))
            }
        case .flagsChanged:
            let flags = event.modifierFlags.intersection([.control, .shift, .option, .command])
            let usages: [(NSEvent.ModifierFlags, UInt8)] = [(.control, 0xE0), (.shift, 0xE1), (.option, 0xE2), (.command, 0xE3)]
            for (flag, usage) in usages where flags.contains(flag) != localModifiers.contains(flag) {
                onEvent?(.key(usage, isDown: flags.contains(flag)))
            }
            localModifiers = flags
        default:
            break
        }
    }

    private func handle(_ value: IOHIDValue) {
        let element = IOHIDValueGetElement(value)
        let page = IOHIDElementGetUsagePage(element)
        let usage = IOHIDElementGetUsage(element)
        let integer = IOHIDValueGetIntegerValue(value)
        let event: Event?
        switch page {
        case UInt32(kHIDPage_KeyboardOrKeypad) where (0x04...0xE7).contains(usage):
            event = .key(UInt8(usage), isDown: integer != 0)
        case UInt32(kHIDPage_Consumer) where usage > 0 && usage <= 0xFFFF:
            event = .consumer(UInt16(usage), isDown: integer != 0)
        case UInt32(kHIDPage_Button):
            event = .mouseButton(Int(usage), isDown: integer != 0)
        case UInt32(kHIDPage_GenericDesktop) where usage == UInt32(kHIDUsage_GD_Wheel) && integer != 0:
            event = .wheel(up: integer > 0)
        default:
            event = nil
        }
        if let event { onEvent?(event) }
    }
}
