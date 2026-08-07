# typed: false
# frozen_string_literal: true

class MageboxAT1190 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "7112df039da4ec0de51fecbfc0650dc6c1c3820b7cc7a345577b36821dcc723b"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "632d31c2d707f840f75cec855ca1e47c74ff9c3ed2e36f911058ad27529e63d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "95a553feaff09a759d212800512efed97f4af339569eb44b8d6db9040e7901c5"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "a08050e783af89332a3d2175bd4eedcf285aceeb5fa74c712af8716461dbe786"
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
