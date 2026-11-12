class Manby < Formula
  desc "Builds vector tilesets like tippecanoe, several times faster"
  homepage "https://birkskyum.github.io/manby/"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.6/manby-aarch64-apple-darwin.tar.gz"
      sha256 "e6ba1205b0eec502a67cac00ce5a8859692faf51ddd339de349d875b50b907b6"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.6/manby-x86_64-apple-darwin.tar.gz"
      sha256 "186536b5c122c1f40e6e2375b79918b05ff7fa2c52ea03e3c25759a71d4975c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.6/manby-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3710ecf147bcc517ef1c1d0b35795e20335f1b747f31a4844403d27a42c554e4"
    end
    on_intel do
      url "https://github.com/birkskyum/manby/releases/download/v0.2.6/manby-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2963ec2614b5046f5dd58089b22515cf15daf56b985d7b922600dd7e1cc1db14"
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
