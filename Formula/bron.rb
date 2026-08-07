class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.17/bron-darwin-arm64"
      sha256 "e6ca9a134a6789e3c402ac804943ec853259c57a81b98599de213e5d629ca7be"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.17/bron-darwin-amd64"
      sha256 "0dbfbf721d153f23212dc2b644adfb692811c1a8c8afff3be0f7e91747dc9898"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.17/bron-linux-arm64"
      sha256 "a04743dad87d180051dcb6843f84d70ad40a71e666b7c1f2720e65f5360f7c1d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.17/bron-linux-amd64"
      sha256 "0b6b6ff0623a6008614a9b9255e763917e284376b9ed30f595c94b929571f5a3"
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
