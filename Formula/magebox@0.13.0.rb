# typed: false
# frozen_string_literal: true

class MageboxAT0130 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "a442bc3df2ac2f01e98c1147e2df3a9f998304abb76b0f706dff640ef61786b9"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "b6644f2b7c8991c0a26fcb30bfcb11bef3eb7c701b1674aa65a8620abbb190fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "b0e7dde7a1b01c7da736397c973543d0cb04ba53720c729bc909120b5329a847"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "c34e3e1c484e7be59762bf927b152680ed9036b84d0896df087d7602cb1ae83d"
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
