class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "11.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v11.0.0/fireblocks-v11.0.0-darwin-arm64.tar.gz"
      sha256 "0164b711e4a41d162a98041387e3b1fe032e57040a074a5a893911a1269d8ef0"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v11.0.0/fireblocks-v11.0.0-darwin-x64.tar.gz"
      sha256 "810eadf94a97ebe73d00f76f56274f626a63ff0720bbc1ccb697454ef2a91b6c"
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