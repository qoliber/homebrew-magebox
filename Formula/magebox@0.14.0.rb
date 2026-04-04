# typed: false
# frozen_string_literal: true

class MageboxAT0140 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "bb344735b67e809beb45493c266ea9582fcbef67048002d919b05171607f9a43"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "23a18b72caaa3925698af92133ff9cb919f3fab6cd524c87574724366db28c5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "10b373daad9bd1cf43c3248a165974c8196164d094c9652a59493245c0562f17"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "1fc39863cbe8df8c0c332efea354dd6418909975aeb9465b461af704c28a3842"
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
