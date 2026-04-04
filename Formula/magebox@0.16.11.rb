# typed: false
# frozen_string_literal: true

class MageboxAT01611 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.16.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "90e85e8e03fa4b9dccc5adddcd2b7d18bfef716f96dbe7bca46690479c8f911a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "fff45ed4a364ff082201296ed91261b4699e8b119d16e50b4461f9b7a6e72e59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "1527a2f3dfb636f5da1073598bbf09ce5884b592b7d9fb76c40c8f4c507483a6"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "6d943876341009f0fa1682c5330df11fa57fc15cadd0feaf43034ba71d2341b2"
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
