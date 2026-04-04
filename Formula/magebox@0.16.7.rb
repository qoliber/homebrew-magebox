# typed: false
# frozen_string_literal: true

class MageboxAT0167 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.16.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "c20766272e02bdcf2b5b8f83b9288bbc0a430340e47666039de2cd158c0d43a8"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "475998bed5b20bd01300f411e9035969e51d2ac64fa688d7010f4b4dd1e261c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "0100fe47ed636186f5fd4667e231c9a0d5b8e3498a038c47f4c5862279bbbd75"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "d5361edc6cffcbf3933968a25be043ebb0540defb5dca46d1d8f95b293051345"
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
