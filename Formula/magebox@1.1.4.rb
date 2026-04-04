# typed: false
# frozen_string_literal: true

class MageboxAT114 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "47c23d3ef002ec8755a7e57c4771c4c5fe6d173ba2230ffb8b0581d776cdf42d"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "cd51057648f479f0a8c075001c04e5c4383a2dcdea3b8dd15151fc974ab3a628"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "b23d1e9ff23212e8075e936f256654bc6685aeca2cc866b968e7ca28770e39da"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "4c1f55eef2fcb0142c460b44af835c6f40d92bad96d6d7ba286eff2b5e4ab3e8"
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
