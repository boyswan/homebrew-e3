# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.18"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.18/e3-0.1.18-Darwin-arm64.tar.gz"
      sha256 "6e276f0f816edb0630efa0918e6ad89aa297a1e1b008f0db98915ee4468311e1"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.18/e3-0.1.18-Darwin-x86_64.tar.gz"
      sha256 "64ef0f1ae4f8998b515498c6b38f418ba86ffb550b9c91d9b6bd714b6c0c81ab"
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
