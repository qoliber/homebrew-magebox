# typed: false
# frozen_string_literal: true

class MageboxAT01214 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.12.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "cbfc865d5bc58c8ee68305d754d55a28fb774b4df9687159a921dd00675e29f8"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "e824bf832a1d393bb883cf789672cfbeeae3cc02e1f10e8eb89c95ba452d31be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "722ac144d5ec10b25600b72eefbf627f14954f766f8e896751a086b20f44b0ca"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "e48f3f0dea494fb86fca470b9b481546b295bcebc5df3f8a30fddf84bc3f5d7d"
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
