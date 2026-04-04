# typed: false
# frozen_string_literal: true

class MageboxAT0102 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "3a74fdf9a5c3935bce4c3cd224b5ba891cea661881fb4a6aeb5f44cc9bb57be3"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "4ba5dd9dca83b3133d3eb7f889d31c74425715b0d1c2714657fbf65baaf34d35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "e4ea94a9b9b221a4106c4c1641910012e6dba1896cda1f9078a096190a333cef"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "bb964d9411f32ce4cec6cb4ab56fe31f086a66243a1e77ea2ba3cdc5c99875db"
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
