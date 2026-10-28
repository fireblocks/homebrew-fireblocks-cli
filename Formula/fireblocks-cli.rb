class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "15.2.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v15.2.0/fireblocks-v15.2.0-darwin-arm64.tar.gz"
      sha256 "98a575d09bd43bf8e2a32f9755ae6db4ef7295192cbb01ec76f1c31270ee87b2"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v15.2.0/fireblocks-v15.2.0-darwin-x64.tar.gz"
      sha256 "8c84be72410552d97ff11b82854986352ff4be75c512a15b6ac25f6c619a0268"
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