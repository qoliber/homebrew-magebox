# typed: false
# frozen_string_literal: true

class MageboxAT1101 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "bfa660730b006ceb45ecbffc35ae7b0253d8a641de4fd4232c27a96b397a8b40"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "ed36ada25e5de310a225caa0e2cce2579d4264464aa7cfd6c6e023d2db519170"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "83c046c34bc2cc80807149b3186215ea1ec8d9e940344ff28b41f9c9798f355a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "70ea51a13825a885252f858645f8d5edc5e6487b09e08e0e2d1f29d7c564d1e0"
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
