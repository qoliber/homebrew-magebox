# typed: false
# frozen_string_literal: true

class MageboxAT1141 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "c55f782f7ddf83a594f62fef83993103fe6607194b7f2b3e2ec9d2f6c2f5844b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "d3d5d62c513705954baf420e59bbd3f8122ea2ace453a8b0e3df835e501d13b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "27740b930f26d0ded0c6050ff61dacf330b04319fc6f06102dca7eeadf4b11a1"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "8f933a4b9c1b256026b4ceea2e0839fb8f8aedbae28683e3ef585686db49033f"
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
