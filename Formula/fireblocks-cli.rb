class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "7.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v7.0.0/fireblocks-v7.0.0-darwin-arm64.tar.gz"
      sha256 "61a16103df2d8bf20b1a41a628e4f1b0b89d023ef3f6a8f13f5b2a44aff0b66d"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v7.0.0/fireblocks-v7.0.0-darwin-x64.tar.gz"
      sha256 "71f44ed661b98be0366b6989a45a06fa86b98c1378659a5dd81badbd13e5a8f2"
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