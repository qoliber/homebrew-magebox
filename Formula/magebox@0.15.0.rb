# typed: false
# frozen_string_literal: true

class MageboxAT0150 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "07d3782d0b7ece28d362a7b6466f3cdfdebf1b92243e2d503c820ea2dcb2f073"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "ab0d1acbbf636e5636ca84bff4d3634882185bd67b561cd80cb0e079681480f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "5d77e20f480354eadc53bfc73c3b792f67cd329582b939ef06ef80c3c74ae910"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "132c7fce8e219d1fccfe1544a831f84728b148ad1c88cbf0be19ed6cac238288"
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
