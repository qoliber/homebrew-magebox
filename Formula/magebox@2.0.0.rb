# typed: false
# frozen_string_literal: true

class MageboxAT200 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "025d3dee33ddf6e1fefb8e2b33ce9a62e1a4c50289cf8bd131cf9f78b57235b7"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "bbd6f8c098456244a54a7a796bc480e62015d559bfefd99af08bce2c61e01dbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "e58a9afca137e514da3829162de299e50532d700b26809a4f163b44b34b9b018"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "a51c3f80a6aabb3b62f3f7a969b136d61ca5adde64ed49818bedf84dccae3716"
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
