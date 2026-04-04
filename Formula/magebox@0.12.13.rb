# typed: false
# frozen_string_literal: true

class MageboxAT01213 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.12.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "75e3642f0564b8d8bc24c7a017c7a0186912f06b1f066f1ccd975c8621db111b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "6680bd9ac5a62ba6c28a7b1f89e1551572690efba38d88578fc0beddb1b26971"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "59711b2e4ec94cd9daf96341fb82ecf0d9169c9541cd8d0e1f3e4bab14708aa7"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "e99b66569e2be4f1d9c2c50930c216b67907ab1c9b4d9dc253bf9573d3fe123d"
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
