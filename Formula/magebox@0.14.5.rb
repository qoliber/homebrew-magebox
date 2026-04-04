# typed: false
# frozen_string_literal: true

class MageboxAT0145 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.14.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "cedb08bd25dcacb2061c67e9ed7ee1bcf7300aed4ab8d7a139bafee8d7a24524"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "430debdb0e2fcb334eae026795ca64bd7c99566d451ef9a16fd8e04f898bb851"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "131efd244fff832d50f772281bbc7945e9d10db53e92b72f25922814cdbbcf09"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "5a9b702bb52b02f272a02394cf3e751dc20bf957e92f889017a033825af350b6"
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
