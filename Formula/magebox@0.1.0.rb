# typed: false
# frozen_string_literal: true

class MageboxAT010 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "80778da1becdb8d4a42805cac3d7a528f0dc2d3f5ea6b0f19a63fb81e81775ab"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "553b378acf6674f8211432d09276ea7ddf007166a3025bed7655dcd575a6d6fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "7748b6a06c6a68f70233197a03a9c07dd2d5c1ceea9ddd98cea970b2188f936f"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "677f12dd4baea35913d16f31d5983e3a887c59e0f90a13507cb544c7c4fae6c3"
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
