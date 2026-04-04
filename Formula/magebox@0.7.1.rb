# typed: false
# frozen_string_literal: true

class MageboxAT071 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "abd9e72d93c72c1f80349fb4abf82ad1b42624d0c6e5a3d034ad20b1d51524ee"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "dfa5f49cda4087d41ba9935eb3630e566cde46c1f3abe006c3cdc7bf7ea70a6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "fb0a96420c4bd3c0ecc3e46dfe98197914ed3ba9fec04f09551a0c782ecb7ba5"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "62aa44eab483a984034fee7d3be01bde9c93946624de9137acfdecb06e44d8a2"
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
