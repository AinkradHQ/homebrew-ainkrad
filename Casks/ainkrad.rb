cask "ainkrad" do
  version "0.27.1"
  sha256 "aae4b340cd4d1d6f96730291f30eb30df97b0f83c83db0bbbc6ebf7d240095ce"

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
