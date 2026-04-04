# typed: false
# frozen_string_literal: true

class MageboxAT030 < Formula
  desc "Fast, native Magento development environment"
  homepage "https://magebox.dev"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-arm64"
      sha256 "c839bcd143c46b1bddfc7e58ce528be787dcc39a7134e970763cc55ca19f9054"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-darwin-amd64"
      sha256 "2adef8d77c2bb756c661aaecd9a707d213921ea992fb9318cc8badb0bb5eba19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-arm64"
      sha256 "f7e87575d4405b3becff41a9a016e52aa98d0d7812ef9e22ea5958bbe873b11e"
    end
    on_intel do
      url "https://github.com/qoliber/magebox/releases/download/v#{version}/magebox-linux-amd64"
      sha256 "4f08a3f4a2544db12ac7340bcabf9a40105526a884f7d993cd4304029b977a9c"
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
