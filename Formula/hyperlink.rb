class Hyperlink < Formula
  desc "High-speed peer-to-peer file transfer over USB4 and Thunderbolt network links"
  homepage "https://github.com/Chaoos-404/HyperLink"
  version "0.1.5"
  license "MIT"

  on_macos do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.5/Hyperlink-0.1.5-macos-universal.tar.gz"
    sha256 "47c36dcd8e20b43308eecae9382d74ca3311969158842f3d714f7045ac2c12ed"
  end

  on_linux do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.5/Hyperlink-0.1.5-linux-x64.tar.gz"
    sha256 "1e79f8bfb428f08ff78846ba99cf45b47cbed89653fd8a5cb2b904ea8f9a0768"
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
