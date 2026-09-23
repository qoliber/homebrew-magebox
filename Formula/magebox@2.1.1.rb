# typed: false
# frozen_string_literal: true

class MageboxAT211 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "2.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "b795e7a1dd40a9723a6f3eb0b13d9cd0d5d9b0deb547bbb4b7cf7126aeda8d96"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "0361eadeb530018c57fab7ca341d8167857d1972b236821dda6be0484b3dd3e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "842392fbc08ec4a4cc39e10c52b39b37a99cb259c8fc14916e45909048a6212b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "6880d5707e3a3833d07d9a9bdf5094a3bb01d59f59a4034400321e9524c6814b"
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
