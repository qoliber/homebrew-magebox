# typed: false
# frozen_string_literal: true

class MageboxAT180 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "6637f1becd091de6753faacf17519b46beacb1cb4219fc5cdeb3823c25951219"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "a4ab421ac0d8310f59bcc6d8a6469cc88aff8661f60c6b7f0a9709dea5718236"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "13d9e8381c8bf70d6c8279a055039a665b8773d83e2e96212fac46a3824406c2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "bb7a68449a0f9787f2d5296581a567c6cf7eef00e7866f80649a549fde0edc44"
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
