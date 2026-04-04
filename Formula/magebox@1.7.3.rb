# typed: false
# frozen_string_literal: true

class MageboxAT173 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "91c3202806ee6e9677728471705ff6b80eb62f04c0124207952e12cb885a6133"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "2d9bcf001d087816e2dfe924c4dea73ae8dbc90cec9a25c964d919403aff7b89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "f8acd46f13452b99bfbb2113a4871421f9f4089158e755febecb3784e1c60ab3"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "066e0330e1a8eebf5fa59b8f5664c56dc70e9ec73b7b063127a9ec3936270ee6"
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
