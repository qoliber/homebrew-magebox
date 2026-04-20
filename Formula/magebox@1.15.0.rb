# typed: false
# frozen_string_literal: true

class MageboxAT1150 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "dc204ccd0b80802c15a12a324335c6543c919c345cdad8f95ff1ee5891751df8"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "2a0ce7097f706bd488e2f236194fe7f955e90930128423d34273dde29e56abd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "2a8a2c50f3410ca61f6150775dc1c9b754250524f42dfc2d87a266784ec48196"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "7edb345c3233763b1d2e7d23e7042ab20a22d694e7bf8afb66c0c65c9173b159"
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
