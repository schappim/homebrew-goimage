class Goimage < Formula
  desc "CLI for image generation via OpenAI, Google nano banana, or xAI Grok"
  homepage "https://github.com/schappim/goimage"
  url "https://github.com/schappim/goimage/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "ea84cbcc6d217dd645621a47a6baa10e343d7ea18beff06698a0b47b1e3ccaac"
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
    assert_match "--reference", shell_output("#{bin}/goimage --help")
    assert_match "gpt-image-2.5-sunburst", shell_output("#{bin}/goimage --help")
  end
end
