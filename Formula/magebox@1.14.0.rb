# typed: false
# frozen_string_literal: true

class MageboxAT1140 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "5d620f9ef7312f6868906abe9e55e122a9f68cae3470d8dfa435a660f9ea9dcd"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "e9357fd947d8b596a90627159d2da3e0a54e3e6d3f8efd455eb6703db563e58a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "c6e8d6e9eacff87b8a48b7ef8b49a746bae757af992b3608ed9d665f8b283751"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "681b4559b122140e5cb577053141257fd675c1a8d99b6f7c5d867a11f98870ed"
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
