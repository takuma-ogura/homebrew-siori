class Siori < Formula
  desc "A simple Git TUI for vibe coders"
  homepage "https://github.com/takuma-ogura/siori"
  version "0.1.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.12/siori-aarch64-apple-darwin.tar.gz"
      sha256 "f0618224a340bc73bba008171c0cb2c1636852a6bf1bfd8452396832b3b61103"
    end
    on_intel do
      # Intel Mac: build from source
      url "https://github.com/takuma-ogura/siori.git", tag: "v0.1.12"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.12/siori-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c234d1d3695ba7992366a61ccd925bd2135c548e6f090842cf451a6b61b9e2f5"
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
