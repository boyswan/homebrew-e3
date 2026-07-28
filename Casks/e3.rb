# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.15"

  on_arm do
    sha256 "7b0abf7ee36ff5de0e938edd140339cd95f6b3e5225bed5e975a364830abfdde"

    url "https://github.com/boyswan/e3/releases/download/v0.1.15/e3-0.1.15-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "81449649fa52c3e73434e5b905b6ca897e1e66d243add9b8461d4ee48b83998c"

    url "https://github.com/boyswan/e3/releases/download/v0.1.15/e3-0.1.15-Darwin-x86_64-app.zip"
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
