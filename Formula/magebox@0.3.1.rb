# typed: false
# frozen_string_literal: true

class MageboxAT031 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "4ea1980b6a6ca7a28fd0d290b830e39c07ac5037fb86af093ef16f84b667f75a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "45eefbf9e85f4cf7e9a644cc2bc28fd985ef36abf167a627960e78db6f40df2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "270546d786f268936dd1d3cb88143da06d07451b75692a73f3b2336dab3c9341"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "7617862ee341361cfdbd155db4de8599d2f3bb93685844f26ff9505270bdc122"
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
