# typed: false
# frozen_string_literal: true

class MageboxAT101 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "ebaadeb1b601100ff0895ca5f96c79a63a5c48a76e62be4701db3010ae08b4ae"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "a7c16da284f66678f9c593474439e5c77ea5f114c8abf27e13906369f38da7d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "19793a24301e95f2686fb2dcbeac084ddd895aa5a6724fb336ac9a5408ff7d56"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "517db227fa4f30ece09184ccd32affba9234dddaa5fff8410e9b3ab7eef38803"
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
