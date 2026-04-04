# typed: false
# frozen_string_literal: true

class MageboxAT0110 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "0e92cc1103e2d89f696ca00e4a6df16f88dc391f402bb8d7ef3ae3acc48411e2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "30b6a7192cce31a7d456d75fa74606fd75f4b18ce2e9a72ab3b7add875d5d63b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "517c4ca970418affef788d864fecf21f8d5f2bdeeaf789f2b92e696accfa3b6e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "3625b063b5eee5bb894397749f5c9b297ebf2821b4c76abc59b0ea7056ba0574"
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
