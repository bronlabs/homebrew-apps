class Bron < Formula
  desc "Public CLI for the Bron API (https://bron.org)"
  homepage "https://github.com/bronlabs/bron-cli"
  version "0.3.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.22/bron-darwin-arm64"
      sha256 "43a5201eb16575e79f922737b7d2873e22a11cc3d8daf75d340f77abb3330170"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.22/bron-darwin-amd64"
      sha256 "48ea119484407dd338ce387fefa2098ecc5bd14f52d713209e02bd53be13fbae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.22/bron-linux-arm64"
      sha256 "797563fe108a1c69e1898ca40d202f757a9230e40878a8579fd13c776a2a064a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bronlabs/bron-cli/releases/download/v0.3.22/bron-linux-amd64"
      sha256 "aaafef0277508c871fe753fc965eda631aa1b2eeb5d49096e4594d099fde174f"
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
