class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.1/manby-aarch64-apple-darwin.tar.gz"
      sha256 "cb0f23164357b5d25d2c114836c2fd9c7d2a924f33e1c5183062b3e6d6972938"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.1/manby-x86_64-apple-darwin.tar.gz"
      sha256 "340ab817ffd6bdaca509279ba9f37b48cab7ae12e1ad1754c8964f44148c7a66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.1/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9713195c5da2ee8b20e7421aad54d238d7fa471639de339f1289b035a302bc81"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.1/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f74e9e95b696a90b27bf4308936d9503001456d69a8221f30776a84a9da1f33f"
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
