VERSION = "1.0.12".freeze

class Executor < Formula
  desc "Execute commands in a fancy way"
  homepage "https://github.com/jorgefuertes/executor"
  url "https://github.com/jorgefuertes/executor.git", tag: "v#{VERSION}"
  license "GPL-3.0-or-later"
  head "https://github.com/jorgefuertes/executor.git", branch: "main"

  bottle do
    root_url "https://github.com/jorgefuertes/executor/releases/download/v"+VERSION
    sha256 cellar: :any_skip_relocation, arm64_ventura: "9914757eee5931e4e746ec2cc5eb8f8f590f0b397185a2d660a6f19f7447ae42"
    sha256 cellar: :any_skip_relocation, ventura:       "296ecd09950856082531a86949ac6c5d7c85ebe66b0c894d04e3ce486af12393"
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
