class Siori < Formula
  desc "A simple Git TUI for vibe coders"
  homepage "https://github.com/takuma-ogura/siori"
  version "0.1.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.19/siori-aarch64-apple-darwin.tar.gz"
      sha256 "b9154230e88922bb3dbd378c796b912cccb2b9e4e02170ac5a248a1e5bad01b6"
    end
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.19/siori-x86_64-apple-darwin.tar.gz"
      sha256 "62a63f7fb61cfbf2904d152c7b45017eba71257e0adabfe381f8f0a054146f5c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/takuma-ogura/siori/releases/download/v0.1.19/siori-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9edd26ad5a57b2824efc8531365d04b5a926da5047c457f9b34e789ebd314c0"
    end
  end

  def install
    bin.install "siori"
  end

  test do
    assert_match "siori", shell_output("#{bin}/siori --help")
  end
end
