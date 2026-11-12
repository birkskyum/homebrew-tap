class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.4/manby-aarch64-apple-darwin.tar.gz"
      sha256 "4dba92c409e36bd48ea54b9c50ff5a8bd3f11403d9cef651889f01a0aeda2dba"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.4/manby-x86_64-apple-darwin.tar.gz"
      sha256 "2dbe3544de410be8aca107ade9d59e12b44bb627aebeba321acb8b3ec92d4a3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.4/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e3a609b30fa094110e42c087f7cffbe484ef38bd0ca02d1a1e8eaafd3f9c0a9e"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.4/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91d26b01864cb67777cd89b7cb0477852464943d8cf75201d60f0b1c9a78ecab"
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
