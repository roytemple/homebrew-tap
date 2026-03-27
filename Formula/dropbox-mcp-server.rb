class DropboxMcpServer < Formula
  desc "MCP server for Dropbox integration (multi-instance support)"
  homepage "https://github.com/roytemple/dropbox-mcp-server"
  url "https://github.com/roytemple/dropbox-mcp-server/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "4aaf3838a87f70f4780578937a17023032bf3dd375df76137e0262baf11fc0a7"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=#{tap.user}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match "dropbox-mcp-server version", shell_output("#{bin}/dropbox-mcp-server --version")
  end
end
