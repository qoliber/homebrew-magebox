# typed: false
# frozen_string_literal: true

class MageboxAT113 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "6389eb4c4758b109ad71cf094b324b97db742ee6e50c94b00281d664df70b896"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "538dd695b04e8758025358f34d66bfd15dd9755ef4d6c33f7ea1d98c65fb4365"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "93d0a496844fd1dcb17b4ffe11ecb55c1861aa04794b83573f6d0cbd4fef9fcb"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "000cab5700cd70a32bc090408547c5c618a007c421a887754b1b5ebab484a283"
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
