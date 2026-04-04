# typed: false
# frozen_string_literal: true

class MageboxAT0180 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "a1e924039cacd58dc056f2972ab5d7682dc35eaaffd3f00d1de3772358582a28"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "8c95003964ad3a897c93440f25c4f2a6aee9bfd3b1aaef875d27f4bd6bfef272"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "88a1d22aca260d2d51a04fe8e0d9e0719f3c31a1d5edd91b5ccef6cee60838f5"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "5332c5acc19b49ece7be34b3d64feeba1867323281b336dc7acc03fd5cd1abf8"
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
