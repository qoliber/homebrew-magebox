# typed: false
# frozen_string_literal: true

class MageboxAT160 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "2e8e973ef54168b8e78125bb260fedf1dbe0d0fe895b9ed74a91e912113f076d"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "ed5465d03aa4773463dc400e8b4c0b46f6dac0748e196ca2095fda9ff8e2a4e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "bdd736bf3e75f08231d450285aa605199bc6b14020bf06d60fa8f3cc54389a9b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "45b73f68ecc9b5b75d259b84a08ba2b8a4bdd939e1054cfa01811dddd9205224"
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
