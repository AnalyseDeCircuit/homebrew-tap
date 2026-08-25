cask "oxideterm" do
  arch arm: "arm64", intel: "x64"

  version "2.0.24"
  sha256 arm:   "37d7d9965a738eb8aba5af18464763493b64c29e44a3abde9355200e9efc3e51",
         intel: "59092b0a01c8d479e5854557ae360b7f9ebac15f6a9e61bc5bce12f8319f7843"

  url "https://github.com/AnalyseDeCircuit/oxideterm/releases/download/v#{version}/OxideTerm_#{version}_macos_#{arch}.dmg"
  name "OxideTerm"
  desc "Local-first SSH workspace with a pure Rust SSH stack"
  homepage "https://github.com/AnalyseDeCircuit/oxideterm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "OxideTerm.app"

  postflight do
    # Remove the quarantine attribute because current releases are not Apple-notarized.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/OxideTerm.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.oxideterm.app",
    "~/Library/Caches/com.oxideterm.app",
    "~/Library/HTTPStorages/com.oxideterm.app",
    "~/Library/Logs/com.oxideterm.app",
    "~/Library/Preferences/com.oxideterm.app.plist",
    "~/Library/Saved Application State/com.oxideterm.app.savedState",
  ]
end
