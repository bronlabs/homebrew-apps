class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.23/bron-darwin-arm64"
      sha256 "229a26b27ad19c9ff1f0ddcb89512dcb64c94caa8ad916882d5b67a4fe36f135"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.23/bron-darwin-amd64"
      sha256 "fac2e804fa612328a11bad18d969bf7dd4832be9f6dbbb31e5e679d54ddd5392"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.23/bron-linux-arm64"
      sha256 "ee84fc5eff5430c522226cd1637b0b436c90df012b9a326a9d5543e7e258d9b4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.23/bron-linux-amd64"
      sha256 "02a51272acca64f8ed1731317532fe0cb9937908750b67670383fd5940c45b53"
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
