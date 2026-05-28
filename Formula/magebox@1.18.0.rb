# typed: false
# frozen_string_literal: true

class MageboxAT1180 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "9a6496e16980b9d5347c80c821d487686488400a23b74ec63058463818d1396c"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "4befdc5e8aabfafdfc0440a34ce2cdc36ae898df3e8c6ec08e3f3e0ab7fd9c5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "c91031df4f53f1c95d954b7bca6d2e7edf631a1ca51726bce39e06389b10057b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "600bc446524ec96bb64ff10148ab8c97efbc36180537af36eb6c714e21330888"
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
