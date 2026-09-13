class Lidhold < Formula
  desc "Keep your Mac awake with the lid closed while coding agents work"
  homepage "https://lidhold.app"
  url "https://github.com/aanjaneykumarverma/homebrew-tap/releases/download/v0.4.0/lidhold-0.4.0-macos-arm64.tar.gz"
  sha256 "69d82bab03a1feb0e702b2019530b39df0c4644d096a4ac4e55aa26142e9f94b"
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
