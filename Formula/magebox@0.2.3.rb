# typed: false
# frozen_string_literal: true

class MageboxAT023 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "ab0fd9ab8409e68601b52bac188f032abfd0dd42223a44069613bb229af4a015"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "0df8f93bfe08e75c402df38952a25f3a275bf24ec644769af0dcd8e74e6b9f7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "9cb9fb7aa196a6446c41f02908f78e01065cddc994fef883a700b5fa8dde0fda"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "11dbe618c52cb5a7f333bba823bb52c02124837ae864637a2358f75b3cee09a7"
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
