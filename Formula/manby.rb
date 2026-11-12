class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.3/manby-aarch64-apple-darwin.tar.gz"
      sha256 "de455b55f497fa2e8c873f8bd66d22ac9318f78fda27793167d14406c9c29220"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.3/manby-x86_64-apple-darwin.tar.gz"
      sha256 "7ad66183ed0713941042bcdc11789c5592babbe7a4e3f38334f4f384e52a3e5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.3/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3bce8f38f55df0f107eadb666d1fcb60c78959f2dd35a9cce03b3328bc966e10"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.3/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ce4119c72a4b1f3a968027b37a8ed87c140b48c9a00772dc5edd6c72705420c"
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
