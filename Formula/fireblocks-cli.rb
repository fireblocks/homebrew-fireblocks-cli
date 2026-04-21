class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "1.0.3"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.3/fireblocks-v1.0.3-3d5771d-darwin-arm64.tar.gz"
      sha256 "06ca22893bbad5ee72d5a9f5931b75f05e509392b88e26dd8cba91b30fe21048"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.3/fireblocks-v1.0.3-3d5771d-darwin-x64.tar.gz"
      sha256 " c3dde6e416cfd5406b7ad69302a0dab0374e757a75fc1e8064d8c7b4631d197c"
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