class Goimage < Formula
  desc "CLI for image generation via OpenAI, Google nano banana, or xAI Grok"
  homepage "https://github.com/schappim/goimage"
  url "https://github.com/schappim/goimage/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e19fe3e1fe3a87fcd13d28ad91fbc9e0ceedd2059d13a17bf5d9b8cc0b885d2e"
  license "MIT"
  head "https://github.com/schappim/goimage.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "goimage", shell_output("#{bin}/goimage --help")
    assert_match "google", shell_output("#{bin}/goimage --help")
    assert_match "grok", shell_output("#{bin}/goimage --help")
  end
end
