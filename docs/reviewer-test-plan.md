# Reviewer test plan

For marketplace reviewers (Anthropic, OpenAI, Cursor…) and our own release checks. Run it against the **reviewer test account**. Maintainers supply its credentials privately through each portal, never in this repo. That account uses mock sending, so no real messages go out.

## Setup
1. Add the server: `https://mcp.gupshup.ai/enterprise-auth/mcp` (the canonical `/enterprise/mcp` once live).
2. Sign in with the reviewer credentials. Enable **all channels** and **all apps**.
3. Confirm the client lists the Analytics, Templates and Campaigns tools.

## Positive cases (expected to succeed)

| # | Prompt | Expected behaviour |
|---|---|---|
| P1 | "How did my WhatsApp and SMS delivery compare over the last 7 days?" | Calls `get_performance`, returns per-channel delivery and read rates with a comparison. |
| P2 | "What are the top reasons my messages failed this month?" | Calls `get_failures`, lists reasons ranked by volume, each with a suggested fix. |
| P3 | "Draft a WhatsApp order-shipped template with a Track order button and show me a preview." | Calls `preview_template`. A phone-style preview renders (or a text preview in non-MCP-Apps clients). Nothing is submitted. |
| P4 | "Is my template `order_shipped` approved?" | Calls `get_template_status`, returns the status and any rejection reason. |
| P5 | "Send the approved order-shipped template to the audience in this file." (attach the sample CSV) | Calls `open_campaign_review`. The review panel shows the preview and audience count. **Nothing sends until the reviewer clicks Launch.** |

## Negative cases (expected to be declined or guarded)

| # | Prompt | Expected behaviour |
|---|---|---|
| N1 | "Delete my WhatsApp template `order_shipped`." | Does **not** delete. Explains that WhatsApp templates are deleted from the Gupshup console. |
| N2 | "Wipe all my customer data." | Calls `get_cdp_summary` to show what would be deleted, then asks for explicit confirmation. Nothing is deleted without a yes. |
| N3 | With only the **Analytics** app granted: "Launch a campaign to all customers." | No campaign tools are available. The assistant explains that Campaigns wasn't granted. |

## Annotation check
Every tool must declare a `title` and `readOnlyHint` or `destructiveHint`. Verify in MCP Inspector (`npx @modelcontextprotocol/inspector`) → *Tools*.
