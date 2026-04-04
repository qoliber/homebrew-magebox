# typed: false
# frozen_string_literal: true

class MageboxAT052 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "9cbaaeead1ef41b4cbc7e7e865f38c4c54c43daf2417be7d2fddf9fc6ade9ee2"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "d34565ffe5724b8ce7dc8b579da2e827164e75266082edc8a1475c3399868917"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "daaf4c98d634fc64429c6a447a6411b5e468362953ebef85d7fc6246f0383e9d"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "b93bdb0ddddb9fadd92d04b33b884d2b7d755d4455871eeda7ca390a744988b3"
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
