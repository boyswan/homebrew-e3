# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.20"

  on_arm do
    sha256 "e11391391cd79ce6e89117fd3e41e2d411078d4c5efd85b3328aa7979e7801a2"

    url "https://github.com/boyswan/e3/releases/download/v0.1.20/e3-0.1.20-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "391bd5631c0510ab80cd619796dbe24c8025878621444d89af2747abb91c1ead"

    url "https://github.com/boyswan/e3/releases/download/v0.1.20/e3-0.1.20-Darwin-x86_64-app.zip"
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
