cask "oxideterm" do
  arch arm: "arm64", intel: "x64"

  version "2.3.3"
  sha256 arm:   "6a0bb614a3c626a8fbb86e210264d0d657b204820c055da7d277e9461a0fb631",
         intel: "11d69469498fc12ddd404a18bf9dcf1443ff9dddb098c30c458a8c9d00403001"

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
