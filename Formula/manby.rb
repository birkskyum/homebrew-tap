class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.8/manby-aarch64-apple-darwin.tar.gz"
      sha256 "7720bc07685b681c47690e99688c6b3350deb89402b9d3a7b4596a75234a19e7"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.8/manby-x86_64-apple-darwin.tar.gz"
      sha256 "e043b0fe566a3631afd160cb3c7d0424d16c4af54376c4c8b78c45f8e17b06f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.8/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e43ed8b9250e1cc545252d0da74527ae6c17faec4dd122e61701e4c8f29fbcc9"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.8/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c1ed857ca4963db5269d133f4461354d6bf9f0dcedc77459b298dd8a5fcd731"
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
