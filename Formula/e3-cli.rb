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
      url "https://github.com/boyswan/e3/releases/download/v0.1.25/e3-0.1.25-Darwin-arm64.tar.gz"
      sha256 "3768fe0fb069d2d131a5262ef09e3381ff6549ece89f10d0f91db0e8bd04cc0e"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.25/e3-0.1.25-Darwin-x86_64.tar.gz"
      sha256 "fce0b3c19c368d7ed4d67d105e36eb229c59911fa30e2655a35645fe8b4db126"
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
