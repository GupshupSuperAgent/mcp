"""Call Gupshup MCP from your own backend via the Claude API's MCP connector.

Claude connects to the Gupshup MCP server directly; you pass an OAuth access
token for the Gupshup server. Obtain it with a standard OAuth 2.1 + PKCE flow
against the server (discovery starts at the server URL's 401 response), or
from an MCP client library that performs that flow. Never hard-code tokens.

    pip install anthropic
    export ANTHROPIC_API_KEY=...          # or `ant auth login`
    export GUPSHUP_MCP_TOKEN=...          # OAuth access token for the Gupshup MCP server
    python claude_api_mcp_connector.py
"""

import os

import anthropic

GUPSHUP_MCP_URL = os.environ.get("GUPSHUP_MCP_URL", "https://mcp.gupshup.ai/enterprise-auth/mcp")

client = anthropic.Anthropic()

response = client.beta.messages.create(
    model="claude-opus-5",
    max_tokens=16000,
    thinking={"type": "adaptive"},
    betas=["mcp-client-2025-11-20"],
    mcp_servers=[
        {
            "type": "url",
            "name": "gupshup",
            "url": GUPSHUP_MCP_URL,
            "authorization_token": os.environ["GUPSHUP_MCP_TOKEN"],
        }
    ],
    # Read-only example: expose only the analytics tools we need.
    tools=[
        {
            "type": "mcp_toolset",
            "mcp_server_name": "gupshup",
            "default_config": {"enabled": False},
            "configs": {
                "get_performance": {"enabled": True},
                "get_failures": {"enabled": True},
            },
        }
    ],
    messages=[
        {
            "role": "user",
            "content": "Compare WhatsApp delivery this week vs last week and list the top 3 failure reasons.",
        }
    ],
)

if response.stop_reason == "refusal":
    raise SystemExit("Request was declined.")

print("".join(block.text for block in response.content if block.type == "text"))
