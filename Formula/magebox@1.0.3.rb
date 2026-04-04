# typed: false
# frozen_string_literal: true

class MageboxAT103 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "7a4731b589b115fe37be7f684a78b6405d0f10077c3ddf1bf6a871436bab6823"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "fc7efb475e9d7944bca57fd9c6e45144954cf2d445771bdc6c610b55e147207f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "8173bbafed24dda4824736e1b80049e62a56542aa34b94374888388ec65143ba"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "915c338b6b769dcbbe07b5d06c96aff32ad98f02350574ea127ea6de2e03df1e"
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
