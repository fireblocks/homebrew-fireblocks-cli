class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "16.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v16.0.0/fireblocks-v16.0.0-darwin-arm64.tar.gz"
      sha256 "05f3c470553d598ddfbd4865d1169e514f73f965ffdf74b2ea6951442dbedbbf"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v16.0.0/fireblocks-v16.0.0-darwin-x64.tar.gz"
      sha256 "ac986dc81649f6a38057f42ee08a17aac9411d1c61624293b65d0b4ce38c81b2"
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