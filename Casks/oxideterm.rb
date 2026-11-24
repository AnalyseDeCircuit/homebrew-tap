cask "oxideterm" do
  arch arm: "arm64", intel: "x64"

  version "2.4.1"
  sha256 arm:   "93742ae557a8fc5f9d37282c91f1444867375785f89ac0eb2937766d12743287",
         intel: "eef782e7584c73925232bbc58779cda51ea801d192e9885f909fd0b4df05ce03"

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

  zap trash: [
    "~/Library/Application Support/com.oxideterm.app",
    "~/Library/Caches/com.oxideterm.app",
    "~/Library/HTTPStorages/com.oxideterm.app",
    "~/Library/Logs/com.oxideterm.app",
    "~/Library/Preferences/com.oxideterm.app.plist",
    "~/Library/Saved Application State/com.oxideterm.app.savedState",
  ]
end
