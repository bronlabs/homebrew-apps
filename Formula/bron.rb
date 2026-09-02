class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.18/bron-darwin-arm64"
      sha256 "75d16e78ecf20aeb571f60eb7aca07ca663b67323396434b98da4f145462e214"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.18/bron-darwin-amd64"
      sha256 "bde66de1a08635b72ee51bbf6710443018db2508010f7fc4e6008715bb7430dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.18/bron-linux-arm64"
      sha256 "e41fd8b3ddbb0d42e8e3a63e8998f196f156a4be0b2bba355b4ef45f5a463936"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.18/bron-linux-amd64"
      sha256 "27c3879d64331c971f71f13d5eb1a0f8c70399e4007aa6eb5c9b3d9d94d19885"
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
