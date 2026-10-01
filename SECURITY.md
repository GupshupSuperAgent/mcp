# Security policy

## Reporting a vulnerability

**Please don't report security issues in public GitHub issues.**

Use GitHub's private reporting instead: **[Report a vulnerability](https://github.com/GupshupSuperAgent/mcp/security/advisories/new)** (Security tab → *Report a vulnerability*). Include:

- what's affected: the hosted server `mcp.gupshup.ai`, the OAuth flow, or something in this repository
- steps to reproduce, and the impact you expect
- any proof-of-concept, **with no real customer data or credentials**

We'll acknowledge your report, keep you updated while we investigate, and credit you in the advisory if you'd like.

## Scope

- **In scope:**
  - The hosted Gupshup MCP server and its OAuth endpoints
  - The manifests and examples in this repo
- **Out of scope:**
  - Social engineering and denial of service
  - Findings in third-party MCP clients (report those to the vendor)
  - Anything needing access to an account you don't own

Please test only against accounts you own, and never send messages to people who didn't consent.

For how the service is secured, see [docs/security.md](docs/security.md) and [Gupshup enterprise security](https://www.gupshup.ai/enterprise-security).
