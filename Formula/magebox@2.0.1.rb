# typed: false
# frozen_string_literal: true

class MageboxAT201 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "0631068f0c62ad7eb68bb3a465fcdf65882cc37d0453934686a18ed5448e47ad"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "37a2f20be1e040a2e8f4285365f051a5e60d4d2b753de95c82d8a8070dff7c8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "9969fece869fbc3f653e41afe21cf899262a917222a60f67a9d47b991d923b47"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "467da660741361512e336b75e33672c98865db97795cc99f42326fc000514518"
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
