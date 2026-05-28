class Goimage < Formula
  desc "CLI for image generation via OpenAI, Google nano banana, or xAI Grok"
  homepage "https://github.com/schappim/goimage"
  url "https://github.com/schappim/goimage/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5d371c7bdbef8958b034e9fa8ac255b1ec150dc3866af9548df1c89270049942"
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
    assert_match "--stream", shell_output("#{bin}/goimage --help")
  end
end
