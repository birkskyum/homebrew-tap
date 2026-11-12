class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.5/manby-aarch64-apple-darwin.tar.gz"
      sha256 "83f8f2f222c6ddc8b79a74a322c655a9e01dc45e7ce27f420576ccff5477323e"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.5/manby-x86_64-apple-darwin.tar.gz"
      sha256 "6ca953eb41f5bd3caeb8e08e5cb70e4b837ddf161a8ca1e8f9e38949fabd2ace"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.5/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd91c2e525d544eec5b30e8b073420a176382883b1fc915c59b85d5c17c128a1"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.5/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d885684b2b38db053d4175f410c3c0b506180a25638a690af05f1815804d47f5"
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
