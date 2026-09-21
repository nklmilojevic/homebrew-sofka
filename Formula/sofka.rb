class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/nklmilojevic/sofka"
  version "0.28.4"

  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4860ccf1e146958687f74c485a2fc970c699575e4d144b204f86d3b624159820"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e1e5fb4c7f84a669e98e3dc5a785101cab38cf18b56f5e26147e2fdb1bc9788c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "847ca034d737b0bd05420126f332a2e5fb04f439a95ec0439e2d092ca3c58319"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bab2a28cca71b895007bf47eb1227e709b06331ab310eec4dc6c06d985229a27"
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
