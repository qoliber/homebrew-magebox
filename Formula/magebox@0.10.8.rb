# typed: false
# frozen_string_literal: true

class MageboxAT0108 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.10.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "82bb68da816a52dd05124b0a2fb32dc899030e4c59e5ce7559302dbb33dc08ee"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "17100da57ff4409b7d52a57d2b0dbfe37cea89141776e08108d7f48478699e49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "4abf6fac5e50cc2721dbb3fac721865eb3514f2da9f4af594854eaf84976b7af"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "47512bcc07646b5ddae81d3cc2eed3a0ab0b6f1f17e898d7c1ee47dc77c660dc"
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
