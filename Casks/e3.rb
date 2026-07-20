# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.5"

  on_arm do
    sha256 "cd63026727d8fb275b2ccba8fb2c064a2669ee963e83778e957e5419fb777a93"

    url "https://github.com/boyswan/e3/releases/download/v0.1.5/e3-0.1.5-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "835d047a83c6e620c8ac8b8b9e9616e46899a69f9bf8a3b973ee4992d116a1ee"

    url "https://github.com/boyswan/e3/releases/download/v0.1.5/e3-0.1.5-Darwin-x86_64-app.zip"
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
