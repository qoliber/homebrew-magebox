# typed: false
# frozen_string_literal: true

class MageboxAT1160 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "1.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "a3aef4d08a4142f95d15a0de6b507c8aa352ade8c2aef54295612d9d00ea124a"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "5998bfc235717de0803516ba198e4fd7818ab6ae80f598d7f3b3d1b3c7a45a27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "efbac5cb68fba2f91df1ab94e1d4339858d91310c22cce27b652bd6ec65c8b20"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "7a7f56bc41fd246617a0c86bbabc3dbcfe1831285826ffaae1a0f30968699979"
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
