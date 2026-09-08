class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "10.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v10.0.0/fireblocks-v10.0.0-darwin-arm64.tar.gz"
      sha256 "2c1b6e8aed6db6560ef2d96630471e57ca46b1dfe6a9fed150176f1a7ae2663b"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v10.0.0/fireblocks-v10.0.0-darwin-x64.tar.gz"
      sha256 "4d70504e5556e92cf8f92e9166199d462ad3855111871d8a8851bda207ecd39e"
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