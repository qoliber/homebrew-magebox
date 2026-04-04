# typed: false
# frozen_string_literal: true

class MageboxAT070 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "77fdd301232d053c1e8dc9db0d21273b6a808323ef0e5090f5446dc67bb9b64a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "3327428baa8dafda86ea8d51945f9eec4415eb0271e369deadfca367a0d1472f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "5caaf43d916b89771d6d464cc8ab6fb8d138bca094c0079c65271bcdfe12ebbc"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "ce5e9d3b1c36034387ebaf248c70875afb2eaa5372d9ac25d32e1a7a6672db91"
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
