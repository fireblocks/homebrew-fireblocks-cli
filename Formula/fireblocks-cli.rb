class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "1.0.9"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.9/fireblocks-v1.0.9-darwin-arm64.tar.gz"
      sha256 "be1423ac4aa02b716f7e145b18c1b6cb3df3df2010f43f7edfe3890a866b0b01"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.9/fireblocks-v1.0.9-darwin-x64.tar.gz"
      sha256 "26471ba8d85992195e6fbb16b45769b6aab9b9263142c223820e07e5c3f1df51"
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