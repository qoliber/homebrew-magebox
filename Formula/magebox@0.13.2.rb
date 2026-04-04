# typed: false
# frozen_string_literal: true

class MageboxAT0132 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.13.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "783f2da8a0ef56badc998bd269d82b54f94c2f16199e2c5d06786076e4a96dd3"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "8290489c2de69159166a8efa7d76a2d4cc2f157de369462a3677ea15f1dd0e42"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "bed34356cb5a112f8b034916e82cf212e133be017b03dd23900c9143e5567db2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "fbb20fd75bf9aa8c0abe2ad71e1ab5611aa7db4cc5a8992b28f5ad56a554e5db"
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
