# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.13"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.13/e3-0.1.13-Darwin-arm64.tar.gz"
      sha256 "894335e9532095c32a9634852b924598d5d82508a425ea5881ef3d44c05c277d"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.13/e3-0.1.13-Darwin-x86_64.tar.gz"
      sha256 "a5402bf118d1169e73fe79367378142970089e12ef4184668a49136facdcb15e"
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
