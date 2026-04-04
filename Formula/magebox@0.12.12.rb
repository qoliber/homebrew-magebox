# typed: false
# frozen_string_literal: true

class MageboxAT01212 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.12.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "614aff25f69ebd8f543686f4a0f1718600fdcf3a97a8c2f45fc27f1d16c4eaab"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "9887c1d4c09d3af51e411da990e324766d6e8f3f06b42cf7c7ab1d79d84c7277"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "fea135cc98af8efd71e65dcc19c46f62c4ee6118ca13cbcea6b981333dd5eb7e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "aeee343402616839ecf95f4ae785fb877ffae9c3bda18e1d508ff09a69fb10a4"
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
