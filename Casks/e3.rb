# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.18"

  on_arm do
    sha256 "fb29bfc13efc0c7d45e3e59d00520708e2ade72081c950b963df8f2efeb0ad01"

    url "https://github.com/boyswan/e3/releases/download/v0.1.18/e3-0.1.18-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "84ef6eae3f84dfaf4f94449af1da4cb2ee67fc9f789b5dd5cc118dc15743756c"

    url "https://github.com/boyswan/e3/releases/download/v0.1.18/e3-0.1.18-Darwin-x86_64-app.zip"
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
