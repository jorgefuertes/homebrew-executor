VERSION = "1.0.15".freeze

class Executor < Formula
  desc "Execute commands in a fancy way"
  homepage "https://github.com/jorgefuertes/executor"
  url "https://github.com/jorgefuertes/executor.git", tag: "v#{VERSION}"
  license "GPL-3.0-or-later"
  head "https://github.com/jorgefuertes/executor.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/jorgefuertes/executor/releases/download/v"+VERSION
    sha256 cellar: :any_skip_relocation, arm64_ventura: "75c6a769339348d46873cc007239b1f6d031ba9bdcb63cb5a94ab0029da632dd"
    sha256 cellar: :any_skip_relocation, ventura:       "ce0db3cc637793609b9e5f81edaf738f482ec2fd6ea241f0be8bd9ef65c80664"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version='#{VERSION}'")
  end

  test do
    assert_match "> Hello: [1 sec] OK", shell_output("#{bin}/executor run --nc -d Hello -c 'sleep 1; echo Hello!'")
    assert_match "executor version v#{VERSION}", shell_output("#{bin}/executor --version")
  end
end
