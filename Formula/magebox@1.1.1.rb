# typed: false
# frozen_string_literal: true

class MageboxAT111 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "14e20eadf2d014f68704ba4d606df4cb5bc9d99a50b57b3640b8c794e7e36258"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "309fbfbface95ca284d01f728e657d6a1c7fe60858258f3fe1aada2eb462bf28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "4984ae2d0380791eada7fa7e94e12abb443fc1dfb392610093e05167d9a93b9f"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "d9c337fac4016312fa62ab8061fe77523bf03023555b36e96a8bf41584def848"
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
