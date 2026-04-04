# typed: false
# frozen_string_literal: true

class MageboxAT040 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "aa6eaf2743b279606f75778bb5876bd5dae253e8e4608fddccdb57714b5bfa05"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "794f77cb187a55dfbda4afb6d600172145f37b23d694e78e52b28c5ccc048178"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "838bf867beb0364e2247a4217765b607a84067611505793d80e5e87e7d9906c0"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "e4aa096b65e2673870970786691056254aceb2011a1f24965e6d8059fcc9ec08"
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
