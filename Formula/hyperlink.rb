class Hyperlink < Formula
  desc "High-speed peer-to-peer file transfer over USB4 and Thunderbolt network links"
  homepage "https://github.com/Chaoos-404/HyperLink"
  version "0.1.4"
  license "MIT"

  on_macos do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.4/Hyperlink-0.1.4-macos-universal.tar.gz"
    sha256 "12ea00af633e4c8a4c0cdbc493feae0c7c6ef473cf2ba6ffcc9c8d651e968942"
  end

  on_linux do
    url "https://github.com/Chaoos-404/HyperLink/releases/download/v0.1.4/Hyperlink-0.1.4-linux-x64.tar.gz"
    sha256 "b5b629aecbd34c3283c5a9333f08d51b88f46c4b6224c750f7bc744b19516139"
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
