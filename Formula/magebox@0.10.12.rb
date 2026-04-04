# typed: false
# frozen_string_literal: true

class MageboxAT01012 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.10.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "407596c9010e27005f640c4df5489dc6aff6f3ae215bf6ad00cb25134deca819"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "8aaf7147c7122d733576ba91beacc0a2744d89ab3047a8e89d7fc3b91fcf6914"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "33bdc27b386d4d5924f5c86267e7eec133379a74cee4b80045251e0ae240dfb0"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "20746b784badf6f3e736f6ade0b0a08bc9964cc09ef1d779d35cc6647c5774ec"
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
