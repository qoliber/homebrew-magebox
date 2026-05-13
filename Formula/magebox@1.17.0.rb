# typed: false
# frozen_string_literal: true

class MageboxAT1170 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "443cfc807b48074ec64c4dbfdf9a94e20627d408ef477c62b73e5dec195084f9"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "91615998b1893510d9922afb6a24dd2500916711d4e140b57f71692281161ad4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "0e42aa7132f391143b31dceddd2ade39b0e38bd6043b346d170d092037d0970a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "d643a1701c1d9548a0659e6455d106bc5c9b083b4c40395e9dba49147fe94737"
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
