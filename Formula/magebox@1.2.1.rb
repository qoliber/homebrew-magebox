# typed: false
# frozen_string_literal: true

class MageboxAT121 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "a04de65230168f45ba5d2888b6c4e9cd7db2da3adda27a0d39c3eb3b5d37d0d8"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "f9dff098e944601fc8566697b544ceb4a04422e1da4c2cba50b4ccb90adb0502"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "be85d32f266254dcf9735cfd90f7cafffac368036a221eeed80d9fc438eddc87"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "d854897be658386e0969946d75a7475b1d632224890808104c46823beb86baa3"
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
