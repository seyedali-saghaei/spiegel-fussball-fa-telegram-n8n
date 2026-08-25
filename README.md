# German Football News to Persian with n8n

An n8n workflow that collects German football news from multiple RSS feeds, normalizes and filters the articles, translates headlines and teasers into Persian, and publishes them to Telegram.

## Sources

The workflow currently reads these feeds:

- SPIEGEL Fußball
- kicker
- Transfermarkt
- SPOX
- Süddeutsche Zeitung Sport
- t-online Transfermarkt

Feed availability and response formats can change. RSS nodes continue through individual feed failures so that one unavailable source does not stop every source.

## Workflow

```text
Schedule (15 min)
→ RSS feeds
→ Merge feeds
→ Normalize and deduplicate current batch
→ Filter
→ Extract image and teaser
→ Select OpenAI or Gemini
→ Translate to Persian
→ Limit to recent articles
→ Build Telegram payload
→ Send photo or text
```

## Features

- Six German football RSS sources.
- Normalized article fields and link-based deduplication within each execution.
- Configurable OpenAI or Gemini translation path.
- Persian title and teaser output.
- Telegram photo posts with text fallback.
- HTML escaping and Telegram caption-length handling.
- JSON validation and public-export security checks in CI.

## Setup

1. Copy `.env.example` to `.env` and fill only the values required by your deployment.
2. Import `workflows/spiegel-fussball-fa.json` into n8n.
3. Create an OpenAI credential in n8n and select it in `OpenAI Translate (HTTP)`.
4. Create a Telegram credential and select it in both Telegram nodes.
5. Make `TELEGRAM_CHAT_ID` and, when used, `GEMINI_API_KEY` available to the n8n runtime.
6. In `Configure Translation Provider`, set `provider` to `openai` or `gemini`.
7. Execute the workflow manually, inspect the output, then activate the schedule.

The public workflow export intentionally contains no credential IDs, instance IDs, webhook IDs, or real chat IDs.

## Configuration

| Setting | Default |
| --- | --- |
| Schedule | Every 15 minutes |
| Translation provider | `openai` |
| OpenAI model | `gpt-4o-mini` |
| Recent-article window | 20 minutes |
| Telegram chat | `TELEGRAM_CHAT_ID` environment variable |

## Repository Structure

```text
.
├── .github/
├── docs/
├── scripts/
├── workflows/spiegel-fussball-fa.json
├── .env.example
├── README.md
└── LICENSE
```

## Validation

Run:

```bash
bash scripts/validate_workflow.sh
```

The validation checks JSON syntax and rejects common environment-specific fields in the public workflow export.

## Limitations

- Link deduplication is performed within a single workflow execution. The 20-minute window reduces stale posts but does not guarantee cross-run duplicate prevention.
- RSS feed schemas and availability are controlled by external publishers.
- Provider credentials must be configured after importing the sanitized workflow.
- The workflow does not include a delivery retry or dead-letter queue.
- The simple men-only keyword filter can produce false positives or false negatives.

## Documentation

- `docs/translation.md`: translation providers and output contract.
- `docs/compliance.md`: source and copyright guidance.
- `docs/runbook.md`: operation and troubleshooting.

## License

MIT
