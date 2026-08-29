#!/usr/bin/env bash
# Regenerates Formula/sofka.rb for the given release tag (e.g. v0.18.3) by
# downloading the release tarballs and recomputing their checksums.
set -euo pipefail

tag="${1:?usage: bump.sh vX.Y.Z}"
version="${tag#v}"
repo="nklmilojevic/sofka"
base="https://github.com/${repo}/releases/download/${tag}"

declare -A sha
for target in aarch64-apple-darwin x86_64-apple-darwin aarch64-unknown-linux-gnu x86_64-unknown-linux-gnu; do
  asset="sofka-${tag}-${target}.tar.gz"
  curl -fsSL -o "/tmp/${asset}" "${base}/${asset}"
  sha[$target]="$(sha256sum "/tmp/${asset}" | cut -d' ' -f1)"
done

cat > Formula/sofka.rb <<EOF
class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/${repo}"
  version "${version}"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/${repo}/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "${sha[aarch64-apple-darwin]}"
    end
    on_intel do
      url "https://github.com/${repo}/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "${sha[x86_64-apple-darwin]}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/${repo}/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "${sha[aarch64-unknown-linux-gnu]}"
    end
    on_intel do
      url "https://github.com/${repo}/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "${sha[x86_64-unknown-linux-gnu]}"
    end
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end

  def install
    bin.install "sofka"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sofka --version")
  end
end
EOF
