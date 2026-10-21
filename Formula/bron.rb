class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.20/bron-darwin-arm64"
      sha256 "0d036b09d757ff72f154be4831690a403b49d64d1486ca580406fe4fa0b959be"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.20/bron-darwin-amd64"
      sha256 "82d4d28285e21091ef938556ec5571e4b2bcc9ca5d47b524cd7fd3d9342a7d6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.20/bron-linux-arm64"
      sha256 "cb6861163440d45127afbb7e830797020ec54d1e8fb93fc0176a008fda78f667"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.20/bron-linux-amd64"
      sha256 "2b444adb54ac7ef6ab8186ca8ce075f469889e7b86e3e124f26a867857cd7b6a"
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
