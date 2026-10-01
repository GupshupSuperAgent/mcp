# Security

Gupshup MCP gives an AI agent real power over your messaging, so it's designed to keep a human in control and to limit what any single connection can do.

## Design

| Control | How |
|---|---|
| **No shared secrets in configs** | OAuth 2.1 + PKCE. Client configs contain only the public server URL. |
| **Least privilege** | One scope per app. The agent is only shown tools for the apps you granted ([details](auth-and-scopes.md)). |
| **Per-channel credentials** | WhatsApp, SMS and RCS credentials are entered and stored separately, and encrypted at rest. |
| **Human in the loop** | New campaigns, A/B tests and multilingual sends open a **review panel**, and nothing sends until you click **Launch**. Destructive tools (`delete_template`, `clear_cdp_data`) only proceed after an explicit confirmation. |
| **Data minimization** | Audience previews return masked samples. The server receives only the tool calls your agent makes, never the rest of your conversation. |
| **Isolated backends** | Only the OAuth gateway is internet-facing. The apps run on a private network and trust only the gateway. |
| **Hardened runtime** | Distroless, non-root, read-only containers. |

Your MCP client's own tool-approval settings apply on top of these. For production accounts, we recommend keeping approval prompts on for tools marked **Sends messages** or **Deletes data** in the [tool reference](../README.md#tools).

## Risks to be aware of

- **Prompt injection.** Text the agent reads can contain instructions: web pages, documents, files, even message content and template text. A malicious instruction could try to get the agent to send messages or change templates. Mitigations:
  - Keep sends behind the review panel and your client's approval prompts.
  - **Only enable MCP servers you trust in the same session as Gupshup.** A malicious server can instruct the agent to call Gupshup tools.
- **Over-broad grants.** If you only need reporting, grant **Analytics** only.
- **Shared machines.** Tokens live in your MCP client's storage. Sign out or disconnect on shared computers.

## Messaging compliance still applies

Messages sent through the MCP server follow the same rules as the console and API:
- WhatsApp template approval and the 24-hour customer-service window
- SMS DLT registration (India)
- Opt-in and consent requirements
- Your Gupshup agreement

The agent can't bypass them.

## Reporting a vulnerability

Please **don't open a public issue**. See [SECURITY.md](../SECURITY.md).
