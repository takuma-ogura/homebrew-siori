class Siori < Formula
  desc "A simple Git TUI for vibe coders"
  homepage "https://github.com/takuma-ogura/siori"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.4/siori-aarch64-apple-darwin.tar.gz"
      sha256 "4d6c49570792d7033e45ad7da1c72aae91ec5dd75a8aeb4a83f8aad55d7227ce"
    end
    on_intel do
      # Intel Mac: build from source
      url "https://github.com/takuma-ogura/siori.git", tag: "v0.1.4"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.4/siori-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba6a7675fb04a45229bf287e25ff75adecd559901f6971e026e9a619445566bd"
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
