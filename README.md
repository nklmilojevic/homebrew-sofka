# homebrew-sofka

Homebrew tap for [sofka](https://github.com/nklmilojevic/sofka), a Kubernetes
TUI written in Rust.

## Install

```sh
brew install nklmilojevic/sofka/sofka
```

Installs a prebuilt binary from the latest [release](https://github.com/nklmilojevic/sofka/releases)
— macOS and Linux, arm64 and x86_64.

## Upgrade

```sh
brew upgrade sofka
```

The formula is bumped automatically: a [workflow](.github/workflows/bump.yaml)
checks for new sofka releases every 6 hours and regenerates
[`Formula/sofka.rb`](Formula/sofka.rb) with fresh checksums via
[`scripts/bump.sh`](scripts/bump.sh).
