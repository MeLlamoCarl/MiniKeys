import SwiftUI

/// The About window: version, links and credits.
struct AboutView: View {
    private var version: String {
        let info = Bundle.main.infoDictionary
        return "Version \(info?["CFBundleShortVersionString"] ?? "?") (\(info?["CFBundleVersion"] ?? "?"))"
    }

    var body: some View {
        VStack(spacing: 4) {
            Image(nsImage: NSApp.applicationIconImage)
                .resizable()
                .frame(width: 100, height: 100)
            Text("MiniKeys")
                .font(.largeTitle.bold())
            Text(version)
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("by MeLlamoCarl")
                .font(.callout)
                .foregroundStyle(.secondary)
            VStack(spacing: 12) {
                links
                credits
            }
            .padding(.top, 10)
        }
        .padding(20)
        .frame(width: 320)
        .background(WindowMaterial().ignoresSafeArea())
    }

    private var links: some View {
        GroupBox {
            VStack(alignment: .leading, spacing: 8) {
                link("MiniKeys on GitHub", "chevron.left.forwardslash.chevron.right",
                     "https://github.com/MeLlamoCarl/MiniKeys")
                link("MiniKeys Firmware", "memorychip", "https://github.com/MeLlamoCarl/MiniKeys-Firmware")
            }
            .padding(4)
        } label: {
            Label("Links", systemImage: "link")
        }
    }

    private var credits: some View {
        GroupBox {
            person("MeLlamoCarl", username: "MeLlamoCarl", role: "MiniKeys app and firmware")
                .padding(4)
        } label: {
            Label("Credits", systemImage: "person.crop.square.filled.and.at.rectangle")
        }
    }

    private func link(_ title: String, _ symbol: String, _ url: String) -> some View {
        Link(destination: URL(string: url)!) {
            Label(title, systemImage: symbol)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    /// A GitHub profile with its public avatar.
    private func person(_ name: String, username: String, role: String) -> some View {
        Link(destination: URL(string: "https://github.com/\(username)")!) {
            HStack(spacing: 10) {
                AsyncImage(url: URL(string: "https://github.com/\(username).png?size=90")) { phase in
                    if case .success(let image) = phase {
                        image.resizable()
                    } else {
                        Color.secondary.opacity(0.3)
                    }
                }
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 6) {
                        Text(name).font(.headline)
                        if name != username {
                            Text("@" + username)
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                    }
                    Text(role)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .buttonStyle(.plain)
    }
}

/// "About MiniKeys", in the app menu and the menu bar.
struct AboutMenuButton: View {
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        Button("About MiniKeys") {
            openWindow(id: "about")
            NSApp.activate(ignoringOtherApps: true)
        }
    }
}
