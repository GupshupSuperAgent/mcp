# Gupshup plugin

Connects your AI agent (Cursor, Claude Code) to **Gupshup**, the conversational messaging platform for WhatsApp, SMS and RCS.

**Includes**
- **MCP server** `gupshup`: the hosted Gupshup Enterprise MCP server (Streamable HTTP + OAuth 2.1). It gives you 31 tools across Analytics, Templates and Campaigns, 38 prompts, and interactive review panels.
- **Skill** `gupshup-messaging`: guidance so the agent uses the tools safely. For example, it previews before saving and uses the review panel before any send.

**Requires** a Gupshup Enterprise account (credentials per channel). No account? Email sales@gupshup.ai.

**After installing**, the first Gupshup tool call opens your browser. Sign in with your Enterprise account ID and password for each channel you want, and choose which apps (Analytics, Templates, Campaigns) the agent may use. No API keys are stored in config.

**Try asking:**
- "Compare WhatsApp and SMS delivery this month vs last and give me the top 3 failure reasons."
- "Draft a festive offer template in English and Hindi with a Shop now button and preview it."
- "A/B test two messages on 10% of my at-risk customers, then send the winner to everyone else."

Full docs, tool reference and security: https://github.com/GupshupSuperAgent/mcp
