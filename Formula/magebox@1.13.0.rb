# typed: false
# frozen_string_literal: true

class MageboxAT1130 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "2223ae9f7ca00547982fe937db06e0874d86adfd1c63c9b05706180cd7b116a2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "51b7ad776d9433a738b87a5329643f8eab3bbdfc1dac523ef810fc45a3fc48d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "707dfe21cb1e3907a1a2c2013c03f41ab29bb7724e373239ca3941f4f4121d5c"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "99a82ae0ef22689b3dd498471d3f112f99593578a395ddcf0a8baf9fa9e386ac"
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
