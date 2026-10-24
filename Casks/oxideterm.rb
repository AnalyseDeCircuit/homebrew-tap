cask "oxideterm" do
  arch arm: "arm64", intel: "x64"

  version "2.2.5"
  sha256 arm:   "1b65b9a06684205b1a6eb00822a672067dddf37038b0b134e75bbfed8aa08d96",
         intel: "42c5217ddf9df0e3946f524315242a681d1ea2937e03cccc0c251bf9a5615e07"

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
