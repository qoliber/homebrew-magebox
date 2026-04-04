# typed: false
# frozen_string_literal: true

class MageboxAT122 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "f4897b6d67f1c65bddecc9a4134ce1924cbfa63a6a26462b4947809c2720a03d"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "e7e6f5ef83d65da4b2252b8191629700cd10438714fb6ea5f07c0574e929eb1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "4dc72f93e41d889e14d0eae33b4259ce54cb90fc8f5c6d80e50199f623640a1d"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "0d94b4f09e4f127dff59370a6cfd878153b2dea8cd74f4b6abb054aea4a2a681"
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
