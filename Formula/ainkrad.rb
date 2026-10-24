class Ainkrad < Formula
  desc "Ainkrad agentic OS CLI"
  homepage "https://github.com/AinkradHQ/AinkradKit"
  version "0.5.0"
  url "https://github.com/AinkradHQ/AinkradKit/releases/download/v0.5.0/ainkrad-v0.5.0-macos.zip"
  sha256 "fd99a00c39fa3e6c5e36595f302c1ee1334ff0cac27b1488bca42272395da933"
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
