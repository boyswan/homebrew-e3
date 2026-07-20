# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer.
class E3 < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.2"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.2/e3-0.1.2-Darwin-arm64.tar.gz"
      sha256 "55ae305afafe13f4a3cbd5dc22eac0e5337f240c797082e7c8b9bbc7014bd16d"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.2/e3-0.1.2-Darwin-x86_64.tar.gz"
      sha256 "d30ce69529e34188d495d1b5b4805eb82db75536854d90e98eecad09cf715277"
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
