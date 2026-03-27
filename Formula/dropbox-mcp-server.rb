class DropboxMcpServer < Formula
  desc "MCP server for Dropbox integration (multi-instance support)"
  homepage "https://github.com/roytemple/dropbox-mcp-server"
  url "https://github.com/roytemple/dropbox-mcp-server/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "709a2bbce9ab5d52d7ed2a0fdca7cfe8174d2aad20f9cbe645a3a99ea9d7c8c6"
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
