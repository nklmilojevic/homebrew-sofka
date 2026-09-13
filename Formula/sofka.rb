class Sofka < Formula
  desc "Kubernetes TUI, reimagined in Rust"
  homepage "https://github.com/nklmilojevic/sofka"
  version "0.27.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "849ab7aa810d8c7986e9818adde59dc228dd936aac93bb6ca8bcff9f2f82d220"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d226366214b9ad359f539ef84a679f6b4174f3d218973d97968e7ede6c40b9f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b60aa555d5f64fdeb5463ea4bab58f28954d8f0f54e5ddd0663e1d102b7c3eb"
    end
    on_intel do
      url "https://github.com/nklmilojevic/sofka/releases/download/v#{version}/sofka-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12c1e29e774eb43c490ba9829b886da61d053b69d8907782a7537fbdddd6336f"
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
