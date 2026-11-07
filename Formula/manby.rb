class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.5/manby-aarch64-apple-darwin.tar.gz"
      sha256 "cb2dcfc491153a6bdb3e7de619fc472a6173eb4062c951156ff2bf4c85c9d8bb"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.5/manby-x86_64-apple-darwin.tar.gz"
      sha256 "cab3c33302957eb8d53429bdde2bc0dcc2b5be682410394127dce4bed159d7a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.5/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3d672fc0ef70648e2affa0fdbdd93cf0833c3d1f1fef27fc1f3922b9a1cbf6e"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.1.5/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c080e717efaa130d57480be9c9ce61ffbc8b5f574acc156a959d1f513b06c0c1"
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
