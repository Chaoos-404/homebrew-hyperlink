class Hyperlink < Formula
  desc "High-speed peer-to-peer file transfer over USB4 and Thunderbolt network links"
  homepage "https://github.com/Chaoos-404/HyperLink"
  version "0.1.2"
  license "MIT"

  on_macos do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.2/Hyperlink-0.1.2-macos-universal.tar.gz"
    sha256 "bf953d3ca9c2f8960a85b114da48b0b9cb0762870c145f0ac650b3fe770e82ef"
  end

  on_linux do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.2/Hyperlink-0.1.2-linux-x64.tar.gz"
    sha256 "a0761561759df49071db431b0c54c6271d0546e70fdc8ebf4ea189fdc25b55a4"
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
