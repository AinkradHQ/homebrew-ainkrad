cask "ainkrad" do
  version "0.31.1"
  sha256 "54b8811c413a74b0a3de1c970a85283338e9c5a4f4d3a57685e0dc2d4db7ba06"

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
