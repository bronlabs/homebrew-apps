class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.6/bron-darwin-arm64"
      sha256 "e2a1a297c31c0873300c3f3e206fd27ef11d2808843a1d25d7398eb5ae4a1b32"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.6/bron-darwin-amd64"
      sha256 "709162138ecf83293dba70e86fd0efd8fed502517668168355c9d658701925f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.6/bron-linux-arm64"
      sha256 "1f29ee2e90b23a722086fbb166f4ca5323950cc18df79269fddf23d736644565"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.6/bron-linux-amd64"
      sha256 "7eed3f6632a472a3c0b743e665891ada3d742deab713d7c9c3412081652b5a47"
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
