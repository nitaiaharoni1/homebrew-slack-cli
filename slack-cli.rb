# Homebrew formula for Slack CLI
# This file should be placed in: homebrew-slack-cli/Formula/slack-cli.rb
# Or in your tap: homebrew-slack-cli/slack-cli.rb

class SlackCli < Formula
  desc "Powerful command-line interface for Slack built with pure bash"
  homepage "https://github.com/nitaiaharoni1/slack-cli"
  url "https://github.com/nitaiaharoni1/slack-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0fc7fcbde97d77b04c0fe36aa74f7af514cfaed1d0a9143fed66dfe144246cd6"
  license "MIT"
  head "https://github.com/nitaiaharoni1/slack-cli.git", branch: "main"

  depends_on "bash" => :build
  depends_on "curl"
  depends_on "python3"

  def install
    bin.install "slack-cli.sh" => "slack-bash"
    # Make sure the script is executable
    chmod 0755, bin/"slack-bash"
  end

  def caveats
    <<~EOS
      Slack CLI has been installed!

      To get started:
      1. Add to your shell config (~/.zshrc or ~/.bashrc):
         source #{HOMEBREW_PREFIX}/bin/slack
      2. Reload your shell: source ~/.zshrc
      3. Run setup: slack init

      The 'slack init' command will guide you through:
      - Getting a Slack token
      - Storing it securely
      - Testing the connection

      Then use: slack help
    EOS
  end

  test do
    # Test that the script exists and is executable
    assert_match "Slack CLI", shell_output("#{bin}/slack-bash help 2>&1", 1)
  end
end

