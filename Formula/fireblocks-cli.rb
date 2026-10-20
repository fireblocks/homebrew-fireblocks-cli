class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "15.1.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v15.1.0/fireblocks-v15.1.0-darwin-arm64.tar.gz"
      sha256 "828ff87bd7a501d8113800ba72b6bc389b2833e5c477c59b338451e62b9019d7"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v15.1.0/fireblocks-v15.1.0-darwin-x64.tar.gz"
      sha256 "3d9d6946686e692b24efe9ba082c31a8f5ceb969e7aaae451ea0aa44896dedc0"
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