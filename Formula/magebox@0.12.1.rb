# typed: false
# frozen_string_literal: true

class MageboxAT0121 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "c3f038685073df3c1f1018fcc897bd4bc4eb807722229e9f4fef27b06a541015"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "73cbe8f09bd5abcef387b549f6874ca84550fd0c22859cad66b41e3de851aab5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "b321e37975c630f062ac5cfcc95f01d04464f55746200f671f5b5fcd67869a75"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "d107a5e0fce9df959dd96a28ba6725f3ffd2299369d12d55c58977dc28acb38b"
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
