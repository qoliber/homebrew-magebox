# typed: false
# frozen_string_literal: true

class MageboxAT127 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "6e33afe5ccc4d9f65bfe486a47a721e9faceeb5e930f4d4c745f4a1b04a76d93"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "c6c5d0614fda880f721252f591c468f1781c4dfe42b1fe8dba48bfe047f11c1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "ea9733ad603c4b97b8527383fe4bcb331444b2c7ea8320c0262579bba8cdc108"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "ba77ed6911d8f13c1ddcb6fc6616935ed59273da681b1ea627f9c8768fb99905"
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
