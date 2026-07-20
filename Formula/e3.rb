# typed: strict
# frozen_string_literal: true

# Formula for the e3 terminal multiplexer.
class E3 < Formula
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"
  version "0.1.4"
  license "MIT"

  depends_on :macos
  depends_on "sdl3"
  depends_on "sdl3_ttf"

  on_macos do
    on_arm do
      url "https://github.com/boyswan/e3/releases/download/v0.1.4/e3-0.1.4-Darwin-arm64.tar.gz"
      sha256 "03ab9574bcb70d211db91b302ca787421811ffb0ddf3c6a3d6a03fa638a3abe7"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.4/e3-0.1.4-Darwin-x86_64.tar.gz"
      sha256 "be411773582d3b3f858c8b022bf64ef5a36d9fe94873120d9e0d6af754098bf6"
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
