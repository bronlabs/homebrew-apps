class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.11/bron-darwin-arm64"
      sha256 "4f8980e73b8f083814b6c46c188bfc734edbc2bb76c552cc1350a152ee53d381"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.11/bron-darwin-amd64"
      sha256 "1d475fc34b37958015d7557ace544d611c70d9d20b4eb534fb300cac2bcf5dbb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.11/bron-linux-arm64"
      sha256 "a78a51c84ff7bf08d2aefb9ee5bd71f3feef232fe1360ac19962b70333db580f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.11/bron-linux-amd64"
      sha256 "2a8778d09bd1b9a55b15f5697165afb91e6cbc456df0ad857b2a745f6750bc05"
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
