# typed: false
# frozen_string_literal: true

class MageboxAT102 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "043daf4095d13eff355964de1d559b750177a5d89dfabb92c9f572f944bddfeb"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "6c4190112f631d6f2ef95e59514b79860e9d9ff95330c86def224f54b67114ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "41934dfb8855265378a9ccb22d5e0aeb5e3106c440389cbd82327426bc0252e8"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "3f592a168933bd2fb73c453384e2ff90a5e86f6c0e9405c7e8ed0ef643fb44a7"
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
