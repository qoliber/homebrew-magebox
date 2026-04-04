# typed: false
# frozen_string_literal: true

class MageboxAT091 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "e400e3128dfe13b5797f3ef919ea8a19ac6121ce373cdfac1dd6a50dce0f4cbe"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "7b2a99388b35bf9a9f48faf8c91d214130eb38902de8d216e96216da70f63feb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "99d80506510e48fdacdd179fadda375fbad056dcb67b18715b008345676c4124"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "a78cf017a36fdfcdaa2c836063c32e65e68d2009df978137f140ab2ffbde31b7"
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
