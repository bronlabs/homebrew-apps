class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.16/bron-darwin-arm64"
      sha256 "c03b5874c2bc24ebf13487a45a8aa339925ca44dd22fe2e56116ee68797d5514"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.16/bron-darwin-amd64"
      sha256 "23c690a459b5896e4a937304bf0a2d39508c02c3a54067629cb656818088085e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.16/bron-linux-arm64"
      sha256 "76dcb2aba5370ae8c9835431f66d1dafb4563e30980b83e07289d31d51cc9395"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.16/bron-linux-amd64"
      sha256 "7005a5888b59b82ec402d0b3dfd0b92b1a5d6e3dab11bbfec91fa25d4f7aa638"
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
