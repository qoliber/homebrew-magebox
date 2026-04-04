# typed: false
# frozen_string_literal: true

class MageboxAT060 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "ba6dfa96acf13ad67f36edb9c17491a6118099e26740190754b5311d3fcf32c9"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "c45ebeb407ae8326e7e2ce42c1cbba56d535424676d8c3626ac08187fee9659a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "aa1761c63e04db52d334590bd232d8552949cea115349767a7623dda8e5ae01e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "3aa359f6d553d0fe7df453a161247bd3cd33ee2501a40ed30d308c3a10c0a6da"
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
