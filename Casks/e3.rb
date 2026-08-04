# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.26"

  on_arm do
    sha256 "e4a36efd2305e9b0bebc9b193ef80f52e2dfbbdb4c514f69c6173c62e3b4e99e"

    url "https://github.com/boyswan/e3/releases/download/v#{version}/e3-#{version}-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "8ddb0673a283650d42357bff44ac3d166439905987cc9da5273f9da7bb280aeb"

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
