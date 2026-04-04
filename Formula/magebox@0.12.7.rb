# typed: false
# frozen_string_literal: true

class MageboxAT0127 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.12.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "b62fb69bc31af1d368a6d503554e2546f511bc7a30264847d1fe709bb2cc37b2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "55cecfea6518bf2a6c97c3b033b66e394a336f714b0ed9b8bfe793546d5e0b24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "35cf99126c6dbfbbd53d47917e254962bbc719d378013169ad438e2836ad87fe"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "155ce391ab14b64ef15285e55dc981a93e2d7583474dcf5e44337b2055fcc933"
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
