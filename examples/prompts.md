# Prompt recipes

These work in any client once Gupshup is connected. Tools named in *italics* are what the agent will typically call. Anything that sends messages opens a review panel (or asks you to confirm) first.

## Marketing
- "Draft a WhatsApp template for our weekend sale with an image header, a 20% off code variable and a **Shop now** button. Show me 3 options." *(preview_template)*
- "Take the option I liked and make Hindi, Tamil and Bengali versions. Preview them together, then submit all of them for approval." *(preview_multilingual_templates → create_multilingual_templates)*
- "A/B test two subject lines on 10% of customers who bought in the last 90 days, pick the winner on click rate after 24 hours, then send it to the rest." *(get_cdp_summary → open_ab_test_review)*
- "Schedule the approved Diwali template to my VIP segment for Friday 7pm IST, and fall back to SMS if WhatsApp fails." *(open_campaign_review)*

## CRM / lifecycle
- "Which templates were rejected this month, and why? Rewrite them so they'll pass." *(get_template_status → preview_template)*
- "Design a 3-step win-back sequence: day 0 WhatsApp, day 3 SMS reminder, day 7 final offer. Show me the timeline." *(preview_flow)*
- "Set up WhatsApp-to-SMS failover for our OTP template across all traffic, not just campaigns." *(register_channel_fallback)*

## Operations
- "Is yesterday's campaign still running? If delivery is below 85%, pause it." *(get_campaign_status → optimize_running_campaign)*
- "Retry the WhatsApp failures from campaign X on SMS, but dry-run first and tell me how many will go out." *(auto_fallback_channel)*
- "Why do I see no RCS data? Check my account setup on each channel." *(get_account_health)*

## Analysts & leadership
- "Compare delivery and read rates for WhatsApp, SMS and RCS this month vs last month." *(get_performance)*
- "Top 5 failure reasons in the last 7 days, with volume lost and the fix for each." *(get_failures)*
- "Which 10 templates drive the most clicks, and which are underperforming?" *(get_performance group_by=template)*
- "Break down this quarter's messaging volume by billing bucket and channel." *(get_spend)*

## Good habits
- Name the **channel** and **time window**. The agent asks if you don't, but it's faster when you do.
- Ask for a **preview or dry run** before anything that sends or changes live campaigns.
- Grant only the apps you need (see [auth & scopes](../docs/auth-and-scopes.md)).
