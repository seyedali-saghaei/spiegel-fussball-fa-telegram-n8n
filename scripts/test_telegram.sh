#!/usr/bin/env bash
set -euo pipefail

if [[ -f .env ]]; then
  export $(grep -v '^#' .env | xargs) || true
fi

: "${TELEGRAM_BOT_TOKEN:?Set TELEGRAM_BOT_TOKEN}"
: "${TELEGRAM_CHAT_ID:?Set TELEGRAM_CHAT_ID}"

TEXT="n8n Spiegel Fußball → FA: Testnachricht ✅"
curl -sS -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage"   -d "chat_id=${TELEGRAM_CHAT_ID}"   --data-urlencode "text=${TEXT}"   -d "disable_web_page_preview=true"   -d "parse_mode=HTML"

echo "✔ Testnachricht gesendet."
