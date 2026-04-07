# typed: false
# frozen_string_literal: true

class MageboxAT1131 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "5c2aa4625096eddf84013713369e17eba1800d6e5cbe9ec65501a62f2821d8f2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "02e28486f942004a8257be9342009a9ef23d06189390f4fd18970041fa6b0e22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "5e6266cdc721e333f461e8562a0a3d9a8f9c618d151d550b8a55120e6f06ee47"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "c15f7abdb974878d2d73a7ba12889c30b234cce97c057e05269017d410d38041"
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
