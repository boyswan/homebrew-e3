# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.16"

  on_arm do
    sha256 "f7f467dc21644c89718626816970d64adcbf49ec149619c4c046befb5db09b41"

    url "https://github.com/boyswan/e3/releases/download/v0.1.16/e3-0.1.16-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "751329d2ee3a0f586dfab7dc900e98b12010070bfde1a3fdc45086a2f37aded5"

    url "https://github.com/boyswan/e3/releases/download/v0.1.16/e3-0.1.16-Darwin-x86_64-app.zip"
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
