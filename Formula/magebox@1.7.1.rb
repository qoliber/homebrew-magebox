# typed: false
# frozen_string_literal: true

class MageboxAT171 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "19ad008e24ce3b00d6497d8d4f5307fa5008f0cba60f624ba7d9f5d2559d4ef8"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "667c403baad321d56e2f48743a708f955a679c61667cc75b4df959b918ee5404"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "88ac72ab29df6500c5834167cef30e289bd89b56f14317ab320c139b7e642fd5"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "df5e0ec22de7f8cbcc265dbdf43aa4f81763b33ce866306c6f7ec4e670073f28"
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
