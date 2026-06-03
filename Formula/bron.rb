class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.14/bron-darwin-arm64"
      sha256 "7c4f0ffb4588b64ef2ce960d2a912830b6b413efdb8525c22baffbaac1dd6fd3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.14/bron-darwin-amd64"
      sha256 "2e779eb281eacee5f5247dc918ec0e59a85d8c97033bf8ff1f98a591623d9769"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.14/bron-linux-arm64"
      sha256 "7e2b47063ad48721b9cdd8cbd3610cead915d55ba6cdabfa117d3c878303f1bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.14/bron-linux-amd64"
      sha256 "1266bc81c330493da101213c9c87902258f6f9653172846f76975a31f4b66061"
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
