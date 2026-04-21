# typed: false
# frozen_string_literal: true

class MageboxAT1151 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "f5fa2669561c1b3db7613dd9d9af866dfdac28499db1047faa7138a6d38f6b6e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "9a1bab3cfca1c498dc670014705cc59891be0f01b044032bf2798b2d11aa2646"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "00d1d5f791c8411b95a6321ad199c4cda19b3740bfcf17fd3ff91625fd98779a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "d8693bd2267b89886e6d18cbd684087f31f097c2bb528c8d8233be2e102b4122"
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
