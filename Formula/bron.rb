class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.12/bron-darwin-arm64"
      sha256 "4de29c0623beb235c17b9731d26a69ab52e88a135195bfccdd5eadd7fb2c21dd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.12/bron-darwin-amd64"
      sha256 "d84d99d7b938102c6a97c3f35397a3856c2b15cc83b674ff659188d895357b40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.12/bron-linux-arm64"
      sha256 "abeba0562bcc48f0a263302e789177c6e00a0b1f81f68213a8383319c2214d66"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.12/bron-linux-amd64"
      sha256 "1f8c5c5a10af60137b5073db4e266dbeaf64216a0d08269cb6a6f873a6309c66"
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
