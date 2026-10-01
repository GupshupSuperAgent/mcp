<p align="center">
  <img src="assets/gupshup-logo.svg" alt="Gupshup" width="220">
</p>

<h1 align="center">Gupshup MCP Server</h1>

<p align="center">
  Run WhatsApp, SMS and RCS messaging from any AI agent: analytics, templates and campaigns through one secure <a href="https://modelcontextprotocol.io">Model Context Protocol</a> endpoint.
</p>

<p align="center">
  <a href="https://mcp.gupshup.ai">Website</a> ·
  <a href="docs/clients/README.md">Connect a client</a> ·
  <a href="#tools">Tools</a> ·
  <a href="docs/security.md">Security</a> ·
  <a href="docs/troubleshooting.md">Troubleshooting</a>
</p>

<p align="center">
  <img alt="Status: beta" src="https://img.shields.io/badge/status-beta-5E34F1">
  <img alt="Transport: Streamable HTTP" src="https://img.shields.io/badge/transport-streamable_HTTP-5E34F1">
  <img alt="Auth: OAuth 2.1" src="https://img.shields.io/badge/auth-OAuth_2.1-5E34F1">
  <img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-lightgrey">
</p>

---

Gupshup MCP lets Claude, ChatGPT, Cursor, VS Code and any MCP-compatible agent work with your Gupshup account. Ask in plain language to check delivery and failures, draft and localize templates and submit them for approval, build audiences, run A/B tests, and launch or optimize campaigns. Anything that sends messages or deletes data waits for your confirmation.

This repository is the public home for the **hosted** Gupshup MCP server: setup guides, the tool reference, marketplace manifests and examples. There's nothing to install or run; you connect to Gupshup's endpoint.

## Features

**📊 Analytics & reporting**
- Delivery, read and click rates across WhatsApp, SMS and RCS, compared with the previous period
- Failure analysis: reasons ranked by lost volume, each with a plain-English cause and fix
- Per-template deep dives (daily trend, button clicks, errors) and template leaderboards
- Campaign results, spend by billing bucket, account and channel health, raw report export

**📝 Template management**
- Draft WhatsApp, RCS and SMS templates from a description and preview them as they look on the phone (including 2–6 A/B copy options)
- Multilingual templates: one family in English plus 10 Indian languages, previewed side by side and submitted together
- Submit for approval, track status and rejection reasons, and fix rejected templates
- Register DLT-approved SMS templates. Visual template gallery and multi-step flow timelines.

**🚀 Campaigns**
- Build audiences from CSV/XLSX uploads, CRM pulls or customer-data segments (masked previews)
- Interactive **review panel** before every launch: per-template audiences, scheduling, one-click **Launch**
- **A/B tests** on a sample with automatic winner roll-out (click or read rate)
- **Multilingual campaigns**: each recipient gets their language
- Scheduling, follow-up nudges, pause, live health checks and auto-pause or reschedule
- **Channel fallback**: retry WhatsApp failures on SMS per campaign, or account-wide Smart CPaaS failover

**🔐 Built for enterprises**
- OAuth 2.1 sign-in with per-channel credentials and 2FA; no API keys in config files
- Least privilege: one scope per app, so the agent only sees tools you granted
- Human-in-the-loop for every send and delete; masked customer data
- 38 ready-made prompts (slash commands) and interactive MCP App panels
- Works with Claude, ChatGPT, Cursor, VS Code, Codex, Windsurf and any MCP client

## Prerequisites

**Enterprise server** (`mcp.gupshup.ai`)
- A **Gupshup Enterprise account**, with the account ID and password for each channel you want to use (WhatsApp, SMS, RCS). No account? Email [sales@gupshup.ai](mailto:sales@gupshup.ai).
- An MCP client that supports **remote servers over Streamable HTTP with OAuth**. See [supported clients](#supported-clients).
- A browser on the same machine for the one-time sign-in.

**Self-serve server** (`docs.gupshup.io/mcp`)
- A Gupshup account with an **API key** for the [messaging API](https://docs.gupshup.io/reference/msg).
- An MCP client that lets you set request headers. See [docs/self-serve.md](docs/self-serve.md).

Nothing to install: both servers are hosted by Gupshup.

## Who it's for

| | Status | What you get |
|---|---|---|
| **Enterprise customers** | ✅ Available | Sign in with your existing Gupshup Enterprise credentials. Analytics, templates and campaigns across WhatsApp, SMS and RCS. |
| **Self-serve** (Gupshup messaging API) | ✅ Available | Connect the Gupshup API MCP at `https://docs.gupshup.io/mcp` with your API key. See [Self-serve](#self-serve). |
| **CX platform** (journeys, AI agents, handoff, agent assist) | 🔜 Coming soon | Build journeys, configure AI agents, manage human handoff and agent assist. |

No Gupshup account yet, or want early access to the CX server? Email **[sales@gupshup.ai](mailto:sales@gupshup.ai)**. See the [roadmap](docs/roadmap.md).

## Quick start (Enterprise)

**1. Server URL**

<!-- BEGIN:endpoint -->
```
https://mcp.gupshup.ai/enterprise-auth/mcp
```
<!-- END:endpoint -->

**2. One-click install.** If the app is on your computer, the button opens it with Gupshup pre-filled:

<!-- BEGIN:badges -->
[![Add to Claude](https://img.shields.io/badge/Claude-Add_Gupshup-D97757?style=for-the-badge&logo=claude&logoColor=white)](https://claude.ai/customize/connectors?modal=add-custom-connector&connectorName=Gupshup&connectorUrl=https%3A%2F%2Fmcp.gupshup.ai%2Fenterprise-auth%2Fmcp) [![Add to Cursor](https://cursor.com/deeplink/mcp-install-dark.svg)](https://cursor.com/install-mcp?name=gupshup&config=eyJ1cmwiOiJodHRwczovL21jcC5ndXBzaHVwLmFpL2VudGVycHJpc2UtYXV0aC9tY3AifQ%3D%3D) [![Install in VS Code](https://img.shields.io/badge/VS_Code-Install_Gupshup-0098FF?style=for-the-badge)](https://vscode.dev/redirect/mcp/install?name=gupshup&config=%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fmcp.gupshup.ai%2Fenterprise-auth%2Fmcp%22%7D) [![Install in VS Code Insiders](https://img.shields.io/badge/VS_Code_Insiders-Install_Gupshup-24bfa5?style=for-the-badge)](https://insiders.vscode.dev/redirect/mcp/install?name=gupshup&config=%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fmcp.gupshup.ai%2Fenterprise-auth%2Fmcp%22%7D&quality=insiders)
<!-- END:badges -->

Claude Code (or [share a `.mcp.json`](docs/clients/claude-code.md) with your team):

<!-- BEGIN:claude-code -->
```bash
claude mcp add --transport http --scope user gupshup https://mcp.gupshup.ai/enterprise-auth/mcp
```
<!-- END:claude-code -->

Most other clients (`mcp.json`):

<!-- BEGIN:json -->
```json
{
  "mcpServers": {
    "gupshup": {
      "type": "http",
      "url": "https://mcp.gupshup.ai/enterprise-auth/mcp"
    }
  }
}
```
<!-- END:json -->

Step-by-step guides: [Claude](docs/clients/claude.md) · [Claude Code](docs/clients/claude-code.md) · [Cursor](docs/clients/cursor.md) · [VS Code](docs/clients/vscode.md) · [ChatGPT](docs/clients/chatgpt.md) · [Codex](docs/clients/codex.md) · [Windsurf / Devin](docs/clients/windsurf.md) · [Other](docs/clients/other.md)

**3. Sign in.** Your client opens a Gupshup login page. Enter your **Enterprise account ID and password for each channel** you want (WhatsApp, SMS, RCS; 2FA if enabled) and pick the apps the agent may use. There are no API keys to copy into config files.

**4. Ask.** For example:

> *"Compare WhatsApp and SMS delivery this month vs last, and tell me the top 3 failure reasons."*
> *"Draft a festive offer template in English and Hindi with a Shop now button, show previews, then submit it."*
> *"A/B test two messages on 10% of my at-risk customers, then send the winner to everyone else."*

More in [examples/prompts.md](examples/prompts.md) and the [prompt catalog](docs/prompts.md).

## Self-serve

On the [Gupshup messaging API](https://docs.gupshup.io/reference/msg)? Use the **Gupshup API MCP**, hosted on the docs portal and authenticated with your Gupshup API key:

<!-- BEGIN:self-serve -->
```bash
claude mcp add --transport http --scope user gupshup-api https://docs.gupshup.io/mcp --header "apikey: $GUPSHUP_API_KEY"
```
<!-- END:self-serve -->

Guides for Cursor, VS Code, Codex, Windsurf and Claude Desktop: **[docs/self-serve.md](docs/self-serve.md)**.

## Supported clients

| Client | Enterprise (OAuth) | Self-serve (API key) | Guide |
|---|---|---|---|
| Claude (web & desktop) | ✅ Custom connector | ⚠️ Desktop via `mcp-remote` | [claude.md](docs/clients/claude.md) |
| Claude Code | ✅ | ✅ | [claude-code.md](docs/clients/claude-code.md) |
| ChatGPT | ✅ Developer mode | ❌ No custom headers | [chatgpt.md](docs/clients/chatgpt.md) |
| Cursor | ✅ | ✅ | [cursor.md](docs/clients/cursor.md) |
| VS Code (GitHub Copilot) | ✅ | ✅ | [vscode.md](docs/clients/vscode.md) |
| OpenAI Codex CLI | ✅ | ✅ | [codex.md](docs/clients/codex.md) |
| Windsurf / Devin Desktop | ✅ | ✅ | [windsurf.md](docs/clients/windsurf.md) |
| Any Streamable HTTP MCP client / SDK | ✅ | ✅ | [other.md](docs/clients/other.md) |

Interactive review panels need a client with MCP Apps support. Other clients get the same review as text.

## Use cases

- **Marketing teams:** go from idea to approved, localized WhatsApp template to A/B-tested campaign in one conversation.
- **CRM & lifecycle:** win-back and nudge sequences, CDP segment targeting, cross-channel fallback.
- **Operations & NOC:** monitor live campaigns, diagnose delivery drops, pause or reschedule on breach.
- **Analysts & leadership:** channel comparisons, failure root causes, spend breakdowns, without writing SQL.
- **Developers:** build and debug integrations with the Gupshup messaging API from your IDE.

## How it works

```
Your AI client ──OAuth 2.1──▶ Gupshup MCP gateway ──▶ Analytics   (analytics:read)
 (Claude, ChatGPT,            sign-in per channel      Templates   (templates:manage)
  Cursor, VS Code…)           scope-checked routing    Campaigns   (campaigns:send, campaigns:read)
                                                            │
                                                  WhatsApp · SMS · RCS
```

A single remote endpoint (Streamable HTTP). The gateway only offers the agent tools for the apps you granted, and every call runs as your own Gupshup account. Details: [Authentication & scopes](docs/auth-and-scopes.md).

## Apps

<!-- BEGIN:apps -->
| App | What your agent can do | OAuth scope | Tools | Context cost |
|---|---|---|---|---|
| [Analytics](docs/reference/analytics.md) | Delivery, engagement, failures, spend and account health across WhatsApp, SMS and RCS. | `analytics:read` | 7 | ~1.6k tokens |
| [Templates](docs/reference/templates.md) | Draft, preview, localize, submit and track WhatsApp, RCS and SMS (DLT) templates. | `templates:manage` | 10 | ~18.0k tokens |
| [Campaigns](docs/reference/campaigns.md) | Build audiences, review and launch campaigns (A/B, multilingual, scheduled), and optimize them live. | `campaigns:send` `campaigns:read` | 14 | ~10.3k tokens |
<!-- END:apps -->

*Context cost* is roughly how many tokens the app's tool definitions take in the model's context. Grant only the apps you need to keep it lean.

## Tools

<!-- BEGIN:totals -->
**31 tools** your agent can call, **38 prompts** and **4 interactive review panels**, generated from the server code (catalog `be3a7e5`, 2026-09-30).
<!-- END:totals -->

<!-- BEGIN:tools -->
<details><summary><b>Analytics</b></summary>

| Tool | What it does | Action |
|---|---|---|
| [`get_performance`](docs/reference/analytics.md#get_performance) | Delivery and engagement KPIs across WhatsApp, SMS and RCS, optionally by template and compared with the previous period. | Read-only |
| [`get_failures`](docs/reference/analytics.md#get_failures) | Why messages failed, ranked by lost volume, with a plain-English cause and suggested fix for each. | Read-only |
| [`get_template_detail`](docs/reference/analytics.md#get_template_detail) | Deep dive into one template: daily trend, button clicks and errors. | Read-only |
| [`get_campaigns`](docs/reference/analytics.md#get_campaigns) | WhatsApp campaign results ranked by impact, or one campaign's day-by-day detail. | Read-only |
| [`get_spend`](docs/reference/analytics.md#get_spend) | Where your messaging volume goes, by billing bucket and channel. | Read-only |
| [`get_account_health`](docs/reference/analytics.md#get_account_health) | Per-channel account status: connection, identity, billing type and active senders. | Read-only |
| [`get_report`](docs/reference/analytics.md#get_report) | Raw rows from a named report, paginated, for when you need the exact underlying data. | Read-only |

</details>

<details><summary><b>Templates</b></summary>

| Tool | What it does | Action |
|---|---|---|
| [`open_template_gallery`](docs/reference/templates.md#open_template_gallery) | Browse your templates in a visual gallery, filterable by channel, status, language and type. | Read-only |
| [`preview_template`](docs/reference/templates.md#preview_template) | Draft new template copy (including 2-6 A/B options) or preview an existing template, rendered as it appears on the phone. | Read-only |
| [`preview_flow`](docs/reference/templates.md#preview_flow) | Preview a timed multi-step message sequence on a visual timeline. | Read-only |
| [`save_template`](docs/reference/templates.md#save_template) | Create or update a WhatsApp or RCS template and submit it for approval, after you confirm the preview. | Writes |
| [`preview_multilingual_templates`](docs/reference/templates.md#preview_multilingual_templates) | Preview one WhatsApp template in several languages side by side (11 Indian languages plus English). | Read-only |
| [`create_multilingual_templates`](docs/reference/templates.md#create_multilingual_templates) | Submit the exact multilingual family you previewed for Meta approval, after your explicit yes. | Writes |
| [`save_sms_dlt_template`](docs/reference/templates.md#save_sms_dlt_template) | Register an already DLT-approved SMS template with Gupshup (asks for confirmation first). | Writes |
| [`get_template`](docs/reference/templates.md#get_template) | The full structure of one template as data: body, variables, header, footer and buttons. | Read-only |
| [`get_template_status`](docs/reference/templates.md#get_template_status) | Approval status of a WhatsApp or RCS template, with the rejection reason if rejected. | Read-only |
| [`delete_template`](docs/reference/templates.md#delete_template) | Delete an SMS template (asks for confirmation first). WhatsApp and RCS templates are deleted from the Gupshup console. | **Deletes data** |

</details>

<details><summary><b>Campaigns</b></summary>

| Tool | What it does | Action |
|---|---|---|
| [`preview_audience`](docs/reference/campaigns.md#preview_audience) | Quick look at an audience: count, columns and a masked sample. Nothing is saved. | Read-only |
| [`get_cdp_summary`](docs/reference/campaigns.md#get_cdp_summary) | Size of your customer data and the fields you can segment on, with value counts. | Read-only |
| [`clear_cdp_data`](docs/reference/campaigns.md#clear_cdp_data) | Permanently delete all customer-data profiles for the account. Irreversible; requires explicit confirmation. | **Deletes data** |
| [`resolve_audience`](docs/reference/campaigns.md#resolve_audience) | Save an audience server-side and get a handle for advanced sends and re-sends. | Writes |
| [`launch_campaign`](docs/reference/campaigns.md#launch_campaign) | Send or schedule a campaign on WhatsApp, RCS or SMS, for clones, re-sends and advanced flows. New campaigns go through the review panel. | **Sends messages** |
| [`pause_campaign`](docs/reference/campaigns.md#pause_campaign) | Pause a running campaign so queued messages stop. Already-submitted messages cannot be recalled. | Writes |
| [`get_campaign_status`](docs/reference/campaigns.md#get_campaign_status) | Where a campaign is: scheduled, queued, submitted, failed (with reason), cancelled or completed. | Read-only |
| [`optimize_running_campaign`](docs/reference/campaigns.md#optimize_running_campaign) | Health-check a live campaign and pause or reschedule it when delivery or failure thresholds are breached. Dry run first. | Writes |
| [`auto_fallback_channel`](docs/reference/campaigns.md#auto_fallback_channel) | Retry failed messages on the next channel in the campaign's policy (e.g. WhatsApp to SMS), respecting consent. | Writes |
| [`register_channel_fallback`](docs/reference/campaigns.md#register_channel_fallback) | Set up account-wide channel failover for a template (Smart CPaaS), covering API traffic too. | Writes |
| [`get_channel_fallback`](docs/reference/campaigns.md#get_channel_fallback) | Check whether channel failover is registered for a template. | Read-only |
| [`open_campaign_review`](docs/reference/campaigns.md#open_campaign_review) | Open the campaign review panel: preview each template, attach audiences, schedule, and launch after your confirmation. | Read-only |
| [`open_ab_test_review`](docs/reference/campaigns.md#open_ab_test_review) | Open the A/B test review panel: variants side by side, test on a sample, then send the winner to everyone else automatically. | Read-only |
| [`open_language_review`](docs/reference/campaigns.md#open_language_review) | Open the multilingual campaign panel: one card per language, and each recipient gets their language. | Read-only |

</details>

<!-- END:tools -->

Full parameters: [Analytics](docs/reference/analytics.md) · [Templates](docs/reference/templates.md) · [Campaigns](docs/reference/campaigns.md) · [Prompts & panels](docs/prompts.md) · [catalog.json](catalog/catalog.json) (machine-readable)

### Interactive review panels

Campaign launches, A/B tests and multilingual sends open an **interactive review panel** (an [MCP App](https://modelcontextprotocol.io/)). There you preview each message, attach audiences, schedule, and click **Launch** yourself. Clients that don't render MCP Apps show the same review as text, and still require your confirmation.

## Security

- **OAuth 2.1 + PKCE**, short-lived tokens, rotating refresh tokens. No secrets in client config.
- **Least privilege:** a scope per app, credentials per channel. The agent never sees tools you didn't grant.
- **Human in the loop:** sends go through the review panel; deletes need explicit confirmation.
- **Encrypted at rest:** channel credentials. Audience samples are masked.
- **Only pair with MCP servers you trust.** Another server in the same session could try to instruct your agent.

Read [docs/security.md](docs/security.md). To report a vulnerability, see [SECURITY.md](SECURITY.md).

## Marketplaces

| Where | How |
|---|---|
| Claude (web, desktop, mobile) | **Add to Claude** button above (prefilled custom connector); directory listing in progress |
| Claude Code plugin marketplace | `/plugin marketplace add GupshupSuperAgent/mcp` then `/plugin install gupshup-mcp@gupshup` |
| Official MCP Registry | [`server.json`](server.json) |
| Cursor Marketplace | Plugin `gupshup` in this repo ([manifest](plugins/gupshup-mcp/.cursor-plugin/plugin.json)), with listing submitted for review. Until it's approved, use the **Add to Cursor** button. |
| VS Code | One-click button above |
| ChatGPT, Smithery, Glama and Claude directories | See [docs/marketplace-submission.md](docs/marketplace-submission.md) · [listing copy](docs/listing-copy.md) · [data handling](docs/privacy.md) |

## FAQ

<details><summary><b>What is the Gupshup MCP server?</b></summary>

A hosted [Model Context Protocol](https://modelcontextprotocol.io) server. AI assistants such as Claude, ChatGPT, Cursor and VS Code Copilot use it to work with Gupshup's WhatsApp, SMS and RCS messaging: analytics, message templates and campaigns.
</details>

<details><summary><b>Do I need a Gupshup account?</b></summary>

Yes. The Enterprise server needs a Gupshup Enterprise account. The self-serve server needs a Gupshup API key. To get started, email [sales@gupshup.ai](mailto:sales@gupshup.ai).
</details>

<details><summary><b>Is it free?</b></summary>

Connecting is free. Messages you send are billed under your Gupshup plan, exactly as if sent from the console or API.
</details>

<details><summary><b>Can the AI send WhatsApp messages without my approval?</b></summary>

No. New campaigns, A/B tests and multilingual sends open a review panel and only go out when you click **Launch**. Deletes need an explicit confirmation.
</details>

<details><summary><b>Which WhatsApp, SMS and RCS features are supported?</b></summary>

- WhatsApp template creation, approval tracking and multilingual templates; campaigns with A/B tests and fallback
- SMS DLT templates and SMS campaigns
- RCS templates and campaigns
- Delivery, failure and spend analytics across all three

See the [tool reference](#tools).
</details>

<details><summary><b>Is there a local / npm / Docker version?</b></summary>

No. Gupshup MCP is a hosted remote server, so there's nothing to install. Clients that only support local servers can use the `mcp-remote` bridge ([guide](docs/clients/other.md)).
</details>

## Support

- **Something broken or unclear?** Open an [issue](https://github.com/GupshupSuperAgent/mcp/issues/new/choose). Don't include credentials or customer data.
- **Account, billing or access:** your Gupshup account manager, or [sales@gupshup.ai](mailto:sales@gupshup.ai).
- **Docs:** [docs.gupshup.io](https://docs.gupshup.io)

See [SUPPORT.md](SUPPORT.md) and [CONTRIBUTING.md](CONTRIBUTING.md).

## License

The contents of this repository (docs, manifests, examples) are [MIT licensed](LICENSE). Use of the hosted Gupshup MCP service is subject to your Gupshup agreement and the [Gupshup terms](https://www.gupshup.ai/terms-and-conditions).
