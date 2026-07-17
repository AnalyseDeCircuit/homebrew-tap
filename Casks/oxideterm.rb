cask "oxideterm" do
  arch arm: "arm64", intel: "x64"

  version "2.0.3"
  sha256 arm:   "c5cffe016680f302842b859cb61b5725fa0c28df2d07fea4e90e4d2d70f82b55",
         intel: "cfb315c9d98ee0993ba19273b844978c7d8ca0a4e9a52764cd0455a9393e958c"

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
