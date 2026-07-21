# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.8"

  on_arm do
    sha256 "976430065859dd496609987236c502dcef7d961a0c342cc0feb514312310bafb"

    url "https://github.com/boyswan/e3/releases/download/v0.1.8/e3-0.1.8-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "aec1307cad18e42992cf4c4b370246bdab94c621370d16d22b8d261f7fe440b0"

    url "https://github.com/boyswan/e3/releases/download/v0.1.8/e3-0.1.8-Darwin-x86_64-app.zip"
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
