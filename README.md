<div align="center">

# Homebrew Tap: emacs-builds

[![Build status](https://img.shields.io/github/actions/workflow/status/jimeh/homebrew-emacs-builds/update-casks.yml?style=flat&label=build&logo=github&logoColor=white)](https://github.com/jimeh/homebrew-emacs-builds/actions)
[![GitHub issues](https://img.shields.io/github/issues-raw/jimeh/homebrew-emacs-builds?style=flat&logo=github)](https://github.com/jimeh/homebrew-emacs-builds/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr-raw/jimeh/homebrew-emacs-builds?style=flat&logo=github)](https://github.com/jimeh/homebrew-emacs-builds/pulls)

*Homebrew tap for binary builds of Emacs provided by
[jimeh/emacs-builds](https://github.com/jimeh/emacs-builds).*

</div>

## Install Tap

```
brew tap jimeh/emacs-builds
```

## Casks

The following Homebrew Casks are provided by this Homebrew Tap:

- `emacs-app` — Latest official release of Emacs:
  ```
  brew install jimeh/emacs-builds/emacs-app
  ```
- `emacs-app-pretest` — Latest pretest build of Emacs based on pretest git tags:
  ```
  brew install jimeh/emacs-builds/emacs-app-pretest
  ```
- `emacs-app-monthly` — Build of `master` branch updated 1st of each month:
  ```
  brew install jimeh/emacs-builds/emacs-app-monthly
  ```
- `emacs-app-nightly` — Latest nightly build of Emacs' `master` branch:
  ```
  brew install jimeh/emacs-builds/emacs-app-nightly
  ```
- `emacs-app-good` — Latest "known good" nightly build of Emacs, as tracked by
  [jimeh/emacs-builds#7](https://github.com/jimeh/emacs-builds/issues/7):
  ```
  brew install jimeh/emacs-builds/emacs-app-good
  ```

### Deprecated

The following Casks are deprecated, and no longer updated:

- `emacs-app-nightly-28` — Nightly builds of Emacs' `emacs-28` branch.
- `emacs-app-nightly-29` — Nightly builds of Emacs' `emacs-29` branch.

## Apple Silicon

As of 2024-11-30, all builds include both Apple Silicon (arm64) and Intel
(x86_64) artifacts.
