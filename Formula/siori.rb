class Siori < Formula
  desc "A simple Git TUI for vibe coders"
  homepage "https://github.com/takuma-ogura/siori"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.3/siori-aarch64-apple-darwin.tar.gz"
      sha256 "b07786a4060152f8638ef365275710ca85f029c90e5cc9c29d5c79affbfad80f"
    end
    on_intel do
      # Intel Mac: build from source
      url "https://github.com/takuma-ogura/siori.git", tag: "v0.1.3"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.3/siori-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48d8503b01a6d761a7c69d15b4cbed86f46641a8e7dc54d0e74bd13e4efb1c47"
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
