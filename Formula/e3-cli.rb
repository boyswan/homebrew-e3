# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.12"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.12/e3-0.1.12-Darwin-arm64.tar.gz"
      sha256 "79d3a1a1b8720b111b0e7d9cf94fcb221cec0b8d3136f5e5c011628b527d185a"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.12/e3-0.1.12-Darwin-x86_64.tar.gz"
      sha256 "909d2af05d38269519e7510e81cd52c59c973aa00e85ce253b617165bc26bc3f"
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
