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
      url "https://github.com/boyswan/e3/releases/download/v0.1.23/e3-0.1.23-Darwin-arm64.tar.gz"
      sha256 "d4bfb6899d4240fbdfd78cd5db9c757bf520b25f7a151f0c8e478feb2da1a516"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.23/e3-0.1.23-Darwin-x86_64.tar.gz"
      sha256 "b626f963ee47f8194281ba58917d8caa010fcf1adfd7d61442f23b20af85ebb7"
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
