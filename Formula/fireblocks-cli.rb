class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "1.0.7"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.7/fireblocks-v1.0.7-darwin-arm64.tar.gz"
      sha256 "ec588c14f82c4b4a668f9b952413dd983ff9c4bbe4155a572d630427fe3cd617"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.7/fireblocks-v1.0.7-darwin-x64.tar.gz"
      sha256 "0464fc3aa58a3de48f35a766438a6ac3323a1b01fcf12ce880f45ef489745d26"
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