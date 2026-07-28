# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.15"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.15/e3-0.1.15-Darwin-arm64.tar.gz"
      sha256 "e126c1fbfa3499dc04318168b5c48f96e265443c8da865738bcd5c0812cff646"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.15/e3-0.1.15-Darwin-x86_64.tar.gz"
      sha256 "99e8dcce74ea5b1f1eca9d46179cb5545b5d723f866cb201016680c878a11261"
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
