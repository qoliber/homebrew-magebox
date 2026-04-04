# typed: false
# frozen_string_literal: true

class MageboxAT0170 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "c0eb1d1b2f29792d01285988f2e85bbd0c295759f1167db4227f4bcc5a991fb6"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "20ab4bf309652f9f35756ebf94f06fe258566aee2813323b0ee075bc2e233601"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "8ae765e92b1bc510a779d30e7f26bf5ca97994e80c2dc57796495c2b77b6302f"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "5d62f3d7efbe5e0aca8647d9f7e79095187dc69ff1cd968f34cbcec36109af37"
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
