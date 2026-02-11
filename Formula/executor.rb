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
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0daeaf43b957974eae473199fc66267ab579812dfba33fa4e3981203c45cd327"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "0daeaf43b957974eae473199fc66267ab579812dfba33fa4e3981203c45cd327"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "0daeaf43b957974eae473199fc66267ab579812dfba33fa4e3981203c45cd327"
    sha256 cellar: :any_skip_relocation, sonoma: "2c02c59135e6da59714ee09822b2e95510d455c9ef57e2dbc559e1614140394b"
    sha256 cellar: :any_skip_relocation, ventura: "2c02c59135e6da59714ee09822b2e95510d455c9ef57e2dbc559e1614140394b"  end
end
