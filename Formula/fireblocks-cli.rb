class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "3.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v3.0.0/fireblocks-v3.0.0-darwin-arm64.tar.gz"
      sha256 "5b5dc9d9b774300f9ed25911842e01254f074f63a8bd5f3645399747eee47eef"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v3.0.0/fireblocks-v3.0.0-darwin-x64.tar.gz"
      sha256 "436c30642654faa02306911d32467446f5dddf756d6bcc2c12289732c02ac3f6"
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