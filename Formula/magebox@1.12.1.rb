# typed: false
# frozen_string_literal: true

class MageboxAT1121 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "8d6dce8c44f93ba37c95633ed25eb93edf32ad5751d81eb68bd671bd2acc3320"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "986ba75e30d93fc7cc07ede44d6772183a3c8115001781abcf81cf0579763353"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "19bfc028906f2060dd374604b41ac13037250d9c4d110a94f167160ef6aa313e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "8453082fde9c61bdcc58a71c9211c820524c0266a8a6e64865da6c636886b791"
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
