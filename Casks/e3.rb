# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.9"

  on_arm do
    sha256 "82c08364621a6fa888b6687abcba9ff13190cc673af8657fddc11d9b099cbd6b"

    url "https://github.com/boyswan/e3/releases/download/v0.1.9/e3-0.1.9-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "f0fe0662735652ad6bbd9ffca2b0ea3106e18273c909a06efe1ebb34938eff29"

    url "https://github.com/boyswan/e3/releases/download/v0.1.9/e3-0.1.9-Darwin-x86_64-app.zip"
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
