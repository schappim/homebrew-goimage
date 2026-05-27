class Goimage < Formula
  desc "CLI for image generation using OpenAI, Google nano banana, or xAI Grok - single Go binary"
  homepage "https://github.com/schappim/goimage"
  url "https://github.com/schappim/goimage/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "297f558871069361800e73649198e77f4b216afbd7206eec4edcc97780b86192"
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
