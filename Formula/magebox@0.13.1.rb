# typed: false
# frozen_string_literal: true

class MageboxAT0131 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "ac8b5a9c4f7c8c4a7af1063c0d3c08720052642cc9516e3cf7ec00a7619b9e8b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "094cbc749446521178dfd62677779ea5424da7634f34bac452a6b3614a6edca6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "5f247385c55254e06e3e5c750b79e569dbc625c53564e4c299adc383e0db1109"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "baa37398c8bc8c78a82e44b4f0f3548816ee93194e322099291485c464ff9b17"
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
