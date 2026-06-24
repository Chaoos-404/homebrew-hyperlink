class Hyperlink < Formula
  desc "High-speed peer-to-peer file transfer over USB4 and Thunderbolt network links"
  homepage "https://github.com/Chaoos-404/HyperLink"
  version "0.1.6"
  license "MIT"

  on_macos do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.6/Hyperlink-0.1.6-macos-universal.tar.gz"
    sha256 "b0092ffc0933d2c5aa4a5f101537f33772aab1c0bf8ea8c409f345356b592af9"
  end

  on_linux do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.6/Hyperlink-0.1.6-linux-x64.tar.gz"
    sha256 "c3a54d58a9f84753ec8022bc1f11f0343f58230f3c58dfab2a11c28f11335cdd"
  end

  def install
    bin.install "bin/hyperlink"
    bin.install "bin/hyperlink_file"
    bin.install "bin/hyperlink_bench"
    bin.install "bin/hyperlink_probe"

    include.install Dir["include/*"]
    lib.install "lib/libhyperlink.a"
    (lib/"cmake").install "lib/cmake/Hyperlink"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/hyperlink --help")
  end
end
