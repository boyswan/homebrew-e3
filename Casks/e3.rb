# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.25"

  on_arm do
    sha256 "4739184dfbeccd817117d3d20fcf676186ede710620945c0845d1235fac86fd3"

    url "https://github.com/boyswan/e3/releases/download/v#{version}/e3-#{version}-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "ec1283819c8394c35f0c6ad731b9c0e0bf6d61510222632e2b3e221169e37337"

    url "https://github.com/boyswan/e3/releases/download/v#{version}/e3-#{version}-Darwin-x86_64-app.zip"
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
