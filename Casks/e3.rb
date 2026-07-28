# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.19"

  on_arm do
    sha256 "fac7af6f649f6ac5d8c77c10d9a2969605baf8f2dfe497812fe3e1a8bb25fafe"

    url "https://github.com/boyswan/e3/releases/download/v0.1.19/e3-0.1.19-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "4571dbf5ab9bbfd3c4e761bfd6c6dd6ff9373c065987c23e22fc0bd6d497a0ed"

    url "https://github.com/boyswan/e3/releases/download/v0.1.19/e3-0.1.19-Darwin-x86_64-app.zip"
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
