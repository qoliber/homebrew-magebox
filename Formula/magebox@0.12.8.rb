# typed: false
# frozen_string_literal: true

class MageboxAT0128 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.12.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "1fe58b54b5b4bb63efd3f51fd1cc7e0c8a191844c69744a72f22c89f4d05c071"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "7036113e34153c89d5d01705bc171d25a085d58b887c09e5f896d2190e2fac99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "f3434e299dadc488ce6d25d0f086b24dd3df99915afbca98df8faa6d4dc6af31"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "1c0380f7dac5034320bba577d1c75df64183c6a4e30a6a00a8edd410ef37610e"
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
