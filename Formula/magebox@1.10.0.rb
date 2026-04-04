# typed: false
# frozen_string_literal: true

class MageboxAT1100 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "af4a24755aa85f4e4b578b02e84e3a06eb2d44572ec9d7bfe77c746e24e73ac7"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "71f5797c4acfbfd91b37b33a80b0c6bbf5b064f66cb79dba309fdf1be40398ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "741bbefc5d79c11c69806aae72919ba974fe705c90e7ce29bc9d1cc4742f3bc2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "b936df42cfd9930f537c18811fc9dd94f4803da3786108f3c6034e458ad2d0b7"
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
