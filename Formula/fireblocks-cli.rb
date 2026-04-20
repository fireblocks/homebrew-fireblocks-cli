class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "1.0.2"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.2/fireblocks-v1.0.2-9416c27-darwin-arm64.tar.gz"
      sha256 "721ea2c1d733996203e2d2f6a49af0d6c888d6a3261a56291239ebc9c9c5a536"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.2/fireblocks-v1.0.2-9416c27-darwin-x64.tar.gz"
      sha256 "7be59eab2e6668f8eb7edcd4df98e73c33aada3085af2dec19f9f8db2b979670"
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