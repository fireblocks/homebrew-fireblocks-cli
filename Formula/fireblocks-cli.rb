class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "5.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v5.0.0/fireblocks-v5.0.0-darwin-arm64.tar.gz"
      sha256 "a152e49fb343566f6cd9767194540b3d8d4331a14fa99bd0feeac329cd33d8f8"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v5.0.0/fireblocks-v5.0.0-darwin-x64.tar.gz"
      sha256 "d6b1c19357ec2f74aa438e285f69e165a7f3d9873e4779f85b20c3a3886ed187"
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