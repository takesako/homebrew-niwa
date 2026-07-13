class Niwa < Formula
  desc "niwa Japanese programming language and command-line interpreter"
  homepage "https://github.com/takesako/niwa-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takesako/niwa-cli/releases/download/v0.1.2/niwa-darwin-arm64", using: :nounzip
      sha256 "36009b4a5813e0312cfc42e4b488cb14e0889aa99ca66ef4d2803d5aecf38d7c"
    end
    on_intel do
      url "https://github.com/takesako/niwa-cli/releases/download/v0.1.2/niwa-darwin-x64", using: :nounzip
      sha256 "ba677bb4da021370852f9f6d9972a30d2abb56cb89fd18a0a1ba26fdf640c2c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/takesako/niwa-cli/releases/download/v0.1.2/niwa-linux-arm64", using: :nounzip
      sha256 "9278b4f38ac5b6d108f2cc0455e17a758cbdc62744fa9a0da2a3032b0a227c46"
    end
    on_intel do
      url "https://github.com/takesako/niwa-cli/releases/download/v0.1.2/niwa-linux-x64", using: :nounzip
      sha256 "5ece5284e3bcd9ff12531ae423a2edefb92b28fa700fc2ce300bd1db1c15f696"
    end
  end

  def install
    bin.install Dir["niwa-*"].first => "niwa"
  end

  test do
    assert_equal "こんにちは", shell_output("#{bin}/niwa -e '「こんにちは」 と いう'").strip
  end
end
