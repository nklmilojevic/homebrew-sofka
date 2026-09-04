class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/nklmilojevic/sofka"
  version "0.21.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "633b51b2c1ba32ba50bf7b685daf555f37caf2d73fd178121255b40d4f58ae36"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cb44fc227b81439fd0c204ba6037b387c7427224cbd5c099099a31cf154a2eb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "498fd7bff8e1008e725cbfb95053164c78339f20f1ed3819a99892f2905fe42b"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0db9ae28f6cf3ef186d5c5732eb21f8f79ab20f6bc6f76241ce170a782a8e517"
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
