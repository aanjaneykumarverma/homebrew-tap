class Lidhold < Formula
  desc "Keep your Mac awake with the lid closed while coding agents work"
  homepage "https://lidhold.app"
  url "https://github.com/aanjaneykumarverma/homebrew-tap/releases/download/v0.2.0/lidhold-0.2.0-macos-arm64.tar.gz"
  sha256 "32e3dc7fd44984fa95dbfb65c99e9148187d6f9a578597843273e1d98b36bf03"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "lidhold"
    bin.install "lidhold-helper"
  end

  def caveats
    <<~EOS
      Finish setup (installs the privileged helper, starts the per-user daemon,
      and wires Claude Code hooks if present):

        lidhold setup

      Agent hooks start a 7-day trial. Manual holds and the guards are free.
    EOS
  end

  test do
    assert_match "lidhold", shell_output("#{bin}/lidhold --version")
  end
end
