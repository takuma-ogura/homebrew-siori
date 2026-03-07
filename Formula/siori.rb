class Siori < Formula
  desc "A simple Git TUI for vibe coders"
  homepage "https://github.com/takuma-ogura/siori"
  version "0.1.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.14/siori-aarch64-apple-darwin.tar.gz"
      sha256 "52c681627d9fc1acb7344def6b2d594b3c44a652ab92f18a2be821c55c254544"
    end
    on_intel do
      # Intel Mac: build from source
      url "https://github.com/takuma-ogura/siori.git", tag: "v0.1.14"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.14/siori-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fbef02a293e8f580052931f3c94ba818880b17aaaac5af217855edf7303f03dd"
    end
  end

  def install
    if build.head? || (Hardware::CPU.intel? && OS.mac?)
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    else
      bin.install "siori"
    end
  end

  test do
    assert_match "siori", shell_output("#{bin}/siori --help")
  end
end
