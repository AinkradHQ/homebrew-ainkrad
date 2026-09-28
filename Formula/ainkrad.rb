class Ainkrad < Formula
  desc "Ainkrad agentic OS CLI"
  homepage "https://github.com/AinkradHQ/AinkradKit"
  version "0.3.0"
  url "https://github.com/AinkradHQ/AinkradKit/releases/download/v#{version}/ainkrad-v#{version}-macos.zip"
  sha256 "cf8cb24d7201c36cef802855d8f99fa51291c8acdad2cc1ea67b79dc617b8ced"
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
