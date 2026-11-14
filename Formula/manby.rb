class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.7/manby-aarch64-apple-darwin.tar.gz"
      sha256 "c83f4d2a7e91abcbfc705e5c267aaf4e943570448a4958b3154e016c09840917"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.7/manby-x86_64-apple-darwin.tar.gz"
      sha256 "6bfec13baa1513784b5f80df0bbbba9dd6cabdd27e2b0fee868e59b24194e215"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.7/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42d51d771c48d386fffc09443205a41a97063f4a52e3483ef4dc472b97e19f62"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.7/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2211a71e529544a583cfc49d3867910e100fd01056b936fd9418aa76f60f2d38"
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
