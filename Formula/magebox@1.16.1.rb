# typed: false
# frozen_string_literal: true

class MageboxAT1161 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "200398ad5a866c9ab2972d01bef5f12436b2da97bb096ea4b1dccda75fcb5204"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "fab9989b3d6d94e055cee593f621470742fce38afa2bf3469b55181a8be3ec30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "9bf0eb5ae95fa8dbf7649864d09390c87d9f33faf90aca3ac6f4bc7c66d95aa4"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "11f74007072012d9d154b9f6348a5a9c17ca479730c20d93cb14ef80e2ef59bf"
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
