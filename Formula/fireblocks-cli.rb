class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "1.0.6"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.6/fireblocks-v1.0.6-b5dab36-darwin-arm64.tar.gz"
      sha256 "58a249c02af5a9073b6493beeaf3e2287544b32a555c2d45851fe1e3d00be5c5"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.6/fireblocks-v1.0.6-b5dab36-darwin-x64.tar.gz"
      sha256 "dd254c7bc2fe0ac50853a922b9031047f4d8822262928b0fcc603b747aec6082"
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