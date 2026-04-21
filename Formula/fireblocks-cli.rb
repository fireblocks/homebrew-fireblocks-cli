class FireblocksCli < Formula
  desc "Command-line interface for Fireblocks infrastructure"
  homepage "https://github.com/fireblocks/fireblocks-cli"
  version "1.0.5"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.5/fireblocks-v1.0.5-f038846-darwin-arm64.tar.gz"
      sha256 "df6b41f156dc20a49149bdabe51638a9695b777495804e14eaa6f8c636e18c99"
    end
    on_intel do
      url "https://github.com/fireblocks/fireblocks-cli/releases/download/v1.0.5/fireblocks-v1.0.5-f038846-darwin-x64.tar.gz"
      sha256 "980ba77279f9af450f1f365e1e2a7df9fc378ced3b809fc74203a5ea49fc31ef"
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