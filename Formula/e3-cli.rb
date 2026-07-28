# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.16"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.16/e3-0.1.16-Darwin-arm64.tar.gz"
      sha256 "a625f5a1a7a8fce90c97b194b1c7f668b2fb4889391fba28870016ee1a4937ff"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.16/e3-0.1.16-Darwin-x86_64.tar.gz"
      sha256 "5383903b6e70ff7d0c62a732d040e2bf0c3105a1fa366f155eee5d5601bcf06b"
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
