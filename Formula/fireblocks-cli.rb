class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "13.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v13.0.0/fireblocks-v13.0.0-darwin-arm64.tar.gz"
      sha256 "4b7b37758820b265ecd9ae5833499bd52c32a5ae713327f08eb7bd2b41c12524"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v13.0.0/fireblocks-v13.0.0-darwin-x64.tar.gz"
      sha256 "c408bf26caa6eebbedc9053569043d0297df39feb9d7e84266d5a21b695e7664"
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