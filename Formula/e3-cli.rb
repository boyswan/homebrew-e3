# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.20/e3-0.1.20-Darwin-arm64.tar.gz"
      sha256 "d92fc311dbccd5e515989c18e68e2cdb365b71f126de64e019b798c5c769fdec"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.20/e3-0.1.20-Darwin-x86_64.tar.gz"
      sha256 "6f277e1fa84c82214f7f9467e2bdcfa99ade421a569edd0ef4c7afa0562685c6"
    end
  end

  def install
    bin.install "e3"
    pkgshare.install "config.example.yaml"
  end

  test do
    assert_match "e3 #{version}", shell_output("#{bin}/e3 --version")
  end
end
