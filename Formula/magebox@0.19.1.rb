# typed: false
# frozen_string_literal: true

class MageboxAT0191 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "299d7ef930a3ffd8edc92add630f0970e1a3bdc516adaa3466d591ab7d93d55b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "c20b4eda11bd5c64ae786b8d55cb2653492644136f4d9fb69d8e5e3e4c42dda2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "c3d02506dbb0a4450bf22427d659d328143ce1eccfdb43e85374c754ed0e68ed"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "d36ac55fa49019b8e58e76f85011548505d25f5c2dbd26cd2b3b79c2e0a8db79"
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
