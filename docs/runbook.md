# Runbook (Betrieb & Troubleshooting)

## Secrets
- **OPENAI_API_KEY**: Rotation alle 90 Tage empfohlen.
- **TELEGRAM_BOT_TOKEN**: Bei Verdacht auf Leak neu generieren (BotFather).
- **TELEGRAM_CHAT_ID**: Konstante Kanal-ID (z. B. `-100…`).

## Health
- Workflow in n8n **aktiv**? Cron läuft?
- **Telegram-Bot Admin** im Kanal?
- Outbound erreichbar: `api.openai.com`, `api.telegram.org`.

## Fehler
- **429/5xx OpenAI**: automatisches Retry per Node-Optionen (oder manuell erneut triggern).
- **Telegram 400 (Bad Request)**: Prüfe `chat_id`, Bild-URL, Nachrichtengröße.
- **Keine Bilder**: Fallback sendMessage (Text) greift automatisch.

## Änderung
- Anpassungen am Prompt in `PreparePrompt`-Node.
- Filterliste (Frauen/Women) im Node „Filter: nur Männer-Fußball“.

## Monitoring (leicht)
- Optional separaten **Error-Workflow** mit *Error Trigger* erstellen und an Telegram-Admin senden.
