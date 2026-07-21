# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.7"

  on_arm do
    sha256 "fa7bbbb13b8155a36e43484001b9d8d325b635dcb41c70e7d8ccf5821addfa91"

    url "https://github.com/boyswan/e3/releases/download/v0.1.7/e3-0.1.7-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "27be267a3882425bef2637fa3ce3b68534203751133867def1a172f41e7876ab"

    url "https://github.com/boyswan/e3/releases/download/v0.1.7/e3-0.1.7-Darwin-x86_64-app.zip"
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
