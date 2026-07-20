# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer.
class E3 < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.3"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.3/e3-0.1.3-Darwin-arm64.tar.gz"
      sha256 "1b0ce71e2d47b6ec8a9748c454ae699b7122d11ddc4d6265c91610c00ac47a37"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.3/e3-0.1.3-Darwin-x86_64.tar.gz"
      sha256 "d6165d3c8037ee91073987a0732b41bd5d27a8cc67d442665a77bbf336074d81"
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
