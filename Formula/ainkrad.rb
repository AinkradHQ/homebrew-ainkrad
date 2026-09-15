class Ainkrad < Formula
  desc "Ainkrad agentic OS CLI"
  homepage "https://github.com/AinkradHQ/AinkradKit"
  version "0.2.2"
  url "https://github.com/AinkradHQ/AinkradKit/releases/download/v#{version}/ainkrad-v#{version}-macos.zip"
  sha256 "ab136a54139a2817c573be0c35ae85dc9030f08360f5afe1755223842cc551a5"
  license "UNLICENSED"

  def install
    # ainkrad links libAinkradAppKit.dylib via @loader_path, so the two must
    # stay siblings. Install both into libexec and symlink the CLI into bin.
    libexec.install "ainkrad", "libAinkradAppKit.dylib"
    bin.install_symlink libexec/"ainkrad"
  end

  test do
    system "#{bin}/ainkrad", "--help"
  end
end
