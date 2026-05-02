class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.8/bron-darwin-arm64"
      sha256 "a7b93dd187018afc029771d1d0c7281013f79b0cb8414caa2a6f85cbc951b74f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.8/bron-darwin-amd64"
      sha256 "04f22b0e6b9c80d59e3f61f9d2818c56ea88441253b1496b709ccd859511f12e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.8/bron-linux-arm64"
      sha256 "dcab0a29545e7ec63e52b376f365a396b3c6982a64a8d1b073972acde48a18e5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.8/bron-linux-amd64"
      sha256 "75851e8e4eb0deec160a6badde314ecc9f17e3bee8ddce514f3cd454d63eb041"
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
