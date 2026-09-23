cask "oxideterm" do
  arch arm: "arm64", intel: "x64"

  version "2.0.31"
  sha256 arm:   "736ddd6b5e371f7b500264a06ce500b92c9ee60a83aa5116c48cc9614e398f60",
         intel: "61fdea6b204e1233fccb280bf9a67459da7ec75517ecd999202fd2c2fd50fb66"

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
