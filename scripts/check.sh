#!/usr/bin/env bash
# Repo checks: generated files up to date, manifests parse, relative links resolve,
# and nothing internal or secret leaked into this public repo.
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0

echo "== generated files"
python3 scripts/render_docs.py --check || fail=1

echo "== manifests parse"
for f in server.json glama.json mcp.config.json catalog/catalog.json .claude-plugin/marketplace.json \
         plugins/gupshup-mcp/.claude-plugin/plugin.json plugins/gupshup-mcp/.mcp.json \
         plugins/gupshup-mcp/.cursor-plugin/plugin.json plugins/gupshup-mcp/mcp.json .cursor-plugin/marketplace.json; do
  python3 -c "import json,sys; json.load(open(sys.argv[1]))" "$f" || { echo "invalid JSON: $f"; fail=1; }
done
python3 -m py_compile examples/*.py scripts/*.py || fail=1

echo "== relative markdown links"
python3 - <<'PY' || fail=1
import re, sys, pathlib
bad = []
for md in pathlib.Path(".").rglob("*.md"):
    if ".git" in md.parts:
        continue
    for target in re.findall(r"\]\(([^)\s]+)\)", md.read_text()):
        if re.match(r"^(https?:|mailto:|cursor:|vscode:|#)", target):
            continue
        path = (md.parent / target.split("#")[0]).resolve()
        if not path.exists():
            bad.append(f"{md}: {target}")
print("\n".join(bad) or "ok")
sys.exit(1 if bad else 0)
PY

echo "== no internal hosts or secrets"
if grep -rInE '(\b10\.[0-9]+\.[0-9]+\.[0-9]+\b|\b192\.168\.|\b172\.(1[6-9]|2[0-9]|3[01])\.|gitlab\.gupshup|\.gupshup\.me\b|gsbiml|ngrok|BEGIN [A-Z ]*PRIVATE KEY|sk-ant-|ghp_[A-Za-z0-9]{20,}|GATEWAY_SHARED_SECRET|X-Gupshup-Credentials)' \
     --exclude-dir=.git --exclude=check.sh . ; then
  echo "internal host / secret pattern found"; fail=1
else
  echo ok
fi

echo "== repo identity (no squattable or placeholder references)"
# The repo lives at GupshupSuperAgent/mcp. A link to an org we don't own (e.g. github.com/gupshup)
# would route vulnerability reports, issues and registry ownership to whoever registers it.
if grep -rInE 'github\.com/gupshup([/"#?)]|$)|io\.github\.gupshup/' --exclude-dir=.git --exclude=check.sh --exclude=catalog.json . ; then
  echo "reference to an unowned GitHub org/namespace found"; fail=1
fi
if grep -rIn 'REPLACE-WITH' --exclude-dir=.git --exclude=check.sh . ; then
  echo "placeholder value found"; fail=1
fi
python3 - <<'PY' || fail=1
import json, sys
repo = json.load(open("mcp.config.json"))["repo_url"].rstrip("/")
reg = json.load(open("server.json"))["name"]
owner = repo.split("github.com/")[1].split("/")[0]
ok = reg.startswith(f"io.github.{owner.lower()}/") or not reg.startswith("io.github.")
print("ok" if ok else f"server.json name {reg} doesn't match repo owner {owner}")
sys.exit(0 if ok else 1)
PY
exit $fail
