class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "9.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v9.0.0/fireblocks-v9.0.0-darwin-arm64.tar.gz"
      sha256 "557759265f92a8bc43cb586d32042997d4b2eb0c9343fd6111696c4b0e1ebb58"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v9.0.0/fireblocks-v9.0.0-darwin-x64.tar.gz"
      sha256 "4e997b31f4f20b6390fd20f514b0d06e58bf73ad3073306cf92d47288e569c3c"
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