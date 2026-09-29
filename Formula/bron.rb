class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.19/bron-darwin-arm64"
      sha256 "3ba8dcd1cc481fbdf6c5f04e2a8a1baa626345fcffda12415d3fd5edb6ba976c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.19/bron-darwin-amd64"
      sha256 "4c4d3eb72007a3414654d2bc30b828a9ae797abbe5425fb805a11c698b3186e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.19/bron-linux-arm64"
      sha256 "786ea6da1a796c7c9f547596a4aff7e26cc6eeb16f47a8eaad7c9ecbdc128203"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.19/bron-linux-amd64"
      sha256 "9f3cfe0061d2c4729da7e2f899064e90a9f914e60353f0e6e4b0d96051762fe1"
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
