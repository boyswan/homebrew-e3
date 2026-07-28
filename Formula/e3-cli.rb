# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.17"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.17/e3-0.1.17-Darwin-arm64.tar.gz"
      sha256 "79553d1cef9d7a1eec4183837448571e4719cc4d9a13c81c0418ee917b5404e0"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.17/e3-0.1.17-Darwin-x86_64.tar.gz"
      sha256 "8ace3604f6fc7fa7adfae5470bbbc47ed4ae6b9cc350647abafd8cf1a2f58adf"
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
