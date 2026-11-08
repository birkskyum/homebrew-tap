class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.7/manby-aarch64-apple-darwin.tar.gz"
      sha256 "f17f36ce75b2d1685b3de47ed644893741eb04567efb175827b67e3662c6ceb9"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.7/manby-x86_64-apple-darwin.tar.gz"
      sha256 "eac4e9f781d8e1c2a5843861b3613beaefde262a90fee3d0e58db3faaeb933a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.7/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba7b2d08dfe5f40976c828ddc99905fe34ea0cb1cb9c7e104824f1f5172c34b6"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.7/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65a4668e5bfb32cf2633a92f45ea368e17a82b9e21156fc0f1a2c5c002a23a53"
    end
  end

  def install
    bin.install "manby"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/manby --version 2>&1")
    (testpath/"in.geojson").write <<~JSON
      {"type":"Feature","properties":{},"geometry":{"type":"LineString","coordinates":[[11.4,48.2],[11.5,48.3]]}}
    JSON
    system bin/"manby", "-q", "-z5", "-o", "out.pmtiles", "in.geojson"
    assert_path_exists testpath/"out.pmtiles"
  end
end
