# typed: false
# frozen_string_literal: true

class MageboxAT0160 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "8bde3fd0326745b9d32e288fc9261502b175d801715d3525e5c7f3df65687778"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "d194ac6d2bc3b55b3c894a0c6ff2bbc41daf51dbd137a5ee6fa6a6bf1ebd942a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "ec3d834b62c8d3b2b8cf660c2f3086aa3ed31b18ef4c10de2cd6dda76cc89120"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "c6dfa76e647e97e5ee0f6676d2d924406b745efe564f4057e833d2fa97995aea"
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
