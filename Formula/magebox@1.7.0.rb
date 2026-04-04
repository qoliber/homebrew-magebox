# typed: false
# frozen_string_literal: true

class MageboxAT170 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "286b8d9c3957799bb9eff96d62e74e639676d9af9add24d0f36d5ecfd776922b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "f434af10455c1bf15382e0fa8671d658a14c303fb6d7707f04074242694b36f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "ce94a33778268e6cbfae52f9393c30b2091f9540e733bacc91a28de5ccd516d8"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "d3187dc97a7648897103f18be422efd5fcedb8f08de457880ae34f74d0ad9630"
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
