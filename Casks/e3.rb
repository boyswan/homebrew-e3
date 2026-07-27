# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.12"

  on_arm do
    sha256 "7e58100fa8a242c709d23474f159e7d4885e0041167ea9f050498b4652ea19bd"

    url "https://github.com/boyswan/e3/releases/download/v0.1.12/e3-0.1.12-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "290a79489191e8610ed61fa3efcde3bd7ef84dd549045a9059bf3d877afb6372"

    url "https://github.com/boyswan/e3/releases/download/v0.1.12/e3-0.1.12-Darwin-x86_64-app.zip"
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
