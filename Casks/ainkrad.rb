cask "ainkrad" do
  version "0.21.0"
  sha256 "2e64a00930ae13e0055940c5b8848b688acf03937667ba88ec10c0f8e58d01ee"

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
