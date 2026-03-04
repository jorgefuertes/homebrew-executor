VERSION = "1.0.26".freeze

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
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d9d6d74e62d6d6371eaeaeee8a0b7d4aa7f66fb4ad79881dc9a19dd149d21478"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d9d6d74e62d6d6371eaeaeee8a0b7d4aa7f66fb4ad79881dc9a19dd149d21478"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "d9d6d74e62d6d6371eaeaeee8a0b7d4aa7f66fb4ad79881dc9a19dd149d21478"
    sha256 cellar: :any_skip_relocation, sonoma: "8b1b0e694711db87e8a4fa8a102164d0a9950d21ef6a2122089b366a166d1e95"
    sha256 cellar: :any_skip_relocation, ventura: "8b1b0e694711db87e8a4fa8a102164d0a9950d21ef6a2122089b366a166d1e95"  end
end
