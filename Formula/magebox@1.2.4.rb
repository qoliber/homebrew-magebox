# typed: false
# frozen_string_literal: true

class MageboxAT124 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "edef29aada05806325b1238416d6a55f45314e7dcb598c135d6b1d6846b1d082"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "a10ff76f93224699319c89a785605183c6f5b4df9755006d8f40014231ca3644"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "163f682120937a31bbf640b2e346921cc0a090c99913c4ab43a82a8415835b18"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "2b8b16010720edaff32fbe2f74f59eaee2db665bfcaf9f21e820cfef12992d3a"
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
