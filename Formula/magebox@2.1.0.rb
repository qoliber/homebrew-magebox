# typed: false
# frozen_string_literal: true

class MageboxAT210 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "7ce9a6236e8ffb41b98e40a9d3879b66d3a379eaab236b52c4bcf986f5dc7033"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "6cf3ed8b32d63693cb1a52ed95b32832be2ffbff210acfe738ee44e8c7ecf873"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "43766ca540747af23d725a3d9cc095eee1f946eedeaae04f1269749f5550461e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "1519ed641d1f772dde8de245edf22aee2d94996d3cb87f9fb18385ba5c8600ef"
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
