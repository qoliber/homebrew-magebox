# typed: false
# frozen_string_literal: true

class MageboxAT1181 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.18.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "784073c5a5355511c6d8a4fec959894b7b73dbde23ead36361e9df5c579ab442"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "fe6d4cdd02b9b900430cf87643f222dca30a6dd6e5b7bf94d69509e4303d430e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "e1511f70982170311dd80f852889852f20ce195861bd6878fc794176ecf42541"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "c1cade1c0ee5c9f50af727cdb6068a495dee21bc33e1665e70388396eb1d2f34"
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
