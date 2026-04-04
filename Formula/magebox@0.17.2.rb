# typed: false
# frozen_string_literal: true

class MageboxAT0172 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.17.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "6102a457d33a260655a1b7d9d8a83b13ef03d0d82ff5c6cff4108edbe5d637af"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "8c95a56281a054dc44327bf72ae920f5868c61b2ad8de167218d9ac671667106"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "28a0180616527d63aacc8bbb2312caa7e0ba9979c5a0248ad3f9bcd9181b1475"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "077c6ccae0b1af7e013b2e01135deaf2e3e30d6ca327a1390d432508e14b78d5"
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
