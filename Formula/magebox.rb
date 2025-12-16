# typed: false
# frozen_string_literal: true

class Magebox < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "842e24da6481d9424a4f172928250588984669df7a52da812538d68d21c09c86"

      def install
        bin.install "magebox-darwin-arm64" => "magebox"
      end
    else
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "25f4ee9ff5f31fe89f6467c1dc2066b2461a16a0920c09dd4b22177d93ecede0"

      def install
        bin.install "magebox-darwin-amd64" => "magebox"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "3d574c17d2fea7e85eb9fbde839e940948ee49e06e45f2e1eee514695f9e2ce6"

      def install
        bin.install "magebox-linux-arm64" => "magebox"
      end
    else
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "c85d06d3c399b350c8f94fca6c393ef67d5994b2153baa95012161a1605314be"

      def install
        bin.install "magebox-linux-amd64" => "magebox"
      end
    end
  end

  test do
    assert_match "MageBox", shell_output("#{bin}/magebox --version")
  end
end
