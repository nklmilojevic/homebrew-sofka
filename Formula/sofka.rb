class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/nklmilojevic/sofka"
  version "0.21.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7359df6f1c9214bd245544ffe89471fc9076b4331f36e609a053cb28bcc68338"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9f8ec843b72dc83782e42e3553897bac806ada6b9176c7096289cf6a2a229994"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "357de921d645aa1294ad3b83719963bb6dfdb81ef67722a56745798378c0d10e"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30157ae11ae2a1a03bc1539d7f3e6c2169b061b4ff799659457684f68d2990ca"
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
