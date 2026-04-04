# typed: false
# frozen_string_literal: true

class MageboxAT0133 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.13.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "0541b7f43fc79562717ad43ab4458c424550d4ab1675f2b43d1123308f7608f9"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "d0c7af016f055cd397f828f45e2a16f3d9b0b7f6a74685909aaceed6d84ad2ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "afe8bd709f01efd81b9951ea3a9d2c054fc42b3bee666def2f6499ad03dcf80f"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "65a1a71af33934b19450ec83e41cfbfd79b372658a76cf356af406d52fa3acc9"
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
