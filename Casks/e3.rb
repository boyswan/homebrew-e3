# typed: strict
# frozen_string_literal: true

cask "e3" do
  version "0.1.22"

  on_arm do
    sha256 "548c23bc1519642f2264e7698bf9ca913691dc9d2997310777a162f2343213a5"

    url "https://github.com/boyswan/e3/releases/download/v#{version}/e3-#{version}-Darwin-arm64-app.zip"
  end
  on_intel do
    sha256 "c78918bc2bd87decf0d1d81c3b8bbe28e4973565bc4411890645eab810ad427b"

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
