class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/nklmilojevic/sofka"
  version "0.31.14"

  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1082ad8d0258b4b607b4366beb3bb25e4eb17662606d8b380fff45a482220eee"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "14671528574bac02cee4e999357eced643a7ef249d2c084edc3674ca35b98048"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee6aae697f83634ea7e47803c2032e6cde3424dd2f7266d9a3054ff3c383a427"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e9823c085ce1ed49db285b220a15e5e2888fae8b96efa4959ca5707a2088a195"
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
