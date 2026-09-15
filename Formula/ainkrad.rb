class Ainkrad < Formula
  desc "Ainkrad agentic OS CLI"
  homepage "https://github.com/AinkradHQ/AinkradKit"
  version "0.2.2"
  url "https://github.com/AinkradHQ/AinkradKit/releases/download/v#{version}/ainkrad-v#{version}-macos.zip"
  sha256 "ab136a54139a2817c573be0c35ae85dc9030f08360f5afe1755223842cc551a5"
  license "UNLICENSED"

  def install
    # ainkrad links libAinkradAppKit.dylib via @loader_path, and resolves its
    # scaffolding template through Bundle.module, which looks for
    # AinkradKit_ainkrad.bundle beside the executable. All three must stay
    # siblings. Install them into libexec and symlink the CLI into bin.
    libexec.install "ainkrad", "libAinkradAppKit.dylib", "AinkradKit_ainkrad.bundle"
    bin.install_symlink libexec/"ainkrad"
  end

  test do
    system "#{bin}/ainkrad", "--help"
    # --help does not touch the resource bundle, so it passed for every broken
    # build through v0.2.0. Scaffold for real: this is the assertion that the
    # template actually shipped.
    system "#{bin}/ainkrad", "new", "SmokeTest", "--into", testpath/"SmokeTest"
    assert_path_exists testpath/"SmokeTest/project.yml"
  end
end
