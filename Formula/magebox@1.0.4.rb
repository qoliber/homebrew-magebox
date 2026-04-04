# typed: false
# frozen_string_literal: true

class MageboxAT104 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "b9113cf2677c3430fd81933a551bb6a221e218a8ea2e04855a7d4bfc2b611296"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "f757a3f1240de8ee41a17fc102c1c1915e3f7c9bee9e1d29fc5048501ea4128b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "b8093c08401a598d2fc61cd1099a49d4151371acd348f44bc82aa8e394430a9e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "537eaf46fb52a447949396363fc7523c4eccdc92b92c5fd5366eb6b10605e984"
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
