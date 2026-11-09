class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.11/manby-aarch64-apple-darwin.tar.gz"
      sha256 "c326155841fb1a7b2d86697cce408b93ef81046847f04eb86cb3e073ccca6f34"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.11/manby-x86_64-apple-darwin.tar.gz"
      sha256 "e59d3dde62a72df6746bbeff0d83f6e17bf8ba43b3207eca8b2934e015d65789"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.11/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffc789033ab1652cc2987e6885d7b726688611ffc93d44a664fb890378201cb4"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.11/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9f3e014510dae297898803cc9864a9a47f520c41d99d7097bcde170ed6ca88e"
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
