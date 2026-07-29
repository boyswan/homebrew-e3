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
      url "https://github.com/boyswan/e3/releases/download/v0.1.24/e3-0.1.24-Darwin-arm64.tar.gz"
      sha256 "df5c107fa995c8297f183ef9229be6c363e871b5a6c17a5635897e359cac3858"
    end

    on_intel do
      url "https://github.com/boyswan/e3/releases/download/v0.1.24/e3-0.1.24-Darwin-x86_64.tar.gz"
      sha256 "f91e8d7206179457be7fda3417beb1a3b7a58098e90b9d8e828dba131340702c"
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
