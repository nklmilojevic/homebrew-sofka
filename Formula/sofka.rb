class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/nklmilojevic/sofka"
  version "0.20.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ebe2369ff110f586c34bb2eb895d161832d0a71250768eb41834df58cff1d563"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b931d823b38e41757c2aee7e4ac1683c918a4739066d4c06ef19d250cfbd8050"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "223a42cf6ffb08c66306bf4d0ca6e8ac8059c030ea888a9f974e8e2856ba7a03"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a3311edc44bd22ec802ef60e777dcede704a571e958e8e3c21d45bf3c4a74d5"
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
