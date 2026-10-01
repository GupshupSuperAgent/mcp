# Authentication & scopes

Gupshup MCP uses **OAuth 2.1**, as specified by the Model Context Protocol. You never paste an API key or password into a config file. Your MCP client opens a Gupshup sign-in page in the browser, and the server issues the client a short-lived token.

## What happens when you connect

1. **Discovery.** Your client calls the server URL, gets `401 Unauthorized`, and reads the server's [protected-resource metadata](https://datatracker.ietf.org/doc/html/rfc9728). That tells it where Gupshup's authorization server is.
2. **Registration.** The client registers itself automatically ([dynamic client registration](https://datatracker.ietf.org/doc/html/rfc7591)).
3. **Sign in.** A Gupshup login page opens:
   - **Choose channels.** Enter your Gupshup **Enterprise account ID and password for each channel** you want the agent to use (WhatsApp, SMS, RCS). Each channel has its own credentials, so a WhatsApp-only account never needs SMS details. You can add channels later.
   - **2FA.** If your account has two-factor authentication, you'll be asked for the one-time code.
   - **Choose apps.** Pick which apps the agent may use. Each app is an OAuth scope (below).
4. **Token.** The client exchanges the authorization code (with PKCE) for an access token and a refresh token, then connects.

## Scopes

| App | Scope | Grants |
|---|---|---|
| Analytics | `analytics:read` | Read delivery, engagement, failure, spend and account-health data |
| Templates | `templates:manage` | Create, preview, submit, check and (SMS only) delete templates |
| Campaigns | `campaigns:send` | Build audiences and launch, pause and optimize campaigns |
| Campaigns | `campaigns:read` | Read campaign status and fallback configuration |

`gupshup:access` is a base scope that every connection receives.

**The gateway only lists the tools for apps you granted.** An analytics-only connection has no send or template tools at all, so the model can't call them even if asked. To change what's granted, disconnect and reconnect the server in your client, then pick different apps.

## Tokens

- **Access tokens are short-lived.** Clients refresh them automatically.
- **Refresh tokens rotate on every use.** If an old refresh token is ever reused, the whole token family is revoked.
- **Channel credentials are encrypted at rest.** They're used only to call Gupshup's APIs on your behalf.

## Revoking access

- **In your client:** disconnect or remove the Gupshup server. For example, Claude: *Customize → Connectors → Gupshup → Disconnect*; Claude Code: `/mcp` → *Clear authentication*.
- **Lost device or a suspected compromise:** change the affected Gupshup channel password. Stored credentials stop working immediately. Also contact your Gupshup account manager.

## Two server URLs

| URL | Status |
|---|---|
| `https://mcp.gupshup.ai/enterprise/mcp` | Canonical going forward |
| `https://mcp.gupshup.ai/enterprise-auth/mcp` | Original URL, **supported permanently** |

Both reach the same server, use the same sign-in, and expose the same tools. If you're already connected via `/enterprise-auth/mcp`, you don't need to change anything.

## For client developers

- **Transport:** Streamable HTTP. There's no stdio package; this is a hosted service.
- **Auth:** OAuth 2.1 authorization code with PKCE (S256). Discovery follows RFC 9728 and RFC 8414, dynamic registration follows RFC 7591, and resource indicators follow RFC 8707.
- **Token audience** is bound to the MCP resource URL you connected to.
