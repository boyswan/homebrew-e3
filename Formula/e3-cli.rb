# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.11"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.11/e3-0.1.11-Darwin-arm64.tar.gz"
      sha256 "2a7f3a11bdac1c8f6edb3779275a2a4fd6552b6e7546df9abd7508880bd6fe1a"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.11/e3-0.1.11-Darwin-x86_64.tar.gz"
      sha256 "ff536d1513409da29a6d8a6a2909faa0d8e7c441e217bdfd5636337726525b76"
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
