cask "ainkrad" do
  version "0.25.0"
  sha256 "564b0060d254b21aef0396876ba39ea011a36d761bb64907a3cfbda7eaa8b94c"

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
