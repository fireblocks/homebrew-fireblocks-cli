class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "1.0.8"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.8/fireblocks-v1.0.8-darwin-arm64.tar.gz"
      sha256 "6f06694cfddaf85f5d2a63c536e1407b90d977f80a9c6243a9d17e0d8f08130a"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.8/fireblocks-v1.0.8-darwin-x64.tar.gz"
      sha256 "621beee5fa8f685445bd75950f60d8f7e62d5f65e0e06776083ada90471919f2"
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