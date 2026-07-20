# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer.
class E3 < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.0"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.0/e3-0.1.0-Darwin-arm64.tar.gz"
      sha256 "8f15d5863cbc11af9c4bf511e555350b08d2f4177ffd88161480d0a5cbcb0fe4"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.0/e3-0.1.0-Darwin-x86_64.tar.gz"
      sha256 "0a101467a459b195a4f26756753a39d3fa23ca1bdae66133202489bfa6653a29"
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
