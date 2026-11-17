class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.21/bron-darwin-arm64"
      sha256 "bb0b41dcff390ca0689ffae409342b2c707514eefb7fa150952bc597333fced8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.21/bron-darwin-amd64"
      sha256 "6b0446df3401ed0c89ed6e9447c4dfb0d2726e9bdea605e82b5c83d191a562eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.21/bron-linux-arm64"
      sha256 "b26e255cf21a7a5f8b5a96733577515b37c6c1566460d6fd248e57a307881b8f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.21/bron-linux-amd64"
      sha256 "a6ba21fb93d1e8aaf9a8b06bf631bc965c87428facf7b083d26eea1f9dd8d20f"
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
