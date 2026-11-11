cask "oxideterm" do
  arch arm: "arm64", intel: "x64"

  version "2.3.2"
  sha256 arm:   "bcfa9de8eb56a5dc28149afcba0f8ed9a7d8bc889c234d27ebd5f3b88ee7b158",
         intel: "1cacf28bbe085b2f024a08432585d5a53e0b922ea8bf921c3cb1e2fa2005623d"

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

  postflight_steps do
    # Remove the quarantine attribute because current releases are not Apple-notarized.
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/OxideTerm.app"]
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
