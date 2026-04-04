# typed: false
# frozen_string_literal: true

class MageboxAT0151 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "842e24da6481d9424a4f172928250588984669df7a52da812538d68d21c09c86"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "25f4ee9ff5f31fe89f6467c1dc2066b2461a16a0920c09dd4b22177d93ecede0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "3d574c17d2fea7e85eb9fbde839e940948ee49e06e45f2e1eee514695f9e2ce6"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "c85d06d3c399b350c8f94fca6c393ef67d5994b2153baa95012161a1605314be"
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
