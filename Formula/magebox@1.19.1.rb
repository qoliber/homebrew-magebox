# typed: false
# frozen_string_literal: true

class MageboxAT1191 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "bca9be1c1fa0bfa10a08e8426f05c8b33ddd8b443c7044fd6a73d971ad66429a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "be13008a02a4ed2a620736a1ef7b07f304a33b63338d193c91c46ea701c34db3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "1a8ed960415a10fb280f65107b0dfc1d8e1c8a0434a7488d803e9e507ba363a4"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "2de73bb08f147380309d4edc8892ecd15b874b4866919ae7e8d71619ec4029ab"
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
