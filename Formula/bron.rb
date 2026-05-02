class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.9/bron-darwin-arm64"
      sha256 "063dd76911f2ba3c17b7046150c7bb58fe0c506f7e511e35347b0def55ee4672"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.9/bron-darwin-amd64"
      sha256 "8d55a8e81d8185c55217f7739db67ea2b1fcc0f1ac1b205833371d03ade77226"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.9/bron-linux-arm64"
      sha256 "57e08ad95cf43b57727ae5f21f846cf3087df54f0211609d61f4f18a9c87bcab"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.9/bron-linux-amd64"
      sha256 "585c1684b5491d42894b08a53041b04d44c9d1cf9689624b473288a51da3722b"
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
