# typed: false
# frozen_string_literal: true

class MageboxAT01011 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.10.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "127684069c0c87f1bbe5e17fec834073543ddd09c4a3d74318841b20c3d3c445"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "beb5b1d59d4fd07f783b55c779193d3bbd3fb2a22b901e88294f7ec5a0e535ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "b7a3656fe9f86ae1e4f2f36e4b977c3d32fa2310b393fd5940ca026cc2f90972"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "2aeb1b25adf378e2045f32a66b0d5882d783e4edfca1714a77ef4a875179ce4a"
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
