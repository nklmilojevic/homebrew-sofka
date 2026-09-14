#!/usr/bin/env bash
# Regenerates Formula/sofka.rb for the given release tag (e.g. v0.18.3) by
# downloading the release tarballs and recomputing their checksums.
set -euo pipefail

tag="${1:?usage: bump.sh vX.Y.Z}"
if ! [[ "$tag" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid release tag: $tag" >&2
  exit 1
fi
version="${tag#v}"
repo="nklmilojevic/sofka"
base="https://github.com/${repo}/releases/download/${tag}"

corrected="$(gh release view "$tag" --repo "$repo" --json assets \
  --jq '[.assets[].name | select(endswith("-licenses.tar.gz"))] | length')"
archive_suffix=""
revision_line=""
if [[ "$corrected" == 4 ]]; then
  archive_suffix="-licenses"
  revision_line="  revision 1"
elif [[ "$corrected" != 0 ]]; then
  echo "The release has an incomplete set of license corrections" >&2
  exit 1
fi

declare -A sha
for target in aarch64-apple-darwin x86_64-apple-darwin aarch64-unknown-linux-gnu x86_64-unknown-linux-gnu; do
  asset="sofka-${tag}-${target}${archive_suffix}.tar.gz"
  curl -fsSL -o "/tmp/${asset}" "${base}/${asset}"
  sha[$target]="$(sha256sum "/tmp/${asset}" | cut -d' ' -f1)"
done

cat > Formula/sofka.rb <<EOF
class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/${repo}"
  version "${version}"
${revision_line}
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/${repo}/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin${archive_suffix}.tar.gz"
      sha256 "${sha[aarch64-apple-darwin]}"
    end
    on_intel do
      url "https://github.com/${repo}/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin${archive_suffix}.tar.gz"
      sha256 "${sha[x86_64-apple-darwin]}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/${repo}/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu${archive_suffix}.tar.gz"
      sha256 "${sha[aarch64-unknown-linux-gnu]}"
    end
    on_intel do
      url "https://github.com/${repo}/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu${archive_suffix}.tar.gz"
      sha256 "${sha[x86_64-unknown-linux-gnu]}"
    end
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end

  def install
    bin.install "sofka"
    pkgshare.install "LICENSE-MIT", "LICENSE-APACHE", "THIRD-PARTY-LICENSES.txt", "RUST-LICENSES.html"
    pkgshare.install "THIRD-PARTY-SOURCES" if Dir.exist?("THIRD-PARTY-SOURCES")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sofka --version")
  end
end
EOF
