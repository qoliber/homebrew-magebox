# typed: false
# frozen_string_literal: true

class Magebox < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "2.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "015071892ac90e89d4892ba142511192a470a4765393245baed2747467500836"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "d2a5bc545071414705ddf36d5d375f1ef6527d87baea535cb6389a7a4162ce03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "424ba8f976502cceeacfd2473eeaa3574c98d67fe5d1746ff73d39128b1140da"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "ff9e92545859918203f132b9529417e756968cb399cb1711c84a534e81fe63d7"
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
