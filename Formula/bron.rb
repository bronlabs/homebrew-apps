class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.5/bron-darwin-arm64"
      sha256 "f9a7f9be2812bba90ff9028998a15a08b347b4aec744ab9a72dba59dedf16898"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.5/bron-darwin-amd64"
      sha256 "04a4260ddd0e26527a1c76680acf43e3a31fe903081882e9d05c36da6d484dfe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.5/bron-linux-arm64"
      sha256 "fa9aa85b880fda248e7163dd39e1b83daca05cfdfe4b8be2f548832bb918b3d4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.5/bron-linux-amd64"
      sha256 "8f735e2736726af107f53bb33f0535faf2476fc8441bf67e59c9fd25dd9a3f78"
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
