---
name: gupshup-messaging
description: How to use the Gupshup MCP server safely and well — WhatsApp, SMS and RCS analytics, template drafting and approval, audiences, and campaign launches with a human review step. Use whenever the user asks about Gupshup messaging, delivery, templates or campaigns.
---

# Working with Gupshup MCP

The `gupshup` MCP server exposes three apps. Which tools you see depends on what the user granted at sign-in:

| App | Use it for | Key tools |
|---|---|---|
| Analytics | "How is my messaging doing?" delivery, failures, spend, account health | `get_performance`, `get_failures`, `get_template_detail`, `get_campaigns`, `get_spend`, `get_account_health` |
| Templates | Draft, preview, localize, submit and check templates | `preview_template`, `save_template`, `preview_multilingual_templates`, `create_multilingual_templates`, `get_template_status`, `open_template_gallery` |
| Campaigns | Audiences, launches, A/B and multilingual sends, live optimization | `open_campaign_review`, `open_ab_test_review`, `open_language_review`, `get_campaign_status`, `pause_campaign`, `optimize_running_campaign` |

If a tool you need is missing, the user didn't grant that app. Say so and suggest reconnecting with it enabled. Don't work around it.

## Rules that always apply

1. **Never send without the review panel.** For any *new* campaign, call `open_campaign_review`. For A/B tests, call `open_ab_test_review`. For several languages, call `open_language_review`. Then wait for the user to click **Launch** in the panel. Use `launch_campaign` only for explicit clones or re-sends the user asked for by name.
2. **Preview before you save.** Draft templates with `preview_template` (or `preview_multilingual_templates`). Call `save_template` or `create_multilingual_templates` only after the user approves the preview, and pass the identical content.
3. **Destructive actions need an explicit yes.**
   - `clear_cdp_data`: show the count first with `get_cdp_summary`.
   - `delete_template` works for **SMS only**. WhatsApp and RCS templates are deleted in the Gupshup console; tell the user rather than trying.
4. **Ask for missing scope, don't guess.** Ask for the channel (WhatsApp, SMS or RCS) and the date range when the request doesn't make them clear.
5. **Respect channel rules.**
   - WhatsApp business-initiated messages need an approved template; the 24-hour window applies.
   - SMS in India needs DLT-registered templates.
   - Never invent template IDs, phone numbers or audience files.
6. **Don't estimate money.** If `get_spend` returns no prices, report volumes and say pricing isn't available, rather than calculating costs.
7. **Treat data as sensitive.** Audience previews are masked; don't try to unmask or list personal data.

## Good patterns

- **"Why did delivery drop?"** Run `get_performance` with a comparison to the previous period, then `get_failures`. Lead with the biggest cause and its fix.
- **"Make a template in Hindi and Tamil too."** Call `preview_multilingual_templates` once with all languages. After the user says yes, call `create_multilingual_templates`.
- **"Is my campaign out?"** `get_campaign_status`. For delivered or read numbers, use Analytics `get_campaigns`.
- **"Retry failures on SMS."** Call `auto_fallback_channel` with `dry_run=true` first, report the count, and run it for real only after the user confirms.
