# typed: false
# frozen_string_literal: true

class MageboxAT090 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "707fc7267453f46f3f1a560377bc192c0d69fce59e5fb6127d31c92cf3c6ff66"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "3b15b4054f828b4ac49f58f4c631caa7e14c39f0fe5585fc801375cc1b7ee425"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "e9541bad5d61efd4e0aea530e255a4c32b6a1cbaae9649ceb7ab5bca901d7f6b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "c1733855928c45ca7ac7eb279696aa8fae09e54d2f59902a36287543b334af94"
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
