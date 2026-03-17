class Siori < Formula
  desc "A simple Git TUI for vibe coders"
  homepage "https://github.com/takuma-ogura/siori"
  version "0.1.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.18/siori-aarch64-apple-darwin.tar.gz"
      sha256 "c8654e858ca57fd2393e2483fc88a5df2e22a7da72a9ee84127a1b59fe83f36f"
    end
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.18/siori-x86_64-apple-darwin.tar.gz"
      sha256 "2de159ae72e11480765c7a556f2808f5c2418511b94d6c5800d84553e46cf1e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.18/siori-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44a8e1f75bafae04154c384aefdd4877f3c6191a376b4990dde8ebb9f001b4a6"
    end
  end

  def install
    bin.install "siori"
  end

  test do
    assert_match "siori", shell_output("#{bin}/siori --help")
  end
end
