class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.11/manby-aarch64-apple-darwin.tar.gz"
      sha256 "6de20b55ec62298dd76b797d03de95894b7d9fee1dc610269ddb064477861773"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.11/manby-x86_64-apple-darwin.tar.gz"
      sha256 "003a530bb4907083ba29419a3aaa290bb118c26c0cd78b13fba1366e67e37a6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.11/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "afd5a44bfc0235d6a102e4a5d0adc7df8b99a8284f7d45d66d36d30142c92ff4"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.11/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "756edea0fded7d799ec6062d05a1dd797cb77323716e502a44eda85820bcfc2c"
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
