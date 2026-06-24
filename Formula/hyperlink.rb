class Hyperlink < Formula
  desc "High-speed peer-to-peer file transfer over USB4 and Thunderbolt network links"
  homepage "https://github.com/Chaoos-404/HyperLink"
  version "0.1.3"
  license "MIT"

  on_macos do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.3/Hyperlink-0.1.3-macos-universal.tar.gz"
    sha256 "6487092254678017d62082ff6defa0ba09a7945d4d570b853b5766ebf167caa7"
  end

  on_linux do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.3/Hyperlink-0.1.3-linux-x64.tar.gz"
    sha256 "8454d486aba210f48f52addf5e7740d3768c08aba8ed5bea3d2f1a7a66cd96a1"
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
