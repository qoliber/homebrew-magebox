# typed: false
# frozen_string_literal: true

class MageboxAT051 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "4d64dd637745b218bab5817275aaf97d4e4165ac26378c4471a7f02784f57287"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "d347f3ec1c73ec4062db77dff91e3752769cdd6e4094f0aee93228c09d02570d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "967470f7886c8e2ceb0a3fb1e7b00e7719b31ad366514f04d25aef2f5d10fc3b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "c36f7f8679753913851929910aae0a1b68df7823ebf2b65e4dc3ff1e453d6066"
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
