# typed: false
# frozen_string_literal: true

class MageboxAT100 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "26e16665eb3061cd542ef371773338898ff7f919101af211f146e4ed9289de19"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "d9bbd2823475333cc4ce001bbb369929a8d758620732a3c00c956903a03a0f97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "243cdaccf0414b0dc3036477ba112bc9139827667ea5dbd78d7cfc1ea5bbab86"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "3b2f0cc2bb15e896692b32feaba1d6dada1d024c30888f4ab2790287761b4059"
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
