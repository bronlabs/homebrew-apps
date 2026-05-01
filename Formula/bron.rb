class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.7/bron-darwin-arm64"
      sha256 "b238dc0d00679853be0d558087c07b08197766c08817a97558756c75adfd8513"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.7/bron-darwin-amd64"
      sha256 "2c0daca6e8e5c87b09e6ef7b0798235e8b787a81fa0dadda79b32acabef60543"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.7/bron-linux-arm64"
      sha256 "76b567ba100a4f1f177c0d77da836f0103cc04f58cfefbe608244c85d36971d5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.7/bron-linux-amd64"
      sha256 "3d490ffc91428c38ed0fbf1acaa749037f6dbe4893aeb46e49484f0b27b4e4e2"
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
