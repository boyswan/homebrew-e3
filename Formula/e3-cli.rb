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
      url "https://github.com/boyswan/e3/releases/download/v0.1.22/e3-0.1.22-Darwin-arm64.tar.gz"
      sha256 "d083b11f710e8f4c6fcc4ba26cfc2d8a05df6c74893ab149303a2aec52eb3c69"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.22/e3-0.1.22-Darwin-x86_64.tar.gz"
      sha256 "08624b41899de5fc94137639bb9227867f4f89c3fb8e397d4b8d11aa079e65c8"
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
