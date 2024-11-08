VERSION = "1.0.8".freeze

class Executor < Formula
  desc "Execute commands in a fancy way"
  homepage "https://github.com/jorgefuertes/executor"
  url "https://github.com/jorgefuertes/executor.git", tag: "v#{VERSION}"
  license "GPL-3.0-or-later"
  head "https://github.com/jorgefuertes/executor.git", branch: "main"

  bottle do
    root_url "https://github.com/jorgefuertes/executor/releases/download/v"+VERSION
    sha256 cellar: :any_skip_relocation, arm64_ventura: "f9afab9fb40dfcae4e5fcf8d2c96d093eae4939ca25d4f4588ecf41ba4c146c0"
    sha256 cellar: :any_skip_relocation, ventura:       "6c8aa2c68d1916204be0a6290f1e6a6d7b249a4ff10f6b5e8bd32a0d78e374b2"
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
