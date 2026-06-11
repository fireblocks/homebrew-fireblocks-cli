class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "1.0.10"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.10/fireblocks-v1.0.10-darwin-arm64.tar.gz"
      sha256 "a4ed88183164465df9c18d2df1babb8ae64c03291c3587e992fa642703e8c87d"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.10/fireblocks-v1.0.10-darwin-x64.tar.gz"
      sha256 "b8fd34c62bdfb79b710a9d754686a1fb95242e62ca3eec1da283e2b40acc8242"
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