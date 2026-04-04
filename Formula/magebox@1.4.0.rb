# typed: false
# frozen_string_literal: true

class MageboxAT140 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "314c51bd3edee84b7a5e7cf4c85c81bd4c024198ff02287bc6d5ad49a56e372a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "3629b85425587493834431235f5dbc5572390a2bbc857683d8bed86bcf11898e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "8ae2fdfef923a59b49fba527a61ab4b53495af74b7a71958a5c01522f736bb08"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "d97997aa34978666b136d741ee8a99f1f80130fde49f5ef1d2e7193ebd1ebe20"
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
