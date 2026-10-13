class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "15.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v15.0.0/fireblocks-v15.0.0-darwin-arm64.tar.gz"
      sha256 "1a183bfb1fa1c83bef891bb035c31507ec5ebc862ff8849dbf1686005a112934"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v15.0.0/fireblocks-v15.0.0-darwin-x64.tar.gz"
      sha256 "8299fec0678d0c7e4fc19e5eda50fdd9b0cdbff4bde5b6c2f149fd221c3d9a68"
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