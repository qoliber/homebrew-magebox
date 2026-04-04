# typed: false
# frozen_string_literal: true

class MageboxAT0107 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.10.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "dd8c382938dfd49db49560b71fef1ad0f26174d5c829a2360066ec30476e0917"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "9abe399a7d2c7f56f45432ca4a08ce5070b4daae44ef8d72c9f5b99de509f8e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "e2c7ac89b25c4e5c0ac005782f697aa11fd1056823711b5e0e767ed59d8895c2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "7189fa46e5f7fcce7d253dde1ce3e2a1912aca4a12e03c2a395999db61b5935a"
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
