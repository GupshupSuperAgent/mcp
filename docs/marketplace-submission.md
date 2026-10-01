# Marketplace & directory submission (maintainers)

How to list Gupshup MCP in each marketplace. All URLs and names come from [`mcp.config.json`](../mcp.config.json). After changing it, run `python3 scripts/render_docs.py` and every manifest is regenerated.

> **Before submitting anywhere, clear these blockers** (tracked in the private server repo):
> 1. **Canonical URL live.** `https://mcp.gupshup.ai/enterprise/mcp` is served, then `use_legacy_as_primary` is set to `false` and the docs re-rendered. Until then, submit the legacy URL, which works today.
> 2. **Open dynamic client registration** on the production gateway (rate-limited, with a redirect-URI allowlist). Claude, ChatGPT, Cursor and VS Code all register themselves.
> 3. **Tool annotations.** Every model-callable tool needs a `title` plus `readOnlyHint` or `destructiveHint` (the Claude directory requires this). Today 4 of 31 have them.
> 4. **A reviewer test account.** A Gupshup Enterprise account with realistic data on WhatsApp, SMS and RCS, whose sends are safe to fire (mock or sandbox).
> 5. **A GitHub owner.** An owner of the `GupshupSuperAgent` GitHub account runs the registry login, and `glama.json` lists real maintainer usernames.

## 0. GitHub repository (SEO & discovery)
Run once after the repo is public. You need admin access.
```bash
gh repo edit GupshupSuperAgent/mcp \
  --description "Official Gupshup MCP server: WhatsApp, SMS & RCS analytics, templates and campaigns for Claude, ChatGPT, Cursor and VS Code." \
  --homepage "https://mcp.gupshup.ai" \
  --add-topic mcp --add-topic mcp-server --add-topic model-context-protocol --add-topic whatsapp \
  --add-topic whatsapp-business-api --add-topic sms --add-topic rcs --add-topic cpaas --add-topic messaging \
  --add-topic gupshup --add-topic claude --add-topic chatgpt --add-topic cursor --add-topic ai-agents \
  --add-topic marketing-automation --add-topic remote-mcp-server
```
- **Social preview:** *Settings → General → Social preview → Upload* [`assets/social-preview.png`](../assets/social-preview.png) (1280×640). This is the card shown when the repo is shared.
- Enable **Discussions** for Q&A, which is indexed by search engines. Also enable **private vulnerability reporting** (Security → Settings), which `SECURITY.md` relies on.
- Create a **release** (`v1.0.0`) so directories that track releases pick it up.
- Directory copy, assets, privacy and test plan: [listing-copy.md](listing-copy.md), [privacy.md](privacy.md), [reviewer-test-plan.md](reviewer-test-plan.md).

## One-click install links (already in the README and website)
| Client | Link type | Works on GitHub? |
|---|---|---|
| Claude (web/desktop/mobile, and Claude Code via account sync) | `https://claude.ai/customize/connectors?modal=add-custom-connector&connectorName=…&connectorUrl=…` prefills the Add-connector dialog. Org admins: `https://claude.ai/admin-settings/connectors?…` | ✅ |
| Cursor | `https://cursor.com/install-mcp?name=…&config=<base64>` opens Cursor's install dialog. Native form: `cursor://anysphere.cursor-deeplink/mcp/install?…` | ✅ (https form) |
| VS Code / Insiders | `https://vscode.dev/redirect/mcp/install?name=…&config=…` redirects to `vscode:mcp/install?…`. Add `&quality=insiders` on `insiders.vscode.dev` for Insiders | ✅ |
| Claude Code | No install deeplink exists (`claude-cli://` only opens a prompt). Use `claude mcp add`, the plugin marketplace, or a committed `.mcp.json` | — |

Once the Claude directory listing is approved, switch the Claude button to `https://claude.ai/directory/connectors/<slug>`. Directory listings get a first-party **Connect** button and appear in Claude's suggested connectors.

## 1. Official MCP Registry
Feeds VS Code, GitHub, and other registries that mirror it.

```bash
brew install mcp-publisher            # or download from github.com/modelcontextprotocol/registry/releases
mcp-publisher login github            # must be an OWNER of the GupshupSuperAgent account/org, for io.github.gupshupsuperagent/*
mcp-publisher publish                 # reads ./server.json
```

- **Namespace:** `server.json` uses `io.github.gupshupsuperagent/mcp`. To publish under the brand domain instead (`ai.gupshup/mcp`):
  1. Put a TXT record `v=MCPv1; k=ed25519; p=<public key>` on the **apex** `gupshup.ai`.
  2. Run `mcp-publisher login dns --domain gupshup.ai --private-key …`.
  3. Change `registry_name` in `mcp.config.json`.
- **Bump `version`** in `mcp.config.json` for every republish.

## 2. Claude
**a) Claude Code plugin marketplace.** This repo *is* the marketplace (`.claude-plugin/marketplace.json` → `plugins/gupshup-mcp`). It's live as soon as the repo is public:
```
/plugin marketplace add GupshupSuperAgent/mcp
/plugin install gupshup-mcp@gupshup
```
Validate before each release: `claude plugin validate plugins/gupshup-mcp --strict`.

**b) Claude Connectors Directory** (claude.ai, Claude Desktop, and Claude Code users)
- **Submit at:** https://claude.ai/directory/manage → *Submit new* → *MCP connector*. It needs a paid Claude plan.
- **Have ready:**
  - Server URL
  - Icon: [`assets/icon-512.png`](../assets/icon-512.png) (square) and [`assets/gupshup-logo.svg`](../assets/gupshup-logo.svg)
  - Name, a ≤200-character one-liner and a ≤2000-character description: [listing-copy.md](listing-copy.md)
  - 1–5 categories: *Communication*, *Marketing*
  - Docs URL: `https://github.com/GupshupSuperAgent/mcp`
  - Privacy: `https://www.gupshup.ai/privacy-policy` plus [privacy.md](privacy.md)
  - Support contact
  - Reviewer test account
  - Confirmation that every tool was tested as a custom connector or in MCP Inspector
- **Common rejection:** tools missing `title` or `readOnlyHint`/`destructiveHint` (blocker 3).
- **Escalations:** mcp-review@anthropic.com.

## 3. ChatGPT (OpenAI apps / plugins)
- **Submit at:** https://platform.openai.com/plugins → *With MCP*. This needs a verified organization and owner (or *Apps Management Write*) permission.
- **Domain proof:** serve the token at `https://mcp.gupshup.ai/.well-known/openai-apps-challenge`. That's a server change; add it to the auth-mcp-service change list.
- **Have ready:**
  - Privacy, terms and support URLs
  - Test credentials
  - 5 positive and 3 negative test cases: [reviewer-test-plan.md](reviewer-test-plan.md)
  - A video walkthrough
  - Icon (≥48 px), logo plus a dark variant, and screenshots
  - Display name (≤30 chars), short description (≤30 chars), long description (≤4000 chars)
  - Up to 3 example prompts

## 4. Cursor Marketplace
This repo is also a Cursor plugin marketplace:
- `.cursor-plugin/marketplace.json` lists the plugin.
- `plugins/gupshup-mcp/.cursor-plugin/plugin.json` is the manifest.
- `plugins/gupshup-mcp/mcp.json` is the remote server.
- `plugins/gupshup-mcp/skills/gupshup-messaging/` is the usage skill.
- `plugins/gupshup-mcp/assets/logo.svg` is the logo.

The Claude Code plugin lives in the same folder (`.claude-plugin/` and `.mcp.json`).

**Validate:**
```bash
git clone --depth 1 https://github.com/cursor/plugin-template /tmp/cursor-tpl
node /tmp/cursor-tpl/scripts/validate-template.mjs     # run from this repo's root
```

**Test locally before submitting:**
```bash
mkdir -p ~/.cursor/plugins/local && cp -R plugins/gupshup-mcp ~/.cursor/plugins/local/gupshup
```
Restart Cursor, then check *Customize → Plugins* and *Settings → MCP*. The first Gupshup tool call opens the browser sign-in.

**Submit:**
1. The repo must be **public**. Cursor only lists open-source plugins.
2. Go to **https://cursor.com/marketplace/publish** and sign in with the publishing Cursor account.
   - Alternatively, send the repo link to the Cursor team; the plugin template README names kniparko@anysphere.com.
3. Paste the repo URL `https://github.com/GupshupSuperAgent/mcp` and fill the form from [listing-copy.md](listing-copy.md#cursor-marketplace).
4. Expect a **manual review**, and each later version is reviewed again. Bump `version` in `mcp.config.json`, re-render, tag a release, then resubmit.
5. After approval, users install with `/add-plugin gupshup` or from *Customize → Plugins*. Update the README and website to mention it.

**Before approval, teams can import it themselves:** Cursor dashboard → *Settings → Plugins → Import* → paste the repo URL. Distribution can be set to Default On or Required.

## 5. VS Code
- **Install link and badge:** generated in the README and `docs/clients/vscode.md`.
- **Listing:** VS Code's MCP gallery reads from the official MCP Registry (step 1).

## 6. Smithery
Externally hosted servers are submitted by URL, so no `smithery.yaml` is needed:
```bash
npx @smithery/cli mcp publish "<server URL>" -n @gupshup/mcp
```
If the scan can't get past OAuth, serve `/.well-known/mcp/server-card.json` from the gateway. The content can be built from `catalog/catalog.json`.

## 7. Glama
- [`glama.json`](../glama.json) at the repo root lists the maintainers' **GitHub usernames**. Replace the placeholder before publishing.
- Then claim the server at https://glama.ai/mcp/servers.

## Release checklist
- [ ] `make sync` in the server repo (refreshes `catalog/catalog.json`), then `python3 scripts/render_docs.py`
- [ ] `scripts/check.sh` passes
- [ ] Bump `version` in `mcp.config.json`; add a `CHANGELOG.md` entry
- [ ] Tag a release (`vX.Y.Z`); `mcp-publisher publish`
