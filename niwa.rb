class Niwa < Formula
  desc "Japanese educational programming language and command-line interpreter"
  homepage "https://github.com/takesako/niwa-cli"
  url "https://github.com/takesako/niwa-cli/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "16ab8e2a9ad07b4e265dff214baf6ef2206451a00401c1e379ca0e3a145a3160"
  license "MIT"

  depends_on "bun"

  def install
    libexec.install "package.json", "bun.lock", "README.md", "tsconfig.json",
                    "src", "scripts", "examples"

    (bin/"niwa").write <<~SH
      #!/bin/sh
      exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/src/cli.ts" "$@"
    SH
    (bin/"niwa").chmod 0755
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/niwa --version").strip
    assert_equal "こんにちは、にわ語！",
                 shell_output("#{bin}/niwa #{libexec}/examples/hello.niwa").strip
  end
end
