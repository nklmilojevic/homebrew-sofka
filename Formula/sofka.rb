class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/nklmilojevic/sofka"
  version "0.34.0"

  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "dff9ee7d16757f6b0c83a788e750aeeeff49518b3dde4370266ca337fde4eed1"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "137323c5501dd5b89a361c073a258c979515dc13392b72b5112b7e34bc740204"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47f9459bac9076a2eb2a604e78b8129fad011378937e5782ad7bd034b4e88289"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "afa9e37662be8f3804b7a890e0fb78bbe7afcea798bcb2c584c390fae8761ecd"
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
