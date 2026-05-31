class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.10/bron-darwin-arm64"
      sha256 "a95fb8fcf4a62e5d003e9d714dccc69cff9d593ce8501a72f43b08896a45637a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.10/bron-darwin-amd64"
      sha256 "d4ab50141263d5b38acead4d4b74ca9bb5e22144bcbbae613559ff5f0578334c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.10/bron-linux-arm64"
      sha256 "17e2c4399ce024cc95048b70de2732b39151aa8f12d9aee1ceb0513c7e03e90b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.10/bron-linux-amd64"
      sha256 "70ac8df23c8b32d305a6cc6ca71da5cc69641ec21b1b03573add5ca05a4fbdf0"
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
