class Niwa < Formula
  desc "niwa Japanese programming language and command-line interpreter"
  homepage "https://github.com/takesako/niwa-cli"
  url "https://github.com/takesako/niwa-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "bb07456977a80b66d19a6b1c6548813800bd894014a228446503526ce3104e94"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"dist/cli.js" => "niwa"
  end

  test do
    assert_equal "こんにちは", shell_output("#{bin}/niwa -e '「こんにちは」 と いう'").strip
  end
end
