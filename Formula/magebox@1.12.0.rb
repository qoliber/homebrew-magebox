# typed: false
# frozen_string_literal: true

class MageboxAT1120 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "7be89e5241ee09a1bb1e04e1a8b262b8d13a5b09cc1156eea0754d0662eb99a0"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "94b825aa8b7a0bc3fcdc8b40acb46a900d7eaf69d538823ca4d93ee91942e786"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "b543f453f95faa5945746bbdc197eb22516b20facdd6f97a640daaf52b24af84"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "f26ccdb7d834ac963cdb7e41466feb51b518814e4503c73e2ce49f3e5d01d8b4"
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
