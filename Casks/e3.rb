# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.17"

  on_arm do
    sha256 "494741b0c41668f8c82b0f0b6142d58169e1880fbf0bdf72b02917402bafb4b0"

    url "https://github.com/boyswan/e3/releases/download/v0.1.17/e3-0.1.17-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "16be7415f3f769e7a0c347dc3db351adb8831299340ce36acd9930cf3cb96a99"

    url "https://github.com/boyswan/e3/releases/download/v0.1.17/e3-0.1.17-Darwin-x86_64-app.zip"
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
