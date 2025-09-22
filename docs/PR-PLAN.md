# PR-Plan (mehrere Pull Requests)

## PR 1 – Scaffold & CI
**Branch:** `feat/scaffold-and-ci`  
**Inhalt:** `.gitignore`, `LICENSE`, `README.md` (grundlegend), `.env.example`, CI (`.github/workflows/ci.yml`), PR/Issue-Templates.  
**Message:** `chore: scaffold repo and add CI`

## PR 2 – Workflow Base
**Branch:** `feat/workflow-base`  
**Inhalt:** `workflows/spiegel-fussball-fa.json` (Cron, RSS, Filter Männer, Bildextraktion, Text-Fallback Struktur ohne API Keys).  
**Message:** `feat(workflow): add spiegel fussball base with filters`

## PR 3 – OpenAI Translation
**Branch:** `feat/openai-translation`  
**Inhalt:** HTTP-Request Node, Prompt-Set, Mapping `title_fa`, `docs/translation.md`.  
**Message:** `feat(translation): integrate OpenAI DE→FA with prompt`

## PR 4 – Telegram Output
**Branch:** `feat/telegram-output`  
**Inhalt:** sendPhoto/sendMessage Nodes, `scripts/test_telegram.sh`.  
**Message:** `feat(telegram): send photo+caption with link and text fallback`

## PR 5 – Runbook & Compliance
**Branch:** `docs/runbook-and-compliance`  
**Inhalt:** `docs/runbook.md`, `docs/compliance.md` und README-Update.  
**Message:** `docs: add runbook and compliance guidelines`

---

## Git-Befehle (Beispiel)
```bash
git init
git remote add origin <YOUR_REPO_URL>
git checkout -b feat/scaffold-and-ci
git add .
git commit -m "chore: scaffold repo and add CI"
git push -u origin feat/scaffold-and-ci
# Ersten PR erstellen…

# Nächster PR auf neuer Branch
git checkout -b feat/workflow-base
# (Nur relevante Änderungen committen)
git commit -m "feat(workflow): add spiegel fussball base with filters"
git push -u origin feat/workflow-base
# PR erstellen…
```
