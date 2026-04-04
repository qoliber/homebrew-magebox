# typed: false
# frozen_string_literal: true

class MageboxAT062 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "9fd404c856c2f442db5fe3aa2ead67bf8ad219318fd7717b9118d74fe3c6caca"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "8d0182e09a0188cba93a7470ca16f0a89aa4fad0aed52805a8d5276081eb7d5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "1cd6ac0e8f118876680d774b4db1becb364560852cab3fcd102303ed2dab8194"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "9cf778ec77a909535f184942aacace9399a3f5eebd4bf65ac622ec987324c328"
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
