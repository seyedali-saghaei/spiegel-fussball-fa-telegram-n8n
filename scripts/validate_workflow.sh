#!/usr/bin/env bash
set -euo pipefail

workflow="workflows/spiegel-fussball-fa.json"

jq empty "$workflow"

jq -e '
  ((has("id") or has("versionId") or has("meta") or has("pinData") or has("staticData")) | not)
  and
  ([.nodes[] | (has("credentials") or has("webhookId"))] | any | not)
  and
  ([.nodes[]
    | select(.type == "n8n-nodes-base.telegram")
    | (.parameters.chatId // "")
    | tostring
    | test("^-?[0-9]+$")
  ] | any | not)
' "$workflow" >/dev/null

if grep -Eq '^(OPENAI_API_KEY|GEMINI_API_KEY|TELEGRAM_BOT_TOKEN|TELEGRAM_CHAT_ID)=.+$' .env.example; then
  echo "Credential-like values must stay empty in .env.example" >&2
  exit 1
fi

echo "Workflow export validation passed."
