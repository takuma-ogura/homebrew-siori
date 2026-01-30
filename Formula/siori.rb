class Siori < Formula
  desc "A simple Git TUI for vibe coders"
  homepage "https://github.com/takuma-ogura/siori"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.0/siori-aarch64-apple-darwin.tar.gz"
      sha256 "71bd3b6b3d933d19b312a359a140d4a5a51d5d42013428570e93eba867c386e4"
    end
    on_intel do
      url "https://github.com/takuma-ogura/siori.git", tag: "v0.1.0"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.0/siori-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4dd1d52f2ccf88df702c0c36bfdaf160a976d68c123795a2446216365f14cad8"
    end
  end

  def install
    if Hardware::CPU.intel? && OS.mac?
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    else
      bin.install "siori"
    end
  end

  test do
    system "#{bin}/siori", "--help"
  end
end
