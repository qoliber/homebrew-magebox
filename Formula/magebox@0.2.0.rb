# typed: false
# frozen_string_literal: true

class MageboxAT020 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "cf0fe11d1d9ff5a8673452be73818712a83f415d62f08098c313762caa9a1bd3"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "703bdadd8b6c762a87c225acb043d564c1b9ff11a98e4e1d6589a0adf9784d50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "0f42c2de9a1a9cd89b6cbbc2721bd4020ec87da6f93eb3b96554e98e8eb7b109"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "12e5bb28a353dcdac39ffe21e40a7a735e69a095811b5dde406d746fc02929d1"
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
