class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "16.1.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v16.1.0/fireblocks-v16.1.0-darwin-arm64.tar.gz"
      sha256 "0bfb335f0948e7d7c292ad0d7d4d0935e83dad074f5d30e95137688916198544"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v16.1.0/fireblocks-v16.1.0-darwin-x64.tar.gz"
      sha256 "9708a8657520cafd8e70a51922c8ccced2aeaf7d28c1ce72b82017b77479060e"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fireblocks"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fireblocks --version")
  end
end