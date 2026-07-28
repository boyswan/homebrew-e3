# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.14"

  on_arm do
    sha256 "8847b3c22435cc4d76807fc1fc9c447b5c8362f2141823a2ba1e0dae8959332a"

    url "https://github.com/boyswan/e3/releases/download/v0.1.14/e3-0.1.14-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "ea1200d4ebb6ac4121bbeedd91a4eb4ddd6378d36c24bc48b902d6a45585020a"

    url "https://github.com/boyswan/e3/releases/download/v0.1.14/e3-0.1.14-Darwin-x86_64-app.zip"
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
