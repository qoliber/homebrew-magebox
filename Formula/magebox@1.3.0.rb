# typed: false
# frozen_string_literal: true

class MageboxAT130 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "77489eb4778f625175ac807634142d9bec9828acbe07794d7db551f7aad9b1b3"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "928d02b4359e471c4d83e35d1708205e526fdbc94be531ef8149e7231b73c734"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "50f38bdb607b383a6198d3fca5a7719dffb56cdbf910637e0cf26f8177e69ba2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "40cf797bf96a0c3936dc6bfd29e5dbe90d47bae3447029f8f3e6439c79d99793"
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
