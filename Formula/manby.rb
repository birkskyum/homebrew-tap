class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.2/manby-aarch64-apple-darwin.tar.gz"
      sha256 "8e0e0fbff774ec4de5119b4e24c0c1a23ec98e7b595f173ff08b962abcff827f"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.2/manby-x86_64-apple-darwin.tar.gz"
      sha256 "1bcf86bdff601c9c235acf803a372c6b7f32dcc15077664e9b49910e9be303d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.2/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "696c8988023996b58966a23e86bd8a4dc5c085bae33fa2bbf2998c3fa3d6adea"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.2/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bee547694c0be5b33c2654c83c0f4ea7643c7fca9d60608b546b12dd1e64221d"
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
