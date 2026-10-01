# Marketplace listing copy

Approved text to paste into every directory and marketplace form, so all listings say the same thing. Character limits noted where portals enforce them.

## Names

| Field | Text |
|---|---|
| Display name | **Gupshup** |
| Long name | Gupshup MCP Server |
| Short name, ≤30 chars (ChatGPT) | `Gupshup` |
| URL slug (Claude; permanent) | `gupshup` |
| Publisher | Gupshup |

## Taglines

- **≤30 chars (ChatGPT short description):** `WhatsApp, SMS & RCS for agents` (30)
- **≤100 chars (MCP Registry `description`):** Gupshup messaging for AI agents: analytics, templates and campaigns across WhatsApp, SMS and RCS.
- **≤200 chars (Claude one-liner):** Run WhatsApp, SMS and RCS from your AI agent: analyze delivery, draft and approve templates, and launch A/B and multilingual campaigns with a human-approved review step.

## Description (≤2000 chars, Claude, Cursor, Smithery, Glama)

Gupshup is a conversational messaging platform used by enterprises worldwide. The Gupshup MCP server connects your AI assistant to your Gupshup account, so you can run WhatsApp, SMS and RCS messaging in plain language.

**Analytics:** compare delivery, read and click rates across channels, find out why messages failed (with a suggested fix for each reason), and dig into template, campaign and spend performance.

**Templates:** draft WhatsApp, RCS and SMS templates from a description, preview them exactly as they appear on the phone, translate them into 10 Indian languages at once, submit them for approval and fix rejections.

**Campaigns:** build audiences from files, CRM or customer-data segments; review every campaign in an interactive panel before you click Launch; run A/B tests with automatic winner roll-out; send multilingual campaigns; schedule, pause and optimize live campaigns; and fall back from WhatsApp to SMS automatically.

**Built for enterprises:**
- OAuth 2.1 sign-in with per-channel credentials and 2FA
- One scope per app for least privilege
- Human confirmation before anything is sent or deleted
- Masked customer data

**Requires** a Gupshup Enterprise account. Developers on the Gupshup messaging API can connect the self-serve server with an API key.

## Long description (≤4000 chars, ChatGPT)

Use the description above, then add the "Features" list from the [README](../README.md#features).

## Cursor Marketplace

| Field | Value |
|---|---|
| Plugin name (id) | `gupshup` |
| Display name | Gupshup |
| Repository | https://github.com/GupshupSuperAgent/mcp (plugin folder `plugins/gupshup-mcp`) |
| Category | Communication |
| Logo | `plugins/gupshup-mcp/assets/logo.svg` (square SVG) |
| License | MIT |

**Short description** (the `description` in `plugin.json`):
> Run WhatsApp, SMS and RCS from Cursor: Gupshup analytics, template drafting and approval, and A/B, multilingual and scheduled campaigns, with a human review step before anything is sent.

**Long description / "What's included"** (for the submission form or listing body):

> **Gupshup** brings your WhatsApp, SMS and RCS messaging into Cursor.
>
> **Includes**
> - **Gupshup MCP server.** Hosted, so nothing runs locally. OAuth sign-in, 31 tools, 38 prompts:
>   - **Analytics:** delivery, read and click rates by channel; failure reasons with fixes; template and campaign performance; spend and account health.
>   - **Templates:** draft and preview WhatsApp, RCS and SMS templates as they appear on the phone, localize into 10 Indian languages, submit for approval and fix rejections.
>   - **Campaigns:** build audiences from files, CRM or customer-data segments; launch through an interactive review panel; A/B tests with automatic winner roll-out; multilingual sends; scheduling, live optimization and WhatsApp-to-SMS fallback.
> - **Gupshup messaging skill.** Teaches the agent to preview before saving, use the review panel before any send, and ask before anything destructive.
>
> **Requires** a Gupshup Enterprise account. On first use you sign in through your browser with your Enterprise credentials per channel and choose which apps the agent may use. No API keys are stored in config. Every send needs your click on **Launch**.

**Keywords:** gupshup, whatsapp, whatsapp-business-api, sms, rcs, messaging, cpaas, campaigns, templates, marketing, analytics, mcp

**Example prompts:** see [Example prompts](#example-prompts-up-to-3-are-shown-in-most-directories).

## Categories & keywords

- **Claude categories (1–5):** Communication · Marketing · Customer support · Analytics
- **ChatGPT / general categories:** Business · Productivity · Marketing
- **Keywords / tags:** gupshup, whatsapp, whatsapp business api, sms, rcs, messaging, cpaas, conversational messaging, marketing automation, campaigns, templates, a/b testing, mcp, model context protocol, customer engagement, omnichannel

## Example prompts (up to 3 are shown in most directories)

1. Compare WhatsApp and SMS delivery this month vs last month, and tell me the top 3 reasons messages failed.
2. Draft a festive offer WhatsApp template in English and Hindi with a Shop now button, show previews, then submit it for approval.
3. A/B test two messages on 10% of my at-risk customers, then send the winner to everyone else.

## Links

| Field | URL |
|---|---|
| Website | https://mcp.gupshup.ai |
| Documentation | https://github.com/GupshupSuperAgent/mcp |
| Privacy policy | https://www.gupshup.ai/privacy-policy |
| Data handling (MCP) | https://github.com/GupshupSuperAgent/mcp/blob/main/docs/privacy.md |
| Terms | https://www.gupshup.ai/terms-and-conditions |
| Security | https://www.gupshup.ai/enterprise-security |
| Support | https://github.com/GupshupSuperAgent/mcp/issues · sales@gupshup.ai |

## Assets

| Asset | File |
|---|---|
| Square icon (512×512 PNG) | [`assets/icon-512.png`](../assets/icon-512.png) |
| Logo (SVG, light backgrounds) | [`assets/gupshup-logo.svg`](../assets/gupshup-logo.svg) |
| Social / Open Graph image (1280×640) | [`assets/social-preview.png`](../assets/social-preview.png) |
| Screenshots | Capture from a reviewer account: the template preview, the campaign review panel, and an analytics answer. |
