# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.7"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.7/e3-0.1.7-Darwin-arm64.tar.gz"
      sha256 "0753bbea0208439046c4230a6492e337ad7367cbd2d6b882bcae18271a0a3979"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.7/e3-0.1.7-Darwin-x86_64.tar.gz"
      sha256 "1ce3cdfac2eb2612985b77529aebe957737113178d7a24811d1cec9aad3451d6"
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
