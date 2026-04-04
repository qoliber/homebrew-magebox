# typed: false
# frozen_string_literal: true

class MageboxAT123 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "372bfe7e2eabf294f8316f84d9587ff3cee4c151b9eceaf7dea4c099bec56874"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "4415a40b3cad229c8cbc81f8399410755ee60434059bfcc6756c9ddbc682bdd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "f41c3d5937b758d121a9caa3c49a3e876ab4a5ea86096792d397a5ef221c4838"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "79651376f0c2410dc27dc07af6ef10b5d3621c37b67bf63250baaab8dea976a1"
    end
  end

  def install
    suffix = if OS.mac?
                 Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"
               else
                 Hardware::CPU.arm? ? "linux-arm64" : "linux-amd64"
               end
    bin.install "magebox-#{suffix}" => "magebox"
  end

  test do
    assert_match "MageBox", shell_output("#{bin}/magebox --version")
  end
end
