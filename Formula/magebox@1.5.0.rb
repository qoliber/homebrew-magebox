# typed: false
# frozen_string_literal: true

class MageboxAT150 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "16f6b10b23ef695012d6fe537ee934e55138e291ac9901d562eb65d7944380b1"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "dd62f2f47b5e118468fa8a85f723ef749c358ad3f4e0587159d38159f5f68e10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "e07c1bbc21e0fc32ad60f2d2b35818e5cdc8be95ff3c24064382ef7c16f2e03e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "81b81acbf3986c4b16c44112c785e3ac02a4cb62b35900b0232da1652b64738b"
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
