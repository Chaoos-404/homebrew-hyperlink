class Hyperlink < Formula
  desc "High-speed peer-to-peer file transfer over USB4 and Thunderbolt network links"
  homepage "https://github.com/Chaoos-404/HyperLink"
  version "0.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.1/Hyperlink-0.1.1-macos-universal.tar.gz"
    sha256 "b3e1a39781c85dd732d22888b54f3eec85a7e061c178a5d21ca34c139a7abff2"
  end

  on_linux do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.1/Hyperlink-0.1.1-linux-x64.tar.gz"
    sha256 "08babd9fe9d86591d49d0bbff1ad44812b2f048bdccbd8d3f73885ce089ebbcc"
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
