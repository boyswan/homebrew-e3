# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.4"

  on_arm do
    sha256 "59dcc78d0fac7bd1a1a9ff578d208e75cb77e5733ecbde94f425de84ba404359"

    url "https://github.com/boyswan/e3/releases/download/v0.1.4/e3-0.1.4-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "7f27af72b9262114beeba8d6fde0a69458527a07f3dbe07df7ef6e5b84aca47e"

    url "https://github.com/boyswan/e3/releases/download/v0.1.4/e3-0.1.4-Darwin-x86_64-app.zip"
  end

  name "e3"
  desc "I3-inspired terminal multiplexer"
  homepage "https://github.com/boyswan/e3"

  depends_on macos: :ventura

  app "e3.app"

  postflight do
    # Remove quarantine until release builds can be Apple-notarized. The
    # archive remains SHA-256 pinned by this trusted tap.
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{appdir}/e3.app"
  end

  caveats <<~EOS
    This build is ad-hoc signed but not Apple-notarized. The trusted cask
    removes its quarantine attribute after verifying the pinned SHA-256.

    User configuration is loaded from ~/.config/e3/config.yaml or
    ~/Library/Application Support/e3/config.yaml.
  EOS
end
