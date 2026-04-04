# typed: false
# frozen_string_literal: true

class MageboxAT0143 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.14.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "b93ddb219ec076a0558f6303c5bb2be7cfcccf9923bb9a10049974cd386fe130"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "80b8a375595a088404cd0ee93cf92864192d41b54b7bd55b25c52096cbee5fb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "9ea0ceca1bb9f3db057b82838ffe439e5f60947d424cce694930efd661f0eb7e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "2528d7bd03c75406c9e0129713ed7de45f67137be627b3325e31216afbc7da63"
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
