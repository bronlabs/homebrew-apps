class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.15/bron-darwin-arm64"
      sha256 "069858a054127ea20f318f9928215896ace8c3be71aeca930148f547dfd68e2c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.15/bron-darwin-amd64"
      sha256 "99136c59cb61c2e259ed519a79e42ac671534b9efd3094ce11de0e4f3a64b567"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.15/bron-linux-arm64"
      sha256 "1c5763c8eaf2f2b3052ede2b2a4a04ba570bfe0b686eab77bcfa72d335da0bc6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.15/bron-linux-amd64"
      sha256 "9b159e522a3b35aef4df5cc66d396f1ac09979bccf9e9200cd94d6acbcc694a1"
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
