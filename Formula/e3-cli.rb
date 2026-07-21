# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.9"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.9/e3-0.1.9-Darwin-arm64.tar.gz"
      sha256 "12956610c993ff53d9268851b7d240fca303a857d43518377b57056a72ff7762"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.9/e3-0.1.9-Darwin-x86_64.tar.gz"
      sha256 "6214f1b9a5f443281082459e3b867af0de0d7249d8dd3c285816d1a1b02e440f"
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
