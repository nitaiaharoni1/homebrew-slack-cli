# Homebrew formula for Slack CLI
# Formula name: cli
# Tap: nitaiaharoni1/slack

class Cli < Formula
  desc "Powerful command-line interface for Slack built with pure bash"
  homepage "https://github.com/nitaiaharoni1/slack-cli"
  url "https://github.com/nitaiaharoni1/slack-cli/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "6199e74919b3db216d5f93bef8b0815d102c3fdfd465ccef519ac0dbd259b414"
  license "MIT"
  head "https://github.com/nitaiaharoni1/slack-cli.git", branch: "main"

  depends_on "bash" => :build
  depends_on "curl"
  depends_on "python3"

  def install
    bin.install "slack-cli.sh" => "slack-chat"
    # Make sure the script is executable
    chmod 0755, bin/"slack-chat"
  end

  def caveats
    <<~EOS
      Slack CLI has been installed!

      To get started:
      1. Add to your shell config (~/.zshrc or ~/.bashrc):
         source #{HOMEBREW_PREFIX}/bin/slack-chat
      2. Reload your shell: source ~/.zshrc
      3. Run setup: slack-chat init

      Note: This installs as 'slack-chat' to coexist with official Slack CLI.
      Use 'slack-chat' instead of 'slack' to avoid conflicts.

      The 'slack-chat init' command will guide you through:
      - Getting a Slack token
      - Storing it securely
      - Testing the connection

      Then use: slack-chat help
    EOS
  end

  test do
    # Test that the script exists and is executable
    assert_match "Slack CLI", shell_output("#{bin}/slack-chat help 2>&1", 1)
  end
end

