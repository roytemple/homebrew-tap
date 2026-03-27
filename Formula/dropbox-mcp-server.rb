class DropboxMcpServer < Formula
  desc "MCP server for Dropbox integration (multi-instance support)"
  homepage "https://github.com/roytemple/dropbox-mcp-server"
  url "https://github.com/roytemple/dropbox-mcp-server/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "dfc9ee9b901fc5bd5db8f0d06f0778f0c9335f00a24c53997829ff152fadaec1"
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
