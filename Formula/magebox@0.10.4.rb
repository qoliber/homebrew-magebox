# typed: false
# frozen_string_literal: true

class MageboxAT0104 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.10.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "0c5666d62048fece7dd9c63f78fea7be1c1d566b5a84b41ee7ac20abca2fa3e4"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "60a7f30fd4c8ef71ea426c2e4a0a0e3927eca40fc1ce61f263c8f1bcc71e20b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "b3a9c80b6a05ed5333058107b06cae58127c80e8125e4245a850bc1aff01a594"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "ef0b88d19a6cb173947249b86776141dc07ef8f2c7cb1a6d53d130f63cae603d"
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
