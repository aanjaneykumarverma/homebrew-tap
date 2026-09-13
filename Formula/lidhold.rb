class Lidhold < Formula
  desc "Keep your Mac awake with the lid closed while coding agents work"
  homepage "https://github.com/aanjaneykumarverma/homebrew-tap"
  url "https://github.com/aanjaneykumarverma/homebrew-tap/releases/download/v0.1.0/lidhold-0.1.0-macos-arm64.tar.gz"
  sha256 "fec26bc733014b81b1af5b2c3c3aab4e5bc568126ad6481badaef0700e79edfc"
  version "0.1.0"
  license :cannot_represent

  depends_on :macos
  depends_on arch: :arm64

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
