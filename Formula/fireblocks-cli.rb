class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "6.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v6.0.0/fireblocks-v6.0.0-darwin-arm64.tar.gz"
      sha256 "9254b7431d863b6e7e0e8668f68fb8a92853cbf92fef0b625c220792ebd96bc6"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v6.0.0/fireblocks-v6.0.0-darwin-x64.tar.gz"
      sha256 "1140d5173258143db911633883a2c42183ded40d8c4299f3e05d1ff2d6287f3b"
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