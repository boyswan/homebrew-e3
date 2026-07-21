# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer CLI.
class E3Cli < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.10"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.10/e3-0.1.10-Darwin-arm64.tar.gz"
      sha256 "8bc6f4f05173697f25dc561d5f3c3f6138ebba840c0e4ba391160147e862032e"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.10/e3-0.1.10-Darwin-x86_64.tar.gz"
      sha256 "35e2f81a2042db68027ac728172819d8766a5a2083fe56245df1073504abfac0"
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
