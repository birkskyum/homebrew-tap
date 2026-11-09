class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.0/manby-aarch64-apple-darwin.tar.gz"
      sha256 "8474ef2b78bf8876032814b11d35e00b331c39f0f02729ee1c9e40582e31cde3"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.0/manby-x86_64-apple-darwin.tar.gz"
      sha256 "7a66dbd7dfbf7a7629eacc335a1eb1ca752c0eac0357599776bf7f003a568957"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.0/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "adc020f3c6704bad3c5599483955735a8814f2ea842f2b949ff05a8f3c6aa923"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.0/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d101a2004f609ea1ac610d053440b0a4c34973b0761b01547f0063b5440a5ab7"
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
