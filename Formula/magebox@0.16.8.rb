# typed: false
# frozen_string_literal: true

class MageboxAT0168 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.16.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "559ab3faf3290fb76384ac3281edfdaa14581b953c7042b3b38d35eb7d6e6f30"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "c91b6adc0e516a17de8b17d080ee903b196260e80dff4b5fb58549f93f4a0a10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "ed22940fabb531d778c22d034a0ae57a9851a0b9368d8ab7a44f20518de6ee85"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "694c529eebd47ac7f6571c8ee910748f56791b9ee093daa62d27c5b1941bbae9"
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
