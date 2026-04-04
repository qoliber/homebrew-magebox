# typed: false
# frozen_string_literal: true

class MageboxAT1111 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "7e511efe0ef05096b0c78cfa6fd28d22b133262c94ec96b67426d47ee8cc507d"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "fa81e1a77c96079dc1e666647c16c9b9567cbb0b047a659ca4bc09a8bfe4771a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "1400ab0a64f806e6dcb764656db2232a5b077e8be50e8389ad27f0470ddfe851"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "4df55692967f4c6a7255def4a9fab33137d58a3afc313d3365edc6bb65b3a76b"
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
