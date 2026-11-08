class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.8/manby-aarch64-apple-darwin.tar.gz"
      sha256 "c037025efc4985dc4fa9ef9f5d3ff605dfef161608eb1e39302f3686f549c37a"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.8/manby-x86_64-apple-darwin.tar.gz"
      sha256 "510d59cfcfe7021eeacf071cba119e85c592c5b1e4938a2ebe93f1239daf7ab4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.8/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d33ad7c799b666a6e56b7b8a667ec1c328f648ef254b3fc8316d201cac3d00f"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.8/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06216625234f903e8979575e14f5f38f4483c5ff8f0d7c9f21aab192fce8d63c"
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
