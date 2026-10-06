class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "14.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v14.0.0/fireblocks-v14.0.0-darwin-arm64.tar.gz"
      sha256 "217d5ef56d63967d418eda06d2d446f483e57f20732f93113f2a4f6acfbada1e"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v14.0.0/fireblocks-v14.0.0-darwin-x64.tar.gz"
      sha256 "812ffbfba895d72a2da40c7e9ad6b07ea00405fcf771279d40a11d216c7330a0"
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