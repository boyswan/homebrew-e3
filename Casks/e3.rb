# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.11"

  on_arm do
    sha256 "238816bc9db21300a1b4d27fe2fa509d25090db00bc487e16cd807bc51b6aa51"

    url "https://github.com/boyswan/e3/releases/download/v0.1.11/e3-0.1.11-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "11b5ad927ba9f9e07ebe58922d17797f49a75f2e61340027aeb3de6ad5909797"

    url "https://github.com/boyswan/e3/releases/download/v0.1.11/e3-0.1.11-Darwin-x86_64-app.zip"
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
