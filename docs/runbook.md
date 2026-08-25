# Runbook

## Start

1. Import `workflows/spiegel-fussball-fa.json`.
2. Create and select the OpenAI and Telegram credentials required by the chosen route.
3. Provide `TELEGRAM_CHAT_ID` to the n8n runtime.
4. For Gemini, also provide `GEMINI_API_KEY`.
5. Set `provider` in `Configure Translation Provider` to `openai` or `gemini`.
6. Execute the workflow manually and inspect both the translation and Telegram payload.
7. Activate the 15-minute schedule only after the manual test succeeds.

## Monitoring

- Review failed executions in n8n.
- Check which RSS source failed before changing the whole workflow.
- Track translation-provider HTTP status codes and rate limits.
- Verify that the bot remains an administrator of the target channel.

RSS nodes continue through individual feed errors. Translation and Telegram errors still stop the affected execution and remain visible in n8n.

## Common Problems

- **401/403 from a translation provider:** verify the selected credential or runtime key.
- **Telegram 400:** check chat ID, bot permissions, image URL and caption length.
- **No posts:** inspect feed outputs, the recent-article window and provider routing.
- **Duplicate posts:** the MVP has no persistent cross-run article store; add a Data Table or database before production use.
- **Gemini route produces no output:** confirm that `GEMINI_API_KEY` is available to the n8n process.

## Security

- Never commit `.env`, bot tokens, API keys or numeric chat IDs.
- Export the workflow as inactive.
- Remove n8n instance metadata and credential references before publishing.
- Rotate any credential that has appeared in Git history.
