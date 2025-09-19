# spiegel-fussball-fa-telegram-n8n

Deutsch → Farsi (فارسی) News-Relay für **SPIEGEL / Sport / Fußball** via **n8n (v1.103.2)**, nur **Core-Nodes**.  
Quelle: **offizieller SPIEGEL Fußball RSS**, Post in **Telegram-Kanal** mit **Titel (FA)** + „Quelle: SPIEGEL“ + **Link**, inkl. Bild wenn im Feed vorhanden.

## Architektur (high-level)
```
Cron (15m) → RSS (SPIEGEL Fußball) → Filter (Männer) → Bild extrahieren
→ OpenAI (DE→FA, locker, Transliteration) → Telegram (Foto+Caption | Text)
```

## Quickstart
1) Repo klonen, `.env.example` prüfen und als `.env` ablegen (nicht committen!).  
2) n8n öffnen → **Import** → Datei `workflows/spiegel-fussball-fa.json`.  
3) Credentials anlegen:
   - **Telegram API** (Bot-Token), Bot als **Admin** im Ziel-Kanal.
   - **HTTP Header Auth** für OpenAI: `Authorization: Bearer <OPENAI_API_KEY>`
4) Workflow öffnen → prüfen → **Activate**.

## Konfiguration
- **Polling**: alle 15 Minuten (Cron).  
- **Kein State**: Duplikate werden über Zeitfenster (letzte 20 Min) gemieden.  
- **Nur Männer-Fußball**: einfache Negativ-Liste (Frauen/Women-Begriffe) auf Titel/Teaser.  
- **Übersetzung**: OpenAI Chat Completions, `OPENAI_MODEL` (Default: `gpt-4o-mini`), Temperatur 0.2.

## Dateien
- `workflows/spiegel-fussball-fa.json` – n8n-Workflow (Core-Nodes).  
- `docs/translation.md` – Prompt/Style-Guide & Parametrisierung.  
- `docs/compliance.md` – Nutzung von offiziellen Feeds, Urheberhinweise.  
- `docs/runbook.md` – Betrieb, Fehlerbehandlung, Rotationen.  
- `scripts/test_telegram.sh` – schneller Bot-Test mit `curl`.  
- `.github/workflows/ci.yml` – einfache CI (JSON-Validierung).

## Entwicklung
Conventional Commits (`feat:`, `fix:`, `docs:`, `ci:`, `chore:`).  
Multi-PR-Plan siehe unten oder `docs/PR-PLAN.md`.

### Beispiel-Branches & PRs
1. `feat/scaffold-and-ci` – Grundgerüst, CI, Templates.  
2. `feat/workflow-base` – Cron + RSS + Filter + Bildextraktion.  
3. `feat/openai-translation` – HTTP Request + Prompt + Mapping.  
4. `feat/telegram-output` – Foto/Caption & Text-Fallback + Script.  
5. `docs/runbook-and-compliance` – Betrieb & Compliance-Doku.

## Lizenz
MIT – siehe `LICENSE`.
