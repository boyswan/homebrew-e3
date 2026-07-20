# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer.
class E3 < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.5"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.5/e3-0.1.5-Darwin-arm64.tar.gz"
      sha256 "873de7355834c9e69be756bcdd532544b2e207536eb7a3198f5860fb9d21ce08"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.5/e3-0.1.5-Darwin-x86_64.tar.gz"
      sha256 "fb523f6442ccc375f74d06a26f65504cdbcf33ff95717990e5902afe18208112"
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
