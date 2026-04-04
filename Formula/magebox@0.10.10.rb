# typed: false
# frozen_string_literal: true

class MageboxAT01010 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.10.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "af6f93111e1e1b265c051bee481151f62c1f1ee509ba9cb5a3cc747c2edb9df5"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "9dd212df0af9fbf6d64f432213125ee0d54379d952e60697cabe4653ffd7707c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "0069b2e2af1b917461cca087dcf5ec8de483905890ef72eabac37e21a90dd82d"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "4f0c37fde94854c5ab447be51d7e1ae60e8961308dc563308501167c762ee774"
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
