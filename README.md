# Homebrew tap for e3

Install the [e3](https://github.com/boyswan/e3) macOS application:

```sh
brew tap boyswan/e3
brew trust boyswan/e3
brew install --cask e3
open -a e3
```

The CLI/TTY formula is available separately:

```sh
brew install --formula e3-cli
```

Upgrade later with:

```sh
brew update
brew upgrade --cask e3
brew upgrade --formula e3-cli  # if installed
```

Release builds are ad-hoc signed but not yet Apple-notarized. After verifying the pinned SHA-256, the trusted cask removes the app's quarantine attribute so it can launch normally.
