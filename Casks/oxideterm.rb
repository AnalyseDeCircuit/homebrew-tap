cask "oxideterm" do
  arch arm: "arm64", intel: "x64"

  version "2.0.1"
  sha256 arm:   "9bdae3c3a8cdfc6490f42fd78b54fa1d480afa49c10ab7f56021aa7cb51b9b5f",
         intel: "0ec586efb8aa6bba374e7e4aaed271d7228214ab8f7f48ba9dbaafa489a5dcab"

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
