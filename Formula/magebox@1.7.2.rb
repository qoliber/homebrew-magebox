# typed: false
# frozen_string_literal: true

class MageboxAT172 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "d7a7b54082d92288595a20a72750a43e9c36731424506bfd801d234faac994dd"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "4532396f7cb27e6f0f4185a8560b0df5d710860c306e7c02f8245379e655c047"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "0e98c5f196059ab72167f36714ad52ee70c69760b7d0789beab52826c2401427"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "45e39eb3efe3c339d778a0163a95caf375cb038db1c90e2f95337658e9c67e21"
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
