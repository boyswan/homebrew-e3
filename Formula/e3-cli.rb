# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.8"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.8/e3-0.1.8-Darwin-arm64.tar.gz"
      sha256 "82f4602ef5d5e305cba6d5961c5d7cd18fcbae1719b492463d7d4d807e19f67e"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.8/e3-0.1.8-Darwin-x86_64.tar.gz"
      sha256 "6108621a2c6ed854dc36854af6da50ab866d529402eb35529efc1a61e14d65ea"
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
