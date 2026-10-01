# Troubleshooting

## Connecting

| Symptom | Likely cause | Fix |
|---|---|---|
| Client says the server needs authentication, or shows **401** | You haven't signed in yet, or the token expired and couldn't refresh | Start sign-in from the client: Claude Code `/mcp` → *Authenticate*; Claude *Connect*; VS Code *Start* in `mcp.json`. |
| Sign-in page won't accept the password | Channel credentials are per channel | Use the Enterprise account ID and password **for that channel** (WhatsApp, SMS and RCS each have their own). |
| Stuck on the one-time code | 2FA code expired | Request a new code. Codes are short-lived. |
| "Client registration failed" or "dynamic client registration not supported" | Your client needs DCR, or an older client is using the old SSE transport | Update the client. The server speaks **Streamable HTTP** with DCR. For stdio-only clients, use the `mcp-remote` bridge ([guide](clients/other.md)). |
| Browser never opens during sign-in | Headless or remote session | Copy the sign-in URL the client prints into a browser on the same machine, or use the client's manual auth flow. |
| Worked yesterday, fails today with an auth error | Refresh token revoked (e.g. reused, or channel password changed) | Disconnect and reconnect the server. |

## Tools

| Symptom | Likely cause | Fix |
|---|---|---|
| Only some tools appear (e.g. no campaign tools) | That app wasn't granted during sign-in | Disconnect, reconnect, and tick the app (Analytics, Templates, Campaigns). |
| No tools for a channel's data | Channel credentials weren't added | Reconnect and add that channel. `get_account_health` shows which channels are connected. |
| Review panel doesn't render; a text summary appears instead | Your client doesn't support MCP Apps (`ui://` panels) yet | Nothing is lost: follow the text prompts to confirm. Use a client with MCP Apps support for the visual panel. |
| Agent says it can't delete a WhatsApp/RCS template | Upstream limitation | Delete WhatsApp and RCS templates in the Gupshup console. SMS (DLT) templates can be deleted via MCP. |
| Template rejected | Meta or operator review | Ask *"Why was my template X rejected and how do I fix it?"* (`/fix-rejected-template`). |
| Today's campaign numbers look low | Stats settle at T+1 | Check again tomorrow. `get_campaigns` flags provisional data. |
| Spend shows no currency amounts | Upstream billing data has no prices for your account | Volume by billing bucket is still accurate. Ask your account manager for invoices. |
| Model is slow or runs out of context | Many tools loaded | Grant only the apps you need. Templates is the largest (see *Context cost* in the [README](../README.md#apps)). |

## Still stuck?

[Open an issue](https://github.com/GupshupSuperAgent/mcp/issues/new/choose) with:
- your client and version
- which step failed
- the error text

**Never include passwords, tokens or customer phone numbers.** For account-specific problems, contact your Gupshup account manager.
