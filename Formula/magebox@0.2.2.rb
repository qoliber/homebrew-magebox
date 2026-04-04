# typed: false
# frozen_string_literal: true

class MageboxAT022 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "6528b6794c9391c5109df268877d737a20bc1c169890592c25f44cf145ed10a0"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "3a87e7c3c668602011201f0f49f53eb6cd180d526bd727ebf79bc5b4d89b3c2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "2ddec5bf09e54473b977baca4823e7eb02cdb922fad28affb6b09eb75a070a5b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "44a25a57d2185fd0b37cf5f8dec317536214d24ccf78fa22d31254a053b85dd7"
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
