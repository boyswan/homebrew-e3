# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.21/e3-0.1.21-Darwin-arm64.tar.gz"
      sha256 "999dbcb0fa2281efa74f44a22fee9a90e2a4314569deccd49b45ec77b2981b44"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.21/e3-0.1.21-Darwin-x86_64.tar.gz"
      sha256 "8cc1f1028404c6c023a883d0ba74fcb3d692e0aab3e6676376de8ee729a045ce"
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
