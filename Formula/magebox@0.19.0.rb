# typed: false
# frozen_string_literal: true

class MageboxAT0190 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "e64a58fa787e8169386fef6bf5ced2d9d31904884d163d2f9b62b4202253e911"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "207a911610776a7962cc5d5197e7be0f6dcc4dd130ea134a11ef9fc6373b7d9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "26f9242ee28ee03aad07fb2eca79f7b60912257dded7e6f84b1f26f3b55dcdbe"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "eeb1c71c6d1209c690c33c1295611471e097715d6b1d0cc6c9b99efdc2ac7f43"
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
