class Siori < Formula
  desc "A simple Git TUI for vibe coders"
  homepage "https://github.com/takuma-ogura/siori"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.10/siori-aarch64-apple-darwin.tar.gz"
      sha256 "85d944e551ad1d29167bc6681130cd1d27b0d4f5506342598f6139fcdcd27a29"
    end
    on_intel do
      # Intel Mac: build from source
      url "https://github.com/takuma-ogura/siori.git", tag: "v0.1.10"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.10/siori-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8bdf6b52e4f003e54d98f2de9b3de6bdce6c43c340b9242bc13b1f5bc2a7a133"
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
