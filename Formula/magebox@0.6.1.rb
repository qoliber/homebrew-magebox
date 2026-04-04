# typed: false
# frozen_string_literal: true

class MageboxAT061 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "f2ea8fee94a4e58720888d244b1f97bc87c17b0463c13bf038ad8d4942a6cfbd"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "33e6b05acf83084b973d476f515b3b1f8b5f5a307ecbd683de24c3f4ddc8bde5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "9f1c8712ed46112d80b8e42470e78af87d3ad28f6ef7dd36c729f91d52d60583"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "f26dece4113360bae39b838738f775dff3d990a66865ec43fdfbfeec76297a20"
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
