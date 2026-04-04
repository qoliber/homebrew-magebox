# typed: false
# frozen_string_literal: true

class MageboxAT021 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "3089207fc9f985912aa1411ef03fed0cfd74adb1a5877a1a215420d2d53f6113"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "21d1bf346f8d4900865f3b65f2156158eb434edd26f10d9476355d3a181fa588"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "63a44e20a0c893e87a10d9bb79b39a7ed9b7bc5964f8ef6ba5b03f29cb8f26e6"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "4092e31904919849ddda082ff8e58fb6a590244abff439a7dd8500d26e96998f"
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
