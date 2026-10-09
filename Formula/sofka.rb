class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/nklmilojevic/sofka"
  version "0.31.5"

  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6a73a5bc6855d1ea2e08d3af518475d987f7536071c8bbe554f55d12091441b2"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5078af08405fd0d6238adc508d9d94969d49501e085f4387621904e15872a1d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "16f30b884281c8ce64dd9320938ac4ceac27016d5eea98afdaeb3a374ee27182"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "609ef110522d49fbefc112553e919ebfa5443bd93b51023d94011275a1cb7005"
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
