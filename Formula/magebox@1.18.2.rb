# typed: false
# frozen_string_literal: true

class MageboxAT1182 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.18.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "60b1db40ed614dcaa586c68e701af7bba46fb669900a4efb1a8dd2f18d5a76e1"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "9443b0968af9c6c6b0634dc769c9d01f4f193ca5080bf014673020474b56c414"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "8f2ffd8587b2879ea6a578bd8c9ee69def6baf05cd6b81bafbbddc29e9553388"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "cccdefec06c63ce10b1b8ee114f2b5e7ec364ff4b7176756b14fb7f256b826d2"
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
