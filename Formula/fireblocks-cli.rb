class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "8.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v8.0.0/fireblocks-v8.0.0-darwin-arm64.tar.gz"
      sha256 "1bdbc60595782b60401ddf4bd8ed815626674822c5e3724249e4cdda3d4fb956"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v8.0.0/fireblocks-v8.0.0-darwin-x64.tar.gz"
      sha256 "2596c4c2abd1f87863bf81bb1f27d536ce9184af11db9ef7fb1ff39c49c1d53b"
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