# typed: false
# frozen_string_literal: true

class MageboxAT212 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "2.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "0e46d485a45a6c612cd653c5d2262ac4be1d7254bd2cd6c3bb6a666c4258f7e2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "17bf47c0cd981c5930ab0caf1fd3ced55975a82333d786d3e763c617fc33b26e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "4f294e9d96bcfd67648672d6a9e714278e0d96ced282f3637972e9c0b439c7f6"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "1df6e0ff526224e6e3738586fe940607344b7a72d9dd1b48560d9abc94a4456b"
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
