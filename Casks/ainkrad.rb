cask "ainkrad" do
  version "0.31.0"
  sha256 "f0736f468f168186209596816475e81c5677cde6ee0f30e9028e4e12643058cb"

  url "https://github.com/AinkradHQ/Ainkrad/releases/download/v#{version}/Ainkrad-#{version}.dmg"
  name "Ainkrad"
  desc "Agentic OS workspace for software engineers"
  homepage "https://github.com/AinkradHQ/Ainkrad"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Ainkrad.app"

  zap trash: [
    "~/Library/Application Support/com.ainkrad.app",
    "~/Library/Preferences/com.ainkrad.app.plist",
    "~/Library/Caches/com.ainkrad.app",
  ]
end
