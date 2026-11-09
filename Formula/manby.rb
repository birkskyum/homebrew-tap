class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.10/manby-aarch64-apple-darwin.tar.gz"
      sha256 "6626e782a2b2e2d52114a6d493e8099071f41ae6a4c395b18709b4dc843600d0"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.10/manby-x86_64-apple-darwin.tar.gz"
      sha256 "f6687a100720492bb0310924c1722bede8656bac8cba42d89cc4e95251410461"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.10/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "514ec38c615c3a97ad1d223ff842ad22edc807f422ed219247f8073cb4fdef62"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.10/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cdb1c3661c21768cd1764064a27571bd98e33e6149ca8d83df43871d0fc808cf"
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
