class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/nklmilojevic/sofka"
  version "0.20.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "aa2f5dc8c9ac16ab047d6b26d5c9a6f8558647cca48d1a7b4b09762ced307347"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "998d9fdc682485f12ff930a41cdd670952d497c78c208ad73424fb2f149238a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f38b66cfccbdf5b5f7cd53b558faf8bd2022f52cf6b7dcb2f0b2b2b1501f50b7"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcc2cadcd77e6e3bd7a16b68130abd3d8d4ccde49165d8e6aa06d1a8cfc42f5f"
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
