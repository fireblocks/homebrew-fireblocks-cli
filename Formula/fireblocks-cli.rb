class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "12.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v12.0.0/fireblocks-v12.0.0-darwin-arm64.tar.gz"
      sha256 "ad40248479089847727a20b7ec21ee4d483713ffcc6601b963844dedd6653be3"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v12.0.0/fireblocks-v12.0.0-darwin-x64.tar.gz"
      sha256 "7cc55dd45039cb56663147ac5915d1d9e1d37000cc4f2888d0f34891013955a0"
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