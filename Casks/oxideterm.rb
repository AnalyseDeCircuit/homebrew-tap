cask "oxideterm" do
  arch arm: "arm64", intel: "x64"

  version "2.0.21"
  sha256 arm:   "17bb315b767f8e73454620910fe7a33a13fe98947974f5f6b6e360ee4dae5372",
         intel: "06edeb4bfbc5f7522126492bc3559790a0414b2ef66039620c8ca770e9247441"

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
