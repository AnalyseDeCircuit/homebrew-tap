cask "oxideterm" do
  arch arm: "arm64", intel: "x64"

  version "2.0.12"
  sha256 arm:   "81235b16598cacdc1450b3a34f0c5ecfaddc7d1cf8093749fc30b1f4e3dbc92b",
         intel: "e1a5fa9c44a85f79a589b3ab25ba62e0f7acd8945fdb9e3061b2aedbfbf9ec6e"

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
