class Goimage < Formula
  desc "CLI for image generation via OpenAI, Google nano banana, or xAI Grok"
  homepage "https://github.com/schappim/goimage"
  url "https://github.com/schappim/goimage/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c1a2707076703e9ef38fb5d760447b360d68dd510f9264d0f5522a37fda992fc"
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
