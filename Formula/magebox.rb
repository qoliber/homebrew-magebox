# typed: false
# frozen_string_literal: true

class Magebox < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "bfa660730b006ceb45ecbffc35ae7b0253d8a641de4fd4232c27a96b397a8b40"

      def install
        bin.install "magebox-darwin-arm64" => "magebox"
      end
    else
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "ed36ada25e5de310a225caa0e2cce2579d4264464aa7cfd6c6e023d2db519170"

      def install
        bin.install "magebox-darwin-amd64" => "magebox"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "83c046c34bc2cc80807149b3186215ea1ec8d9e940344ff28b41f9c9798f355a"

      def install
        bin.install "magebox-linux-arm64" => "magebox"
      end
    else
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "70ea51a13825a885252f858645f8d5edc5e6487b09e08e0e2d1f29d7c564d1e0"

      def install
        bin.install "magebox-linux-amd64" => "magebox"
      end
    end
  end

  test do
    assert_match "MageBox", shell_output("#{bin}/magebox --version")
  end
end
