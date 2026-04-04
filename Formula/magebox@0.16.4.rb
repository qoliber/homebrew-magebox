# typed: false
# frozen_string_literal: true

class MageboxAT0164 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.16.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "b79f9df411d85088c1aaa09016bdb37f25b77ce8a8151327f555f70153b0b2d4"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "9246c2ebeab12a1db514d2ad862e3c2ab433913a9e8d078600488fc4cda3944b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "cb2df3006111c31f2d612c050fb3f5e9edf90ccfd8a89f2103c80e31bc42565c"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "3afe678d879e816a57e519fc0680cb4887bd9949514d53b646521e851154f25f"
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
