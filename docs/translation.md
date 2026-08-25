# Translation

The workflow supports two translation routes selected in `Configure Translation Provider`.

## OpenAI

- Endpoint: Chat Completions.
- Default model: `gpt-4o-mini`.
- Authentication: n8n OpenAI credential selected after import.
- Expected output:

```json
{
  "title_fa": "...",
  "teaser_fa": "..."
}
```

## Gemini

- Endpoint: Gemini `generateContent`.
- Authentication: `GEMINI_API_KEY` from the n8n runtime environment.
- The request asks for JSON using the same `title_fa` and `teaser_fa` contract.
- `Merge Gemini Context` combines the API response with the original article fields before parsing.

## Style

- Natural, concise Persian suitable for a Telegram news channel.
- Preserve factual meaning.
- Use established Persian spellings for clubs, players and locations.
- Do not add facts that are absent from the source.
- Keep the teaser short enough for Telegram caption limits.

## Failure Behaviour

Invalid provider output falls back to the raw response as the title. Provider HTTP errors are not silently discarded and remain visible in the n8n execution.
