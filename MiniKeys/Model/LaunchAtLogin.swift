import Foundation

/// Launch at login via a LaunchAgent plist (works without a Developer ID, unlike `SMAppService`).
/// At login MiniKeys starts in the menu bar only, without its window.
enum LaunchAtLogin {
    /// Passed by the agent, so the app knows it was started at login.
    static let argument = "--launched-at-login"

    static var wasLaunchedAtLogin: Bool { CommandLine.arguments.contains(argument) }

    private static var label: String { Bundle.main.bundleIdentifier ?? "com.mellamocarl.MiniKeys" }
    private static var plistURL: URL {
        FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent("Library/LaunchAgents/\(label).plist")
    }

    static var isEnabled: Bool { agentExecutablePath != nil }

    static func setEnabled(_ isOn: Bool) {
        if isOn {
            writeAgent()
        } else {
            try? FileManager.default.removeItem(at: plistURL)
        }
    }

    /// Points the agent at this copy of the app, in case it was moved or replaced.
    static func refresh() {
        guard let path = agentExecutablePath, path != Bundle.main.executablePath else { return }
        writeAgent()
    }

    private static var agentExecutablePath: String? {
        guard let data = try? Data(contentsOf: plistURL),
              let plist = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any],
              let arguments = plist["ProgramArguments"] as? [String]
        else { return nil }
        return arguments.first
    }

    /// Writes the agent without loading it: launchd picks it up at the next login. Loading it now
    /// (`RunAtLoad`) would start a second copy of MiniKeys right away.
    private static func writeAgent() {
        guard let executablePath = Bundle.main.executablePath else { return }
        let plist: [String: Any] = [
            "Label": label,
            "ProgramArguments": [executablePath, argument],
            "RunAtLoad": true,
            "KeepAlive": false
        ]
        do {
            try FileManager.default.createDirectory(at: plistURL.deletingLastPathComponent(), withIntermediateDirectories: true)
            let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
            try data.write(to: plistURL)
        } catch {
            print("LaunchAtLogin: \(error)")
        }
    }
}
