class Niwa < Formula
  desc "niwa Japanese programming language and command-line interpreter"
  homepage "https://github.com/takesako/niwa-cli"
  url "https://github.com/takesako/niwa-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "073be7b5fd2961bff4172ec3f3e71f49ba74fe7de4f8d1aaa34855b7c6f3cc2d"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"dist/cli.js"
    bin.install_symlink libexec/"dist/cli.js" => "niwa"
  end

  test do
    assert_equal "こんにちは", shell_output("#{bin}/niwa -e '「こんにちは」 と いう'").strip
  end
end
