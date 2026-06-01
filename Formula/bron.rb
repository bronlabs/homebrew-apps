class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.13/bron-darwin-arm64"
      sha256 "24c0b89073809fdc21b4c1e3a29a3fad01b98b99d73e22168b1e670085ce6baf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.13/bron-darwin-amd64"
      sha256 "8037acfc3ff1c2d8fbc968403e11a171a7988b1e5e5a20cf43296c0a11af6c1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.13/bron-linux-arm64"
      sha256 "4b56b148ffe1adc2a63c8206fd87fbfa0026b915034a42deca4bb436bcdfa5ac"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.13/bron-linux-amd64"
      sha256 "3cd52deabc0cdcdbc377dc019585467eae9b221962f4c6528b856656b2cd0787"
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
