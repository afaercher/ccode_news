#!/usr/bin/env bash
#
# Claude Code News Crawler
# Sendet einen Prompt an die Claude Code API, der die neuesten
# Änderungen recherchiert, in news/ccode-news.md zusammenfasst,
# committet und pusht.
#

set -euo pipefail

API_URL="http://192.168.4.189:8000/prompt"
PROJECT_DIR="/home/afaercher/proj/ccode_news"
LOG_FILE="/home/afaercher/proj/ccode_news/ccode-news.log"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$TIMESTAMP] Starte Claude Code News Crawl..." >> "$LOG_FILE"

PROMPT=$(cat <<'PROMPT_END'
Du bist ein Claude Code News Crawler. Deine Aufgabe: recherchiere die neuesten Claude Code Änderungen und pflege sie in eine übersichtliche Markdown-Datei ein.

## Schritt 1: Quellen abrufen
Rufe mit WebFetch folgende Quellen ab und extrahiere ALLE neuen Features, Fixes und Änderungen:
1. https://code.claude.com/docs/en/whats-new — Wöchentliche Digests, folge auch den Links zu den einzelnen Wochen-Seiten
2. https://github.com/anthropics/claude-code/releases — Detaillierte Release Notes pro Version
3. https://claude.com/blog-category/announcements — Größere Produktankündigungen
4. https://platform.claude.com/docs/en/release-notes — Platform Release Notes

## Schritt 2: Bestehende Datei lesen
Lies die Datei news/ccode-news.md falls sie existiert. Merke dir, welche Versionen/Features bereits dokumentiert sind, damit du keine Duplikate erzeugst.

## Schritt 3: Neue Einträge erstellen
Für JEDES neue Feature/Fix, das noch nicht in der Datei steht, erstelle einen Eintrag:

### [Feature-Name]
- **Was:** Kurze, verständliche Beschreibung was das Feature/Fix macht
- **Einsatz:** Konkreter Befehl, Config-Option oder Workflow (falls anwendbar). Wenn es ein internes Fix ist, schreibe "Automatisch aktiv"
- **Mehrwert:** Welchen praktischen Nutzen bringt es im Entwickler-Alltag?
- **Version:** Versionsnummer (z.B. v2.1.101)

## Schritt 4: Datei schreiben
Erstelle oder aktualisiere die Datei news/ccode-news.md mit folgender Gesamtstruktur:

```markdown
# Claude Code News

> Automatisch kuratierte Zusammenfassung der neuesten Claude Code Änderungen.
> Letzte Aktualisierung: [AKTUELLES DATUM UND UHRZEIT]

---

## Neueste Änderungen

[Hier die neuesten Einträge, chronologisch sortiert - neueste zuerst]
[Gruppiert nach Version/Woche]

---

## Quellen

- [What's New (Offizielle wöchentliche Digests)](https://code.claude.com/docs/en/whats-new)
- [GitHub Releases](https://github.com/anthropics/claude-code/releases)
- [Anthropic Blog Announcements](https://claude.com/blog-category/announcements)
- [Platform Release Notes](https://platform.claude.com/docs/en/release-notes)
```

Wichtige Regeln:
- Erstelle das Verzeichnis news/ mit mkdir -p falls nötig
- Überschreibe KEINE bestehenden Einträge - füge nur neue hinzu
- Halte die Datei übersichtlich und gut strukturiert
- Jeder Eintrag soll für sich verständlich sein
- Nutze deutsche Sprache für die Beschreibungen

## Schritt 5: Git Commit & Push
Nach dem erfolgreichen Update:
1. git add news/ccode-news.md
2. git commit -m "docs: Claude Code News Update [AKTUELLES DATUM]"
3. git push

Falls das Git-Repo noch nicht initialisiert ist, überspringe den Git-Schritt und melde das.
PROMPT_END
)

ESCAPED_PROMPT=$(python3 -c "
import json, sys
print(json.dumps(sys.stdin.read()))
" <<< "$PROMPT")

PAYLOAD=$(cat <<JSON_END
{
  "prompt": ${ESCAPED_PROMPT},
  "cwd": "${PROJECT_DIR}"
}
JSON_END
)

HTTP_CODE=$(curl -s -o /tmp/ccode-news-response.json -w "%{http_code}" \
  -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD" \
  --max-time 600)

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 300 ]; then
  echo "[$TIMESTAMP] Erfolgreich (HTTP $HTTP_CODE)" >> "$LOG_FILE"
else
  echo "[$TIMESTAMP] Fehler (HTTP $HTTP_CODE)" >> "$LOG_FILE"
  echo "[$TIMESTAMP] Response: $(cat /tmp/ccode-news-response.json)" >> "$LOG_FILE"
  exit 1
fi
