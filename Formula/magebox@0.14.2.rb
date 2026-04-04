# typed: false
# frozen_string_literal: true

class MageboxAT0142 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.14.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "40a8754a749bc3aac57df14402ff5ae13f42397c2aa194436a3daab1c984424b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "dc62f0db740941943200ce0f84265445c73466ee362804e118bc365747251fbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "012b7be04fa18e18a6512c304494f52a278377fee8ddcb811ab6ea2b59df032a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "fff3d2d0e1e1cca437c089749e6c5db837fada9a90827d91fe9ab87606520b08"
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
