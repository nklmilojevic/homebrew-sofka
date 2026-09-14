class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/nklmilojevic/sofka"
  version "0.27.2"
  revision 1
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin-licenses.tar.gz"
      sha256 "034d91de9858ab75f3fa65e563a8a753f16e7abd730b0f340fa51a2d4da1ac90"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin-licenses.tar.gz"
      sha256 "a87003d918c2d9e0d3920a903850079cf848e13682b2d746dfbdd23ca9432874"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu-licenses.tar.gz"
      sha256 "9e00aedda9c35d2f172c4a4903d406693a98080650f2cc9181c79a5bde400a2d"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu-licenses.tar.gz"
      sha256 "9b02d5e840b1195d9166390c3b1b0db03642a0809df8ac0f91a5306af58a82ae"
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
