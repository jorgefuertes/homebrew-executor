VERSION = "1.0.19".freeze

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
    sha256 cellar: :any_skip_relocation, arm64_ventura: "8f6345f7bfe500ac6b5fbaab8893a6e57aaae0e43dad11d034658fef799b06c3"
    sha256 cellar: :any_skip_relocation, ventura:       "8429cb31f7e9bd139bf0997972da476775708cad7feef1998a383efa9600a033"
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
