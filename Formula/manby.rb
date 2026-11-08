class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.9/manby-aarch64-apple-darwin.tar.gz"
      sha256 "eda3826c2cdabac19cf6cf4e19ec888f4b508f3b53f3b940f7067f3d72c16653"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.9/manby-x86_64-apple-darwin.tar.gz"
      sha256 "aae912187df2ced00da725125c08bae5f04c6e216c1fa67244f228bc792e4829"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.9/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0d3ae34671db26a67619bbcd6f841f122df997e85fefcb5940bda5a5ef1edf2"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.9/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6cbb13f236c35028d21248ac65a43771b986e3545e231457829687aef56e8d50"
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
