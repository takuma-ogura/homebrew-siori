class Siori < Formula
  desc "A simple Git TUI for vibe coders"
  homepage "https://github.com/takuma-ogura/siori"
  version "0.1.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.17/siori-aarch64-apple-darwin.tar.gz"
      sha256 "c6e7ec5ba7a805818ad30060acc58079010e17d07074264c76c41ea00430dabe"
    end
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.17/siori-x86_64-apple-darwin.tar.gz"
      sha256 "d0eba636f877b79392494bcf8eb9132c921aad29b995b98422f02451cc0b8b20"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.17/siori-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29e3e3aa2765b4ae426c064a2f2f966d7b66597c463c258211c2575521d05399"
    end
  end

  def install
    bin.install "siori"
  end

  test do
    assert_match "siori", shell_output("#{bin}/siori --help")
  end
end
