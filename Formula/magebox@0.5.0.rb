# typed: false
# frozen_string_literal: true

class MageboxAT050 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "3574ad026d2796b840808e291a8d3839386f5697fa0406632829aeda2af7b72c"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "6d05b76991a18951438cf43368fabb2cf7de16126b746bb1189d84f17e9e70c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "73ae7239dede7ecc1ec249a83f276f8b9d57bf87effb4a611a1d0a8619885e62"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "22afc2caab36363a5e72e221739a649b9078bf2fa7cce8af2312a4eb602df9cd"
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
