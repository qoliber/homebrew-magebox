# typed: false
# frozen_string_literal: true

class MageboxAT220 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "6f139c13e664cf16733d25722726ea17e736400a4d1f43f6f26eaec8e7b44129"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "f63473b397a6d1cc9c098d08933963e4f974307720ece9adb81a53813d057737"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "d113cc6aaf8a791d719cc5d8ac9c17cf0366dbd2af13c33c2b79f581712115d9"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "b476bed3c303897b7a666ba1419aa9999c85ca6aebcd62e3494149cb07c4f645"
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
