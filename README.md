# homebrew-ainkrad

The Homebrew tap for [Ainkrad](https://github.com/AinkradHQ/Ainkrad) — the desktop
app and the `ainkrad` CLI.

```
brew tap AinkradHQ/ainkrad
```

> Moved to the `AinkradHQ` org on 2026-09-07 (previously `AhmedMElhalaby/ainkrad`, and
> `homebrew-tap` before 2026-08-02). GitHub redirects the old paths, so an existing tap keeps
> working — it will just still be *called* by its old name locally. To move to the new name:
> `brew untap AhmedMElhalaby/ainkrad && brew tap AinkradHQ/ainkrad`.
> Nothing already installed is removed by that.

## The desktop app

```
brew install --cask ainkrad
brew upgrade --cask ainkrad
```

## The CLI

```
brew install AinkradHQ/ainkrad/ainkrad
```

## Unsigned builds

Releases are currently **unsigned and un-notarized** — Developer-ID enrollment is pending
(AIN-135). Two consequences:

- **The app.** The cask strips the quarantine flag in its postflight, which is the same
  thing you would do by hand with
  `xattr -dr com.apple.quarantine "/Applications/Ainkrad.app"`. What you are trusting is
  this tap and the GitHub release it points at, verified by SHA-256 — not Apple's
  notarization service. An unsigned host also cannot verify *plugin* signatures at runtime,
  which the app states plainly on its App Store surface; plugin downloads are still checked
  against the catalog's SHA-256, so the bytes match what was published.
- **The CLI.** If Gatekeeper refuses it, clear the attribute yourself:

  ```
  xattr -d com.apple.quarantine "$(brew --prefix)/bin/ainkrad" 2>/dev/null || true
  ```

  Or take the release asset directly:

  ```
  curl -LO https://github.com/AinkradHQ/AinkradKit/releases/download/<version>/ainkrad-<version>-macos.zip
  unzip ainkrad-<version>-macos.zip
  xattr -d com.apple.quarantine ainkrad
  ./ainkrad --help
  ```

Once enrollment lands, `AinkradKit/scripts/release-cli.sh --notarize` will notarize and
staple with no change to this tap.

## Contents

| File | What it is | Written by |
|---|---|---|
| `Casks/ainkrad.rb` | the desktop app `.dmg` | `Ainkrad/scripts/release.sh` |
| `Formula/ainkrad.rb` | the precompiled `ainkrad` CLI | `AinkradKit/scripts/release-cli.sh` |

Both have their `version`, `url` and `sha256` overwritten by those scripts on every
release — change them there, not here.
