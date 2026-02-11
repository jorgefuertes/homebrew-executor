VERSION = "1.0.25".freeze

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
    root_url "https://github.com/jorgefuertes/executor/releases/download/v#{VERSION}"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f2ef873126caa8cfc33c3ca0924419bededd7e99b8b0537919a8dbed9481fc31"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f2ef873126caa8cfc33c3ca0924419bededd7e99b8b0537919a8dbed9481fc31"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "f2ef873126caa8cfc33c3ca0924419bededd7e99b8b0537919a8dbed9481fc31"
    sha256 cellar: :any_skip_relocation, sonoma: "8d45c73060ad69748c8e9f819f2b20aa018a0f0723a78e3692d53bc8bd1e3cb9"
    sha256 cellar: :any_skip_relocation, ventura: "8d45c73060ad69748c8e9f819f2b20aa018a0f0723a78e3692d53bc8bd1e3cb9"  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version='#{VERSION}'")
  end

  test do
    assert_match "executor version", shell_output("#{bin}/executor --version")

    output = shell_output("#{bin}/executor run --nc --ni -d Test -c 'echo success' 2>&1")
    assert_match "Test:", output
    assert_match "OK", output
  end
end
