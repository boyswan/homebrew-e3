# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.10"

  on_arm do
    sha256 "34bbbfc5c9c823e0c93cedf7d01313ca3a36b6a8101f5ea768b054b3e7cc6f92"

    url "https://github.com/boyswan/e3/releases/download/v0.1.10/e3-0.1.10-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "146588a59ff60dbc04d0754478b4df47acf82711df645855159ba2309db782ff"

    url "https://github.com/boyswan/e3/releases/download/v0.1.10/e3-0.1.10-Darwin-x86_64-app.zip"
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
