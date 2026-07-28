# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.19"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.19/e3-0.1.19-Darwin-arm64.tar.gz"
      sha256 "7ad39d3de8ca987ec6d81304bf85fc790b30d449eab85a7451cb04dddf30c369"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.19/e3-0.1.19-Darwin-x86_64.tar.gz"
      sha256 "81c1de04e61575d35d2abdeb9bf9ac2d4e2285c4a64d701485b39ce0c31287de"
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
