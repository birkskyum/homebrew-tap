class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.10/manby-aarch64-apple-darwin.tar.gz"
      sha256 "14e3b8df53b9ff92e07e0b0ec5c20438c1f6bd2fc5fb34b14548a62aeb72891a"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.10/manby-x86_64-apple-darwin.tar.gz"
      sha256 "32f460a84c21513a1b80b598405e135c30b127950e381c06b3081245105b4833"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.10/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4c2837fc6bb1d1642985016756a49bf962569e07bebe9039e11ba82b4623e59"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.10/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1bcc488a48ae650171e34045463135a3a33aeb2fcf3eb9dbf6a760c7806f9aa"
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
