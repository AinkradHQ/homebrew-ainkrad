cask "ainkrad" do
  version "0.10.0"
  sha256 "fb3d14bd1bda95a261e64d80ecb5480c0e1d5338b4ce2fb28af46d750a219f5e"

  url "https://github.com/AinkradHQ/AinkradCoreApp/releases/download/app-v#{version}/Ainkrad-#{version}.dmg",
      verified: "github.com/AinkradHQ/AinkradCoreApp/"
  name "Ainkrad"
  desc "Agentic OS workspace for software engineers, with your own Core"
  homepage "https://ainkrad.io/"

  livecheck do
    url "https://ainkrad.io/releases/app/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Ainkrad.app"

  # Signed with Ainkrad's Developer ID but not notarized yet: Homebrew marks the app as downloaded, and macOS would then
  # refuse to start its runner. The download is already checked by the sha256 above; this tap clears the mark.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Ainkrad.app"]
  end

  zap trash: [
    "~/.ainkrad-runner",
    "~/Library/Application Support/Ainkrad",
    "~/Library/Caches/com.ainkrad.core",
    "~/Library/HTTPStorages/com.ainkrad.core",
    "~/Library/Logs/Ainkrad",
    "~/Library/Preferences/com.ainkrad.core.plist",
  ]
end
