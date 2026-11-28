class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.12/manby-aarch64-apple-darwin.tar.gz"
      sha256 "095a5f188b1c2406ee9ab045a11569f8b755b290dc38342b730522457b6da128"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.12/manby-x86_64-apple-darwin.tar.gz"
      sha256 "0ed9354671ffa9cc3ccc3516400e674f78cef278b9a5575dec5d44d2aee25e60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.12/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "689748023e0849f77bfc8f089ed731850a6c7df1a21a8f8aa92a83c4343b82bd"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.12/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8892540294b80fde608565ef9733fb62e5430c4da22bc5f7c3d3bb7e8a8664e9"
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
