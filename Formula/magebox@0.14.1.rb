# typed: false
# frozen_string_literal: true

class MageboxAT0141 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "3e1d7bcba0c187b085e2bdbe0b186f906a545193b74baabee62da92d191338c2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "e67bbfb3b8e4ec07fe1bafcca17bf5db9f6c3e820245cce60d4bb3c61fdb0823"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "a538754ad706cb26d86c5f51f8a0f828f4ee98f74e4d4e2ca6c16ac25edb5a4e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "ade0177208b7ecedd899fd66ed2aba79940007b1b8ec76d031a6d6c1b5d5a4b5"
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
