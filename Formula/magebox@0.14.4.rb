# typed: false
# frozen_string_literal: true

class MageboxAT0144 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.14.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "415453913fb054c15b4867c8ca273c19c1d860ec40c8ad61149e4018a1d84c7e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "782037a3f98125aa7e13c3506ba01a69a03c561e027b5891a13e37dcd52854b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "af9b78193988d6e21aafd9bf0d5756ed9185c16e55a110887b91dcfa91888e6d"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "065c750d022eabaf2f8a4205f5e335aff51444d7cb1d8d66311d0e3ec4c53921"
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
