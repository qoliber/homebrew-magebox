# typed: false
# frozen_string_literal: true

class MageboxAT0152 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.15.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "b84245239347873fcff2dd86fcbbc6387032f2189474494e9c0017e14af7d5c7"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "58612dede0d4eb9f23c1bef1611faadf646b66fd5d590374f4db16d017ee4ea2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "f779700f7cf470266c1d0b47fbfd08c0f7f1a2db012a29abb257bb212346b67d"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "09f070f1cb7e491a56b32f5a1bb77ff5baefe3bdbca47c90138d87055d29a252"
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
