class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "4.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v4.0.0/fireblocks-v4.0.0-darwin-arm64.tar.gz"
      sha256 "6c8c6679ef4399c46ec80d983cf1351b9068b127b93d13dca766d90ef9b9d63a"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v4.0.0/fireblocks-v4.0.0-darwin-x64.tar.gz"
      sha256 "6271fc8cacb1328c740a253f127dc699785434ae8ffe56a7e8a41ffd1c6d1a77"
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