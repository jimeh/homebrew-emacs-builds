<h1 align="center">
  Homebrew Tap: emacs-builds
</h1>

<p align="center">
  <a href="https://github.com/jimeh/homebrew-emacs-builds/actions"><img alt="Build status" src="https://img.shields.io/github/actions/workflow/status/jimeh/homebrew-emacs-builds/update-casks.yml?style=flat&label=build&logo=github&logoColor=white"></a>
  <a href="https://github.com/jimeh/homebrew-emacs-builds/issues"><img alt="GitHub issues" src="https://img.shields.io/github/issues-raw/jimeh/homebrew-emacs-builds?style=flat&logo=github"></a>
  <a href="https://github.com/jimeh/homebrew-emacs-builds/pulls"><img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr-raw/jimeh/homebrew-emacs-builds?style=flat&logo=github"></a>
</p>

<p align="center">
  <strong>
    Homebrew tap for binary builds of Emacs provided by
    <a href="https://github.com/jimeh/emacs-builds">jimeh/emacs-builds</a>.
  </strong>
</p>

## Install Tap

```
brew tap jimeh/emacs-builds
```

## Casks

The following Homebrew Casks are provided by this Homebrew Tap:

- `emacs-app` — Latest official release of Emacs.
- `emacs-app-pretest` — Latest pretest build of Emacs based on pretest git tags.
- `emacs-app-monthly` — Build of `master` branch updated 1st of each month.
- `emacs-app-nightly` — Latest nightly build of Emacs' `master` branch.
- `emacs-app-good` — Latest "known good" nightly build of Emacs, as tracked by
  [jimeh/emacs-builds#7](https://github.com/jimeh/emacs-builds/issues/7).

### Deprecated

The following Casks are deprecated, and no longer updated:

- `emacs-app-nightly-28` — Nightly builds of Emacs' `emacs-28` branch.
- `emacs-app-nightly-29` — Nightly builds of Emacs' `emacs-29` branch.

## Apple Silicon

As of writing (2023-11-21), only the `emacs-app-monthly` casks includes native
Apple Silicon builds. The rest are Intel-only, but can run via Rosetta on Apple
Silicon machines. The stable `emacs-app` cask will soon be updated to also
include native Apple Silicon builds.
