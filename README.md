# deadhearth01/tap

Homebrew tap for [Mitosis](https://github.com/deadhearth01/Mitosis): run separate copies of your Mac apps, each with its own login, data, and Dock icon.

```bash
brew install --cask deadhearth01/tap/mitosis
```

Requires macOS 15 or later on Apple silicon. Mitosis is free and isn't notarized (it's built without a paid Apple Developer account), so the cask clears macOS's download quarantine after installing. Your clones and their data are never touched by `brew uninstall` or `--zap`.

Update with `brew upgrade --cask mitosis`. Mitosis also checks for updates itself (Settings > General).
