class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.4/manby-aarch64-apple-darwin.tar.gz"
      sha256 "9b9fa117d4edab007e05afd9cf39621b09f96ad3ff18d885c543cb4d2ee42977"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.4/manby-x86_64-apple-darwin.tar.gz"
      sha256 "1a5a558eaca8d288cd0357723de34e707ecad02c181076328cf6f65146f17f70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.4/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c9ef1a5542c52ba3b0b987bed26ca4f3bb3b04fd944ac61d0f4c4cfb6202b75"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.4/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aca93dab03af1e4daf936b2f3d468db5468eb77f30824785a65ea57e9a608d25"
    end
  end

  def install
    bin.install "manby"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/manby --version")
    (testpath/"in.geojson").write <<~JSON
      {"type":"Feature","properties":{},"geometry":{"type":"LineString","coordinates":[[11.4,48.2],[11.5,48.3]]}}
    JSON
    system bin/"manby", "-q", "-z5", "-o", "out.pmtiles", "in.geojson"
    assert_path_exists testpath/"out.pmtiles"
  end
end
