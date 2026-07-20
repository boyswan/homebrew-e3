# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer.
class E3 < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.1"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.1/e3-0.1.1-Darwin-arm64.tar.gz"
      sha256 "3cbe13b5684ed9a608aa146bcbac9dd1c0d475381407ced6370fc06ce106f37a"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.1/e3-0.1.1-Darwin-x86_64.tar.gz"
      sha256 "3856598f38eeafc2ab0616392a6794cb9ff9845691a2ea0531da6d965e7463fd"
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
