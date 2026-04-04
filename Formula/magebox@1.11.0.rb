# typed: false
# frozen_string_literal: true

class MageboxAT1110 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "aa755441f6b7ff0971fdaf9d59c25e97c0985119b19877837962ca8cf5bcf37a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "008a41e8a06d11d7b93790c16de291c8b4ff5c6c5c624ad6860a92bd116f213b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "6b9d15250895f540866ca80ae3273136f21558569a212308361450e465553523"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "dcc684e5563e1a83af50e3c9b96876ee0a6b022dfafe4b6290a97cc514b26f4e"
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
