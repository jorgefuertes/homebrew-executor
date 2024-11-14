VERSION = "1.0.10".freeze

class Executor < Formula
  desc "Execute commands in a fancy way"
  homepage "https://github.com/jorgefuertes/executor"
  url "https://github.com/jorgefuertes/executor.git", tag: "v#{VERSION}"
  license "GPL-3.0-or-later"
  head "https://github.com/jorgefuertes/executor.git", branch: "main"

  bottle do
    root_url "https://github.com/jorgefuertes/executor/releases/download/v"+VERSION
    sha256 cellar: :any_skip_relocation, arm64_ventura: "804ec36d4a8de52b1ac16c98d1ab4de8f797e179ad52fbd2da6c10bac07ba622"
    sha256 cellar: :any_skip_relocation, ventura:       "19e31550d3f246630de17b4b532f3c8c1054424b3fd4ef7eccc2f29f6f191115"
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
