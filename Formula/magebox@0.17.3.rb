# typed: false
# frozen_string_literal: true

class MageboxAT0173 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.17.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "297089254264c203bda20d41fb65d81605aaa3c83d4323b91142e4469a1b2ea9"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "7e54d92c3052ae821ca3c4eabce6634cfead935a572eca0183afa4a7c328242b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "02d5d812cf361747f44ce3a3d2871a9d58171501705d53456ff5b9e32381d880"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "45368061b5cef2b0492de89f93fd25faa1613dc0fde570f1c2088b77e167ba4e"
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
