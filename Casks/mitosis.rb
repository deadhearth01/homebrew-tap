cask "mitosis" do
  version "0.2.1"
  sha256 "20bd9754fe14e503c667f884502f8b99c625e5554538a35ea302078d4d9a6fe2"

  url "https://github.com/deadhearth01/Mitosis/releases/download/v#{version}/Mitosis-#{version}.zip"
  name "Mitosis"
  desc "Run separate copies of apps, each with its own login and data"
  homepage "https://github.com/deadhearth01/Mitosis"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Mitosis.app"
  binary "#{appdir}/Mitosis.app/Contents/Helpers/mitosis"

  # Mitosis is free and ad-hoc signed (no paid Apple Developer account), so it isn't notarized.
  # Clear the quarantine flag from the download so macOS opens it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Mitosis.app"], must_succeed: false
  end

  uninstall launchctl: "com.mitosis-mac.autorefresh",
            quit:      "com.mitosis-mac.Mitosis"

  # Clones (~/Applications/Mitosis) and their data (~/Library/Mitosis) are yours and are never removed.
  zap trash: [
    "~/Library/Application Support/Mitosis",
    "~/Library/LaunchAgents/com.mitosis-mac.autorefresh.plist",
    "~/Library/Logs/Mitosis",
    "~/Library/Preferences/com.mitosis-mac.Mitosis.plist",
  ]
end
