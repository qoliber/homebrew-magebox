# typed: false
# frozen_string_literal: true

class MageboxAT1142 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.14.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "bd42d0037cf1c268a9906b01ce5bbc0fff3f23d01e840cb693fe2eeef81b1759"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "2d72d6e4732e97b298ca76afc4a0c88a39bff9e3b34fd2766c38c9dc2009abca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "f6d9c1f150822c9661110b39e8bcdae3160c5279a0b62ac456c764ec9d7296e7"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "3d6a801e0e2c2431678fde654ed5aee48319aff9b8057a8c42e116752996ee69"
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
