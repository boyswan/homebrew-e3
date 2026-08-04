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
      url "https://github.com/boyswan/e3/releases/download/v0.1.26/e3-0.1.26-Darwin-arm64.tar.gz"
      sha256 "ab4d48babaf0547dfc46e1d0e98749149be3cbe00b1eafcca912ab9b9a8ca142"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.26/e3-0.1.26-Darwin-x86_64.tar.gz"
      sha256 "f2023d8b8ea54a5d360ad508edb9393b2ef489147beaaac3d408fc089bb2bf3b"
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
