# Data handling

How the Gupshup MCP server handles data. Gupshup's [Privacy Policy](https://www.gupshup.ai/privacy-policy) and your Gupshup agreement govern everything here. If this page and those documents differ, those documents win.

## What the server receives

| Data | Why | How it's handled |
|---|---|---|
| **Tool calls** from your AI client (tool name and arguments) | To perform the action you asked for | Only tool calls reach the server. Your conversation with the AI does not. |
| **Channel credentials** (Enterprise account ID and password per channel) | To call Gupshup APIs on your behalf | Encrypted at rest and never returned to the AI client. |
| **OAuth tokens** | To keep you signed in | Access tokens are short-lived. Refresh tokens are stored hashed and rotated on every use. |
| **Audience files and segments** you upload or select | To build campaigns | Stored in your Gupshup account for the campaign. Previews shown to the AI are **masked**. |
| **Templates and campaign content** | To create, submit and send messages | Stored in your Gupshup account, as with the console or API. |
| **Operational metadata** (tool name, app, timing, success or error) | Reliability, abuse prevention and support | Used to run the service. It doesn't include message content. |

## What the AI client sees

Only the results of tools you call: for example aggregated analytics, template previews, masked audience samples and campaign status. Your AI provider (e.g. Anthropic, OpenAI) processes those results under **its** terms and your settings with that provider.

## Your controls

- **Choose apps and channels** at sign-in. Anything you don't grant is invisible to the AI.
- **Disconnect** the server in your client at any time to stop access.
- **Revoke credentials** by changing the channel password in Gupshup. Stored credentials stop working.
- **Data requests:** use the contact in the Gupshup Privacy Policy, or your account manager.

## Self-serve server

The self-serve server at `docs.gupshup.io/mcp` authenticates with your Gupshup API key, which your client sends with each request. Keep the key in an environment variable or your client's secret store.

---
*Maintainers: have legal review this page before any directory submission, and confirm retention periods to add.*
