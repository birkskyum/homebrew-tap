class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.6/manby-aarch64-apple-darwin.tar.gz"
      sha256 "dcd34a22196b64215ca7dace372d63359ba73a4f98d9ad14ee7db255fb132fbf"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.6/manby-x86_64-apple-darwin.tar.gz"
      sha256 "5ef538160f084de12938a332b9f14610033359165d5a51cdca87d518eb225bd9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.6/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff362e6c9329769b746d8976aff2f37a6c2d15972729f4965f4b66fb70bc1c36"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.6/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b26e2c4685230cb97d08cb4ab43b73b44421c89bbd2bdb65910aef76aa0b943b"
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
