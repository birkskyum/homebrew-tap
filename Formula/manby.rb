class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.9/manby-aarch64-apple-darwin.tar.gz"
      sha256 "a21ae945226e0757673de9315e2007fced276ceae65b2165760692b032c69d30"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.9/manby-x86_64-apple-darwin.tar.gz"
      sha256 "e8626279a73df2b4afb8790ee182f8f530c6656bfc0d009bfa80ee6c3b35367e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.9/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd9341a9632e609ec20c2ae46b38e65c3301d911bf9d32ea3f8f768e76c59476"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.9/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4bd26d836480e20bbf090f9a58b4ec9492ef1cc6889d8ad2212cb16442449437"
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
