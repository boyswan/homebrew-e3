# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.14"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.14/e3-0.1.14-Darwin-arm64.tar.gz"
      sha256 "42d94b1935b49d943c7d3ddb2cb6d66a3089fb82c39490acc3f8d1c5cb06aaa5"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.14/e3-0.1.14-Darwin-x86_64.tar.gz"
      sha256 "f8e3ab8cd9e55ee68f3f48d2d9a26d78e74aef128add1f7464f31290331e21bc"
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
