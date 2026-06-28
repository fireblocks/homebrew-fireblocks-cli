class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "2.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v2.0.0/fireblocks-v2.0.0-darwin-arm64.tar.gz"
      sha256 "05cf47765d64993fb3fd7b5e1923006980dd8d10e2247c21051f7d73ad734fdb"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v2.0.0/fireblocks-v2.0.0-darwin-x64.tar.gz"
      sha256 "375954b70fb245e5f8e07cd2af22d14539e0b71c77fb45285c785225c666e3d9"
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