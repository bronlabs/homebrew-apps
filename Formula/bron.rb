class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.4/bron-darwin-arm64"
      sha256 "8ada026bd12d56c2231f0293700ae918ac65ed2852ad34d5455f4c41cd407ab4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.4/bron-darwin-amd64"
      sha256 "1fd5ff464fc119de7129b7607019ef5acc0838b2a0eabdc50357ca6016cafdb1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.4/bron-linux-arm64"
      sha256 "a1f02dc54ec60f5c5c2013391b1275999165248f1cc5db0f0c7276019949ec12"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.4/bron-linux-amd64"
      sha256 "5b3eae9012e4bf3777e996c6fec6208e91981372fa310f347806612c53b5ddf2"
    end
  end

  def install
    binary = Dir["bron-*"].first
    chmod 0o755, binary
    bin.install binary => "bron"
    generate_completions_from_executable(bin/"bron", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bron --version")
    assert_match "compdef", shell_output("#{bin}/bron completion zsh")
  end
end
