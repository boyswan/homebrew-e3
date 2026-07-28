# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.13"

  on_arm do
    sha256 "80ad29c6359c7805179f338558057042ef80ac7497de51908678ef40df95b716"

    url "https://github.com/boyswan/e3/releases/download/v0.1.13/e3-0.1.13-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "21f8f2c8c90d54a5b35d4ba01c27d9556d703d1d020ee2cf5e8dfda90bc7586e"

    url "https://github.com/boyswan/e3/releases/download/v0.1.13/e3-0.1.13-Darwin-x86_64-app.zip"
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
