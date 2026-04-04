# typed: false
# frozen_string_literal: true

class MageboxAT0171 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "b91dfc6453e84d3457d052266b68267ffb1a8703da0dcd53ad4a350ed0c32382"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "fbf17f547f10b1effae8c0be11700ad779315b9818bd6c89a3e9131f95f1a0d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "a400e6eed14f0147dfa6cbb967f21ba4afc3647d1e92ddab24b9b56954235a7a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "ab6f11c62b8dbec1c01f2544097dc967b9d56e617914a0a271bd3a91c556ede0"
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
