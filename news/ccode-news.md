# Claude Code News

> Automatisch kuratierte Zusammenfassung der neuesten Claude Code Änderungen.
> Letzte Aktualisierung: 2026-08-01 18:00 UTC (Bestätigungs-Crawl 01.08. 3. Lauf: **keine neuen Einträge** — alle vier Quellen gegengeprüft: neueste CLI weiterhin **v2.1.220** (25.07. 01:35), kein v2.1.221+ (WebSearch gegenbestätigt, Changelog endet bei v2.1.220); Platform-Release-Notes Top-Eintrag weiterhin **24.07.** (Claude Opus 5 auf API/Bedrock/Vertex/Foundry); Blog weiterhin **28.07.** („Bringing MCP to Claude"); What's-New weiterhin **Week 29** (13.–17.7., Tags v2.1.207–v2.1.212) als neuester Digest, **Week 30 noch nicht veröffentlicht**. — Ältere Crawl-Historie in den Git-Commits.)

---

## Neueste Änderungen

### Blog / Ankündigung (28. Juli 2026)

---

### [MCP 2026-07-28 — fünfte Spec-Version des Model Context Protocol]
- **Was:** Anthropic hat die fünfte MCP-Spec-Version veröffentlicht — laut Ankündigung „eine der bedeutendsten Spec-Releases bisher". Kernänderungen: (1) **Stateless-Architektur** — Umstieg von einem bidirektionalen, zustandsbehafteten Protokoll auf ein reines **Request/Response-Modell**, wodurch MCP-Server auf Serverless-/Edge-Infrastruktur laufen können; (2) **standardisierte, versionierte Extensions** — **MCP Apps** (Server rendern interaktive UI direkt in der Konversation) und **MCP Tasks** (langlaufende Arbeit ohne Änderung am Core-Protokoll); (3) **produktreife Authorization**, die sich an Enterprise-Identity-Systemen wie Entra oder Okta ohne Workarounds ausrichtet. Auf Claude-Seite: über **950 MCP-Server** im Connectors-Directory, Enterprise-Managed-Authentication, Developer-Observability-Dashboards zur Connector-Performance sowie **MCP-Tunnels** (Research Preview) für Server in privaten Netzwerken. Ökosystem-Support u. a. von Figma, Intuit, Netlify, PostHog, Xero und Zoom.
- **Einsatz:** Betrifft alle, die MCP-Server bauen oder Connectors in Claude/Claude Code nutzen — neue Server gegen die Spec 2026-07-28 entwickeln; stateless Server serverless deployen; interaktive UIs über die MCP-Apps-Extension, langlaufende Jobs über die MCP-Tasks-Extension anbieten; private Server per MCP-Tunnel (Research Preview) anbinden.
- **Mehrwert:** Deutlich einfacherer Betrieb und bessere Skalierung von MCP-Servern (kein Dauer-State/keine bidirektionale Verbindung nötig), saubere Enterprise-Authentifizierung ohne Bastellösungen und ein formalisierter Erweiterungsrahmen, der bisher lose Fähigkeiten (interaktive UI, lange Tasks) versioniert und portabel macht.
- **Version:** Blog-Ankündigung 28.07.2026 (MCP-Spec 2026-07-28) — noch keine zugehörige Claude-Code-CLI-Version; Latest CLI weiterhin v2.1.220.

---

### Woche 30 (25. Juli 2026) — v2.1.220

---

### [Stabilitäts- & Zuverlässigkeits-Fixes v2.1.220]
- **Was:** Reine Bugfix-/Zuverlässigkeits-Version ohne neue Features.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kleinere Stabilitätsverbesserungen unmittelbar nach der großen Opus-5-Version (v2.1.219).
- **Version:** v2.1.220

---

### Woche 30 (24. Juli 2026) — v2.1.219

---

### [Claude Opus 5 als neuer Standard-Opus in Claude Code]
- **Was:** Claude Opus 5 (`claude-opus-5`) ist da und wird das neue Standard-Opus-Modell in Claude Code: 1M-Token-Kontextfenster (Default und Maximum), 128k Max-Output, Thinking standardmäßig an, Fast-Mode zu $10/$50 pro Mtok. Opus 4.7 fliegt aus dem Fast-Mode; die `claude-api`-Skill defaultet jetzt auf Opus 5.
- **Einsatz:** `/model` → Opus 5 wählen (läuft auch automatisch als neuer Opus-Default); Fast-Mode via `/fast`.
- **Mehrwert:** Deutlicher Fähigkeitssprung gegenüber Opus 4.8 bei gleichem Standard-Preis ($5/$25 pro Mtok) — mehr Kontext und stärkere Modellleistung ohne Mehrkosten im Standardbetrieb.
- **Version:** v2.1.219

### [Tiefere Subagent-Verschachtelung (bis Ebene 3)]
- **Was:** Subagents können jetzt selbst wieder Subagents starten, bis zu 3 Ebenen tief (vorher 1). Ergänzt den in v2.1.217 eingeführten Concurrency-Cap.
- **Einsatz:** Automatisch aktiv (greift in Workflows/Agent-Ketten)
- **Mehrwert:** Komplexere Orchestrierungen lassen sich sauber schachteln, statt an einer flachen Ebene zu enden.
- **Version:** v2.1.219

### [`sandbox.network.strictAllowlist` & weitere Neuerungen v2.1.219]
- **Was:** Neue Einstellung `sandbox.network.strictAllowlist` (verweigert nicht-allowlistete Hosts für Sandbox-Befehle ohne Rückfrage), neuer `DirectoryAdded`-Hook (feuert nach `/add-dir` bzw. SDK `register_repo_root`), `mcp_server_errors` im Headless-`stream-json`-Init-Event, `workflowSizeGuideline`-Settings-Key, geschachteltes Subagent-Forwarding in `stream-json` via `--forward-subagent-text`. Plus Bugfixes (`claude -p` verschluckte Antworten bei Mid-Stream-API-Fehlern, HTTP-Status/Fehlertext in `claude mcp list`/`/mcp`, Permission-Approval-Verlust bei Self-Hosted-Runner-Restarts, `/model`-Picker-Darstellung u. a.). Default für dynamische Workflows jetzt „medium" (< 15 Agents).
- **Einsatz:** Automatisch aktiv bzw. optionale Settings/Flags
- **Mehrwert:** Strengere Netzwerk-Sandbox, mehr Hook-/Telemetrie-Haken für Automatisierung und robusteres Headless/SDK-Verhalten.
- **Version:** v2.1.219

---

### Woche 30 (22. Juli 2026) — v2.1.218

---

### [`/code-review` läuft als Background-Subagent]
- **Was:** `/code-review` wird jetzt als Hintergrund-Subagent ausgeführt; `/deep-research` ist nur noch manuell aufrufbar; Skills mit `context: fork` laufen standardmäßig im Hintergrund.
- **Einsatz:** `/code-review` wie gewohnt aufrufen — läuft nun nebenläufig weiter.
- **Mehrwert:** Der Review blockiert die Hauptsession nicht mehr; man arbeitet weiter, während er läuft.
- **Version:** v2.1.218

### [Bugfix- & Barrierefreiheits-Sammlung v2.1.218]
- **Was:** Große Fix-Runde: Windows-Pfade mit `\u`-Segmenten wurden zu CJK-Zeichen verstümmelt; Links-Pfeil verwarf die Konversation ohne Undo-Bestätigung; Multi-Line-Paste kollabierte in Ctrl+J-Terminals; `/context` meldete veraltete Token-Nutzung nach Compact; `/ultrareview` scheiterte an beschreibenden Argumenten; `/code-review ultra` lief in nicht-interaktiven Sessions still lokal; Gateway-Spend-Metering für Bedrock-ARNs; Fork-Session-Lineage-Verlust nach Compaction; Resume-Crashes bei fehlerhaften Delta-Attachments; viele Screenreader-Fixes (VoiceOver, Text-Löschungs-Ansagen). Plan-Mode-Auto fragt nicht mehr bei read-only Bash; `yes`/`no`/`on`/`off`/`1`/`0` werden als Boolean akzeptiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar stabilere Windows-, Resume- und Review-Abläufe plus bessere Screenreader-Unterstützung.
- **Version:** v2.1.218

---

### Woche 30 (21. Juli 2026) — v2.1.217

---

### [Emoji-Shortcode-Autocomplete & Subagent-Concurrency-Cap]
- **Was:** Emoji-Shortcode-Vervollständigung (`:heart:` → ❤️, abschaltbar via `emojiCompletionEnabled`), neuer Subagent-Concurrency-Cap (Default 20, override via `CLAUDE_CODE_MAX_CONCURRENT_SUBAGENTS`), Subagents starten standardmäßig keine geschachtelten Subagents mehr, Login-Ablaufwarnung jetzt 3 Tage vorher. Plus Bugfixes (Memory-Leak bei getrunkten MCP-Tool-Outputs, Windows-Auto-Update ließ `claude.exe` verschwinden, Auto-Compact triggerte nie für Opus 4.8 auf Bedrock, `CLAUDE.md`-Brace-Expansion-OOM beim Start, nicht stoppbare Background-Shells u. a.).
- **Einsatz:** Automatisch aktiv bzw. optionale Settings/Env
- **Mehrwert:** Weniger Runaway-Subagent-Fanout, weniger Speicherlecks und ein deutlich stabilerer Windows-/Startup-Pfad.
- **Version:** v2.1.217

---

### Woche 30 (20. Juli 2026) — v2.1.216

---

### [`sandbox.filesystem.disabled` & große Bugfix-Sammlung v2.1.216]
- **Was:** Neue Einstellung `sandbox.filesystem.disabled` (überspringt FS-Isolation). Sehr große Fix-Runde: quadratische Verlangsamung der Message-Normalisierung in langen Sessions behoben; Auto-Mode lehnte Befehle nach OAuth-Token-Ablauf fälschlich mit „HTTP 401" ab; Claude Code on Web fragte nach Idle-Zeit erneut; @-Mentions hängten nach dateiändernden Hooks nichts an; worktree-isolierte Subagents liefen git gegen das Haupt-Repo; nicht löschbare Background-Sessions ohne Git-Repo; `claude daemon stop --any` killte fremde Prozesse; Bash-Permission-Check für zusammengesetzte Statements; MCP-Reauth widerrief funktionierende Credentials; Claude-in-Chrome-403-Loop; viele Windows-/PowerShell-/Vim-/Transcript-Fixes. `/fork`-Bestätigung auf eine Zeile verkürzt, dataviz-Skill-Palette aktualisiert.
- **Einsatz:** Automatisch aktiv bzw. optionale Settings
- **Mehrwert:** Deutlich flüssigere lange Sessions (kein quadratischer Overhead mehr), geschlossene Permission-/Sandbox-Lücken und viele stabilisierte Background-/Worktree-Abläufe.
- **Version:** v2.1.216

---

### Plattform (Claude API / Console) — 17.–24. Juli 2026

---

### [Claude Opus 5 auf der Plattform (API, Bedrock, Vertex, Foundry)]
- **Was:** Opus 5 ist über Claude API, Amazon Bedrock, Google Cloud/Vertex AI und Microsoft Foundry verfügbar: 1M-Kontext (Default & Max), 128k Output, Thinking default-an, $5/$25 pro Mtok (wie Opus 4.8). Effort (`low`…`max`) ist das primäre Steuerinstrument, `max` für besonders anspruchsvolle Aufgaben. **Breaking Change:** Thinking abschalten (`thinking:{"type":"disabled"}`) ist nur noch bis Effort `high` erlaubt — mit `xhigh`/`max` gibt es einen 400-Fehler.
- **Einsatz:** `model: "claude-opus-5"` in API-Requests; Effort-Level passend setzen.
- **Mehrwert:** Stärkstes Modell mit großem Kontext zum gleichen Preis wie Opus 4.8; klare Effort-Leiter für Kosten-/Qualitäts-Steuerung.
- **Version:** Platform Release Notes 24.07.2026

### [Mid-Conversation-Tool-Changes & Fallbacks-Default-Modus (Beta)]
- **Was:** Tools lassen sich jetzt zwischen Gesprächsrunden hinzufügen/entfernen, ohne den Prompt-Cache zu verlieren — Beta auf Fable 5, Mythos 5, Opus 4.8 und Opus 5 via Header `mid-conversation-tool-changes-2026-07-01`. Zudem: der `fallbacks`-Parameter unterstützt einen `"default"`-Modus mit Anthropics empfohlenen Fallback-Modellen je Refusal-Kategorie (Beta, Header `server-side-fallback-2026-07-01`). Fast-Mode für Opus 4.7 wurde entfernt (Requests mit `speed:"fast"` liefern jetzt einen Fehler statt auf Standard-Speed zurückzufallen).
- **Einsatz:** Entsprechende Beta-Header in API-Requests setzen.
- **Mehrwert:** Dynamische Tool-Sets ohne Cache-Verlust und robusteres Refusal-Handling per serverseitigem Fallback.
- **Version:** Platform Release Notes 24.07.2026

### [Managed Agents: Effort, Lifecycle-Webhooks, Seed-Events, Thread-Deltas]
- **Was:** Für Claude Managed Agents: `effort` in der Modell-Konfig eines Agents setzbar; Webhooks decken nun Environment- (`environment.*`) und Memory-Store-Lifecycle (`memory_store.*`) ab; Sessions lassen sich beim Anlegen mit bis zu 50 `initial_events` seeden (startet den Agent-Loop im selben Call); das `version`-Feld beim Agent-Update ist optional (Optimistic Concurrency oder bedingungsloses Update); Session-Thread-Event-Streams unterstützen Event-Deltas zum Live-Preview von Subagent-Text.
- **Einsatz:** Managed-Agents-API entsprechend nutzen (Agent-Setup, Webhooks, Sessions).
- **Mehrwert:** Weniger Polling, weniger Round-Trips und feinere Steuerung beim Bau eigener Agent-Backends.
- **Version:** Platform Release Notes 22.07.2026

### [Legacy-Workbench & experimentelle Prompt-Tools-APIs werden abgeschaltet]
- **Was:** Das alte Workbench (`platform.claude.com/workbench`) wird zum **17.08.2026** eingestellt; gespeicherte Prompts, Variablen und Evals werden im neuen Playground nicht unterstützt (Export über Banner/Org-Settings). Gemeinsam damit werden die experimentellen Prompt-Tools-APIs (`/v1/experimental/generate_prompt`, `improve_prompt`, `templatize_prompt`) abgeschaltet — danach liefern sie einen Fehler.
- **Einsatz:** Vor dem 17.08. Daten exportieren und Integrationen von den experimentellen Endpunkten migrieren.
- **Mehrwert:** Frühzeitige Warnung, um Datenverlust und brechende Integrationen zu vermeiden.
- **Version:** Platform Release Notes 17.07.2026

---

### Blog / Ankündigungen — 23. Juli 2026

---

### [Voice-Mode: „Think through hard problems"]
- **Was:** Neuer Announcement-Post „Think through hard problems in voice mode" — schwierige Probleme lassen sich im Sprachmodus durchdenken und -sprechen.
- **Einsatz:** Voice-Mode in den Claude-Apps nutzen.
- **Mehrwert:** Freihändiges, dialogisches Durchdenken komplexer Aufgaben als Ergänzung zum Tippen.
- **Version:** Blog-Announcement 23.07.2026

---

### Woche 29 (19. Juli 2026) — v2.1.215

---

### [`/verify` und `/code-review` nur noch manuell]
- **Was:** Claude startet die Skills `/verify` (End-to-End-Verifikation einer Änderung) und `/code-review` (Diff-Review) nicht mehr von sich aus. Beide laufen jetzt ausschließlich, wenn man sie ausdrücklich aufruft.
- **Einsatz:** `/verify` bzw. `/code-review` selbst im Prompt aufrufen, wenn gewünscht.
- **Mehrwert:** Weniger ungefragte, token- und zeitintensive Automatik-Läufe mitten in der Arbeit — die beiden schweren Skills feuern nur noch bewusst auf Anforderung, was Kontrolle und Vorhersehbarkeit erhöht.
- **Version:** v2.1.215

---

### Woche 29 (18. Juli 2026) — v2.1.214

---

### [EndConversation-Tool gegen Missbrauch/Jailbreaks]
- **Was:** Neues internes Tool `EndConversation`, mit dem Claude eine Konversation bei stark missbräuchlichem Verhalten oder wiederholten Jailbreak-Versuchen aktiv beenden kann.
- **Einsatz:** Automatisch aktiv (modellseitig ausgelöst)
- **Mehrwert:** Gibt dem Agenten einen sauberen Ausstieg aus eskalierenden oder feindseligen Konversationen, statt sich weiter manipulieren zu lassen — relevant vor allem für öffentlich oder automatisiert betriebene Bots.
- **Version:** v2.1.214

### [Fortschritts-Heartbeat für lang laufende Tool-Calls]
- **Was:** Lang laufende Tool-Calls, die bislang komplett still wurden, senden jetzt einen periodischen Fortschritts-Heartbeat.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Ein langer Lauf sieht nicht mehr „eingefroren" aus — man erkennt, dass noch etwas passiert (ergänzt den Live-Countdown aus v2.1.210).
- **Version:** v2.1.214

### [Sicherheits- & Permission-Härtung v2.1.214]
- **Was:** Umfangreiche Härtung der Berechtigungsprüfungen und Bugfixes, u. a.: single-segment `dir/**`-Allow-Regeln genehmigten fälschlich Writes in verschachtelte Verzeichnisse überall im Baum statt nur `<cwd>/dir` (gilt gleichermaßen für Hook-`if:`-Bedingungen); Permission-Check-Bypass unter Windows PowerShell 5.1; Bash-Checks scheitern jetzt korrekt bei File-Descriptor-Redirect-Formen, die bash anders parst als der Permission-Analyzer; Befehle über 10.000 Zeichen verlangen jetzt Freigabe statt automatisch zu laufen; falsch bewertete zsh-Variablen-Subscripts/-Modifier in `[[ ]]`; bestimmte `help`/`man`-Befehle mit unsicheren Optionen; `docker`-Befehle mit Daemon-Redirect-Flags sowie `file` mit `-m`/`--magic-file` bzw. `-f`/`--files-from` verlangen jetzt Freigabe; verhindert, dass `pkill -f` die eigene CLI-Session auf Linux killt; Settings-Dateien über 2 MiB scheitern jetzt beim Start (gegen unbegrenztes Speicherwachstum). Dazu viele Windows/PowerShell-Fixes (UTF-16LE-Writes bei `>`/`>>`, UnicodeDecode/Encode-Crashes bei Python-Scripts, hängende Commands bei stdin-wartenden Kindprozessen, Streaming „Socket is closed" hinter Corporate-Proxies), Background-Session-Fixes (nicht mehr löschbare/geparkte Sessions, Daemon-Socket-Race beim Shutdown), `/ultrareview` läuft jetzt auch in Repos ohne Merge-Base, per `--settings`-Flag aktivierte Plugins laden wieder, `claude update`/`claude doctor` hängen nicht mehr still, sowie neue Telemetrie (`message.uuid`, `client_request_id`, `tool_source` in OTel-Logs, `CLAUDE_CODE_OTEL_CONTENT_MAX_LENGTH`), ISO-`modified`-Zeitstempel im Memory-Frontmatter und Reasoning-Effort im `subagentStatusLine`-Payload.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Vor allem mehrere geschlossene Wege, auf denen Berechtigungsprüfungen umgangen werden konnten (verschachtelte `dir/**`-Writes, Windows-PS-5.1-Bypass, überlange Bash-Befehle, `docker`/`file`-Flags) — spürbar verlässlicheres Permission-System, plus stabilere Windows- und Background-Sessions.
- **Version:** v2.1.214

> Hinweis: **v2.1.213 wurde übersprungen** — es existiert kein GitHub-Release-Tag und kein CHANGELOG-Eintrag; die Versionsfolge geht direkt von v2.1.212 auf v2.1.214.

---

### Woche 29 (13.–17. Juli 2026) — What's-New-Digest veröffentlicht

---

### [Artifacts rufen MCP-Connectors auf (Live-Daten in veröffentlichten Artifacts)]
- **Was:** Ein veröffentlichtes Artifact kann jetzt bei jedem Aufruf MCP-Connectors ansprechen — ein Dashboard zeigt also Live-Daten und kann Aktionen on-demand ausführen, statt nur einen Snapshot aus der Erstellungs-Session. Jeder Call läuft über die eigenen Verbindungen des Betrachtenden; Betrachter bestätigen den Zugriff vor dem ersten Connector-Call der Seite. Ergänzend neu: öffentliche Share-Links, Editor-Rollen für gemeinsames Bearbeiten auf Team/Enterprise und Artifacts, die aus Claude-Tag-Sessions erstellt werden.
- **Einsatz:** Connector und gewünschte Daten im Prompt benennen, z. B. „Build a dashboard artifact of open pull requests that pulls the live list through my GitHub connector when the page loads."
- **Mehrwert:** Aus einem statischen Session-Output wird eine lebende, teilbare Seite: jeder Betrachter sieht mit seinen eigenen Connectors aktuelle Daten (z. B. offene PRs, Tickets) — ohne die Artifact-Session erneut laufen zu lassen.
- **Version:** What's-New Week 29 (13.–17.07.2026)

---

### Woche 29 (17. Juli 2026) — v2.1.212

---

### [`/fork`: Konversation in neue Background-Session kopieren]
- **Was:** `/fork` kopiert die aktuelle Konversation in eine neue Background-Session, während die laufende Arbeit unangetastet weiterläuft.
- **Einsatz:** `/fork` im Prompt aufrufen
- **Mehrwert:** Man kann von einem gemeinsamen Kontext-Stand aus mehrere Varianten parallel ausprobieren (z. B. zwei Lösungsansätze), ohne die ursprüngliche Session zu verlieren oder den Kontext neu aufbauen zu müssen.
- **Version:** v2.1.212

### [`/subtask`: Subagents in der Session starten]
- **Was:** Neuer Befehl `/subtask`, der das bisherige In-Session-Starten von Subagents ersetzt.
- **Einsatz:** `/subtask …` im Prompt
- **Mehrwert:** Klarer, expliziter Weg, um innerhalb einer Session eine abgegrenzte Teilaufgabe an einen Subagent zu delegieren.
- **Version:** v2.1.212

### [`claude auto-mode reset`]
- **Was:** Neuer CLI-Befehl, der die Auto-Mode-Konfiguration/-Lernzustände mit Bestätigungsabfrage zurücksetzt; mit `--yes` wird die Rückfrage übersprungen.
- **Einsatz:** `claude auto-mode reset` (bzw. `claude auto-mode reset --yes`)
- **Mehrwert:** Wenn der Auto-Mode-Classifier durch angesammelte Entscheidungen „verlernt" hat oder man sauber neu starten will, lässt er sich gezielt zurücksetzen, statt Configs von Hand zu editieren.
- **Version:** v2.1.212

### [Session-weites WebSearch-Limit]
- **Was:** Die Anzahl der WebSearch-Tool-Calls pro Session ist jetzt gedeckelt (Default 200) und über eine Environment-Variable einstellbar.
- **Einsatz:** `CLAUDE_CODE_MAX_WEB_SEARCHES_PER_SESSION=<n>`
- **Mehrwert:** Schutz vor Endlos-/Runaway-Suchschleifen (Kosten und Laufzeit), z. B. in autonomen Läufen — mit definierter Obergrenze statt unbegrenzter Websuche.
- **Version:** v2.1.212

### [Subagent-Spawn-Cap pro Session]
- **Was:** Pro Session lassen sich nur noch begrenzt viele Subagents starten (Default 200), einstellbar per Environment-Variable.
- **Einsatz:** `CLAUDE_CODE_MAX_SUBAGENTS_PER_SESSION=<n>`
- **Mehrwert:** Verhindert, dass eine fehlgeleitete oder rekursive Automatik unbegrenzt Subagents spawnt und Ressourcen/Kosten explodieren lässt.
- **Version:** v2.1.212

### [Auto-Backgrounding langer MCP-Tool-Calls]
- **Was:** MCP-Tool-Calls, die länger als 2 Minuten laufen, werden jetzt automatisch in den Hintergrund verschoben; die Schwelle ist konfigurierbar.
- **Einsatz:** Automatisch aktiv; Schwelle via `CLAUDE_CODE_MCP_AUTO_BACKGROUND_MS=<ms>`
- **Mehrwert:** Ein langsamer MCP-Call blockiert nicht mehr die ganze Session — Claude kann weiterarbeiten, während der Call im Hintergrund zu Ende läuft.
- **Version:** v2.1.212

### [`/resume`-Picker inkl. gelöschter Sessions]
- **Was:** Der `/resume`-Befehl öffnet jetzt einen Picker über vergangene Sessions, der auch gelöschte Sessions mit einschließt.
- **Einsatz:** `/resume`
- **Mehrwert:** Versehentlich gelöschte oder aufgeräumte Sessions lassen sich wiederfinden und fortsetzen, statt endgültig verloren zu sein.
- **Version:** v2.1.212

### [Bugfix-Sammlung v2.1.212]
- **Was:** Umfangreiche Fehlerbehebungen, u. a.: Plan-Mode führte dateiändernde Bash-Befehle ohne Freigabe aus; Worktree-Erstellung folgte Symlinks unter `.claude/worktrees`; ein `continue:false`-Hook-Stopp ging bei einem Tool-Fehler verloren; SIGTERM verwaiste Bash-Prozessbäume im Print-/SDK-Modus; `/background` und `--bg` scheiterten unter Windows, wenn Group Policy PowerShell 5.1 blockierte; Shell-Modus (`!`) mit Datei-Pfad-Autocomplete-Popup; `/ultrareview` lehnte PR-Referenzen ab und holte keine Remote-Branches; Hosted-Sessions scheiterten mit mTLS-Zertifikaten/OAuth-Scopes; Datei-Edit-„not read yet"-Fehler nach Session-Resume; `ExitWorktree`-Fehler nach Resume; Background-Sessions verloren bei Schreibfehler ihren Live-Parent-Schutz; doppelte Idle-Notifications in Agent-Teams; Plan-Freigabe-Dialog-Fußzeile brach bei langen Pfaden um; Diff-Vorschauen verloren Zeilennummern in schmalen Layouts; Konversationen mit vielen Bildern scheiterten mit „Request too large"; WebSearch/-Fetch lieferte „API Error" unter Last. **Verbesserungen/Sonstiges:** besseres Prompt-Caching hinter LLM-Gateways; der `mode`-Parameter des Task-Tools ist deprecated; Session-Transkripte protokollieren jetzt das Reasoning-Effort-Level; Enterprise-`forceLoginMethod` wird jetzt auch für VS Code, SDK und Auth-Logins erzwungen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Vor allem eine geschlossene Sicherheitslücke im Plan-Mode (keine ungefragten dateiändernden Befehle mehr), verlässlicheres `/ultrareview` mit PR-Referenzen, saubere Session-Resumes (Edit/Worktree) und stabilere Background-/Hosted-Sessions.
- **Version:** v2.1.212

---

### Platform Release Notes (15. Juli 2026)

---

### [Mid-Conversation-System-Messages auf Fable 5, Mythos 5 & Opus 4.8]
- **Was:** System-Nachrichten mitten im Gespräch (mid-conversation `system`-Rolle) sind jetzt für Claude Fable 5, Claude Mythos 5 und Claude Opus 4.8 verfügbar — über die Claude API, Claude in Amazon Bedrock und Google Cloud (Vertex AI). Ein Beta-Header ist **nicht** erforderlich. Der Eintrag korrigiert ausdrücklich frühere Verfügbarkeitshinweise.
- **Einsatz:** Mid-Conversation-`system`-Messages im Request verwenden (Doku: `/docs/en/build-with-claude/mid-conversation-system-messages`); kein `anthropic-beta`-Header nötig.
- **Mehrwert:** Man kann laufende Konversationen mit zusätzlichen System-Anweisungen nachsteuern (z. B. geänderte Regeln oder Kontext einschieben), ohne die Konversation neu aufzusetzen — und das jetzt provider-übergreifend (API, Bedrock, Vertex) auf den aktuellen Modellen ohne Beta-Flag.
- **Version:** Platform Release Notes, 15.07.2026

---

### Woche 29 (15. Juli 2026) — v2.1.211

---

### [`--forward-subagent-text`: Subagent-Text in die stream-json-Ausgabe durchreichen]
- **Was:** Neues Flag bzw. Environment-Variable, das den Text laufender Subagents in die `stream-json`-Ausgabe eines Headless-/SDK-Laufs mit aufnimmt.
- **Einsatz:** `claude -p --output-format stream-json --forward-subagent-text …` (oder die zugehörige Env-Variable setzen)
- **Mehrwert:** Wer Claude Code programmatisch fährt und mehrere Subagents nutzt, sieht deren Zwischenausgaben jetzt im Stream, statt nur das Endergebnis des Haupt-Agents zu bekommen — hilfreich für Live-Logging und Fortschrittsanzeigen in eigenen Tools.
- **Version:** v2.1.211

### [Bugfix-Sammlung v2.1.211]
- **Was:** Mehrere Fehlerbehebungen, u. a.: Der Auto-Mode überschrieb `ask`-Entscheidungen von `PreToolUse`-Hooks (die Hook-Rückfrage wird jetzt respektiert); die Permission-Preview neutralisiert jetzt Steuerzeichen, damit sie in Chat-Channels sauber dargestellt wird; Logout-Probleme bei parallel laufenden Sessions nach einem Wake-from-Sleep; per Plugin bereitgestellte MCP-Server verbanden sich nach längerer Inaktivität einer Web-Session nicht neu; ein in einem Subagent gesetztes Modell-Override kippte beim Resume der Session wieder zurück; dazu mehrere File-Upload- und UI-Fixes.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Vor allem verlässlichere Hook-gesteuerte Berechtigungen (Auto-Mode übergeht `ask`-Hooks nicht mehr), stabilere Parallel- und Web-Sessions sowie korrekt beibehaltene Subagent-Modelle über einen Resume hinweg.
- **Version:** v2.1.211

---

### Woche 29 (14. Juli 2026) — v2.1.210

---

### [Live-Countdown bei lang laufenden Tool-Calls]
- **Was:** Die eingeklappte Tool-Zusammenfassungszeile zeigt jetzt einen mitlaufenden Zähler der verstrichenen Zeit, solange ein Tool-Call läuft.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Man sieht auf einen Blick, wie lange ein langer Bash-Lauf, Test oder MCP-Call schon dauert, ohne die Ausgabe aufklappen zu müssen.
- **Version:** v2.1.210

### [Startup-Warnung für unwirksame Permission-Regeln]
- **Was:** Beim Start warnt Claude Code jetzt vor Permission-Regeln der Form `Write(path)`, `NotebookEdit(path)` und `Glob(path)` — diese Tools matchen nicht auf Pfad-Argumente; gemeint ist meist `Edit(path)` bzw. `Read(path)`.
- **Einsatz:** Automatisch aktiv (Hinweis beim Start); Regeln entsprechend korrigieren.
- **Mehrwert:** Eine häufige stille Fehlkonfiguration — eine Deny-/Ask-Regel, die nie greift, weil das Tool gar nicht auf Pfade matcht — wird jetzt sichtbar, statt ein falsches Sicherheitsgefühl zu geben.
- **Version:** v2.1.210

### [Auto-Mode-Classifier defaultet auf Sonnet 5]
- **Was:** Der Permission-Classifier des Auto-Mode nutzt jetzt standardmäßig Claude Sonnet 5 und wird beim ersten Request validiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schnellere und günstigere Klassifizierung der Berechtigungs-Entscheidungen im Auto-Mode bei gleichbleibender Qualität.
- **Version:** v2.1.210

### [Agent-Tool gegen indirekte Prompt-Injection gehärtet]
- **Was:** Das Agent-Tool wurde gegen indirekte Prompt-Injection gehärtet; zudem feuert das `ultracode`-Opt-in nicht mehr bei nicht-menschlich stammendem Input (Webhook-Payloads, weitergeleitete PR-Kommentare).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Fremde Inhalte, die über Subagents oder relayte Kommentare einfließen, können nicht mehr so leicht die Kontrolle über den Agent oder teure `ultracode`-Läufe an sich reißen.
- **Version:** v2.1.210

### [Memory-Writes über Limit werfen expliziten Fehler]
- **Was:** Überschreitet ein Memory-Write die Größengrenze, gibt es jetzt einen expliziten Fehler statt einer stillen Kürzung des Inhalts.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verlorene bzw. abgeschnittene Memory-Inhalte fallen sofort auf, statt später als unerklärlich fehlende Fakten aufzutauchen.
- **Version:** v2.1.210

### [Bugfix-Sammlung v2.1.210]
- **Was:** Umfangreiche Fehlerbehebungen, u. a.: `isolation: 'worktree'`-Subagents führten git-mutierende Befehle gegen das Haupt-Repo-Checkout statt gegen ihren isolierten Worktree aus; ein gerendertes Text-Fragment leckte in die Crash-Telemetrie; Paste-Marker (È/É-Zeichen um eingefügten Text) leckten in externe Editoren; `claude attach`-Session-Übergangsfehler („job not found", „agent is still starting"); Session-Crash, wenn ein Tool-Result-Renderer ein numerisches bigint oder Plain-Text zurückgab; ein Hook-Callback-Timeout wurde als User-Ablehnung fehlgemeldet; Claude nahm an, ein `cd` habe gegriffen, nachdem der Befehl in den Hintergrund verschoben wurde; per Plugin bereitgestellte MCP-Server wurden beim MCP-Re-Sync abgebaut; als „(edited by user)" markierte Plan-Freigaben überschrieben veraltete Snapshots; `/doctor` übersprang den Auto-Mode-Vorschlag auf Bedrock/Vertex/Foundry; Grep-Content-Modus meldete „No matches found" bei Pagination über Treffer hinaus; nicht gematchte `$1`/`$2`-Positions-Platzhalter wurden still entfernt; Plugin-Cache-Writes hinterließen Temp-Dateien und scheiterten an gesperrten Datei-Renames; Background-Worker gerieten bei Connection-Reset in eine Crash-Schleife; `claude agents --effort ultracode` erreichte die dispatchten Sessions nicht; die Agent-View hielt eingefügte Bilder aus verworfenen Entwürfen fest; getötete Background-Sessions hinterließen einen dauerhaften `git worktree lock`; SDK-MCP-Server verbanden sich erst im nächsten Turn. **Verbesserungen:** Chart-Farb-Validierung des gebündelten `dataviz`-Skills nutzt jetzt OKLab; Screenreader-Modus kündigt Wechsel des Berechtigungsmodus an; die Agents-Fußzeile zeigt die Anzahl der Background-Agents, die auf Eingabe warten.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Vor allem sicherere Worktree-Isolation (kein versehentliches Mutieren des Haupt-Checkouts mehr), stabilere Background-Worker und `claude attach`, sowie sauberere Copy-&-Paste- und Hook-Behandlung.
- **Version:** v2.1.210

---

### Platform Release Notes (14. Juli 2026)

---

### [Admin API für Claude-Enterprise-User-Management]
- **Was:** Die Mitglieder einer **Claude-Enterprise**-Organisation (claude.ai) lassen sich jetzt per Admin API verwalten (Beta für alle Claude-Enterprise-Orgs): Mitglieder auflisten und per E-Mail-Adresse nachschlagen, Rolle ändern, Mitglieder entfernen, Einladungen senden und zurückziehen, Gruppen und deren Mitgliedschaften verwalten sowie Custom Roles lesen.
- **Einsatz:** Admin-API-Endpunkte unter `/docs/en/api/admin`; Gruppen- und Custom-Role-Requests brauchen den Beta-Header `anthropic-beta: ce-user-management-2026-07-13`, Member-/Invite-Requests keinen Header. Ein Admin-API-Key mit dem Scope `read:org_audit` kann alle `GET`-Endpunkte des User-Managements aufrufen.
- **Mehrwert:** Onboarding/Offboarding, Rollen- und Gruppenpflege einer Enterprise-Org lassen sich automatisieren und aus Skripten/IdP-Workflows steuern, statt alles manuell in der Konsole zu klicken.
- **Version:** Platform Release Notes, 14.07.2026

---

### Woche 29 (14. Juli 2026) — v2.1.209

---

### [Fix: Dialoge in Background-Sessions wieder bedienbar]
- **Was:** In `claude agents`-Background-Sessions wurden `/model` und andere Dialoge blockiert — ein in v2.1.208 eingeführter Schutz griff zu breit und ist jetzt zurückgenommen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Wer Background-Sessions über die Agent-View fährt, kann darin wieder das Modell wechseln und andere Dialoge bedienen, statt die Session neu starten zu müssen.
- **Version:** v2.1.209

---

### Woche 29 (14. Juli 2026) — v2.1.208

---

### [Screenreader-Modus (`--ax-screen-reader`)]
- **Was:** Ein Opt-in-Modus, der die Oberfläche als reinen Text rendert (statt mit Boxen, Spinnern und Alt-Screen-Grafik), damit Screenreader sie sauber vorlesen können.
- **Einsatz:** `claude --ax-screen-reader`, `CLAUDE_AX_SCREEN_READER=1` oder `"axScreenReader": true` in den Settings
- **Mehrwert:** Claude Code wird für blinde und sehbehinderte Entwickler tatsächlich benutzbar — die dynamische TUI war für Screenreader bisher weitgehend undurchdringlich.
- **Version:** v2.1.208

### [`vimInsertModeRemaps`: Zwei-Tasten-Sequenzen im Vim-Modus]
- **Was:** Neue Einstellung, mit der sich im Vim-Modus Zwei-Tasten-Sequenzen im Insert-Modus auf andere Tasten legen lassen — klassisch `jj` → Escape.
- **Einsatz:** `"vimInsertModeRemaps": { "jj": "Escape" }` in den Settings
- **Mehrwert:** Wer die `jj`-Escape-Gewohnheit aus seinem Editor mitbringt, muss sie im Claude-Code-Prompt nicht mehr ablegen.
- **Version:** v2.1.208

### [`CLAUDE_CODE_PROCESS_WRAPPER` für Corporate-Launcher]
- **Was:** Agent-View und der Background-Service starten jede eigene Claude-Code-Unterprozess-Abzweigung über ein vorgeschriebenes Wrapper-Executable, wenn diese Variable gesetzt ist.
- **Einsatz:** `CLAUDE_CODE_PROCESS_WRAPPER=/pfad/zum/launcher` setzen (typischerweise über Managed Settings)
- **Mehrwert:** In Unternehmen, die alle Prozesse über einen eigenen Launcher (EDR, Sandbox, Lizenz-Wrapper) starten müssen, laufen jetzt auch die selbst gespawnten Background-Sessions durch diesen Pfad — vorher fielen sie aus der Policy heraus.
- **Version:** v2.1.208

### [Maus-Klicks in Multi-Select-Menüs]
- **Was:** Im Vollbildmodus lassen sich Multi-Select-Menüs und „Other"-Eingabezeilen jetzt per Mausklick bedienen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Pfeiltasten-Gehacke bei längeren Auswahllisten.
- **Version:** v2.1.208

### [Performance: deutlich weniger CPU, Speicher und Transkript-Größe]
- **Was:** Eine große Optimierungs-Runde: Der CPU-Overhead pro Tool-Call in Print-/SDK-Sessions mit vielen MCP-Tools sinkt drastisch (bis zu 7× schnellere Tool-Runden bei hoher Tool-Anzahl, da der Tool-Pool jetzt gecacht wird); der Edit-Read-Cache ist auf 16 MB gedeckelt statt bis zu 1.000 komplette Dateien zu halten; die Session-Transkript-Größe schrumpft in Edit-lastigen Sessions um bis zu 79× (überholte File-History-Backups werden gepruned, Checkpoint-Plattenplatz gedeckelt); Permission-Regel-Matcher werden einmalig kompiliert und gecacht (behebt Mehrsekunden-Verzögerungen pro Turn bei vielen Deny/Ask-Regeln); mehrere Memory-Leaks in langen Sessions sind behoben (MCP-stdio-stderr bis 64 MB pro Server, dauerhaft offene LSP-Dokumente → jetzt LRU mit 50-Dokument-Cap, zurückgehaltene Async-Hook-Ausgaben, unbegrenztes Wachstum durch große Tool-Result-Payloads in Headless-/SDK-Sessions, gehaltene Paste-Bilder in der Agent-View).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange Sessions und Setups mit vielen MCP-Servern oder umfangreichen Permission-Regeln bleiben spürbar flüssig, fressen weniger RAM und produzieren erheblich kleinere Transkript-Dateien auf der Platte.
- **Version:** v2.1.208

### [Bugfix-Sammlung v2.1.208]
- **Was:** Umfangreiche Fehlerbehebungen, u. a.: Der Fast-Mode blieb nach dem Wechsel zurück auf ein unterstützendes Modell aus (stellt sich jetzt automatisch wieder her); an einen Background-Agent getippte Antworten gingen bei fehlgeschlagener Zustellung verloren (werden jetzt gespeichert und beim Neustart zugestellt); das Anhängen an Background-Sessions scheiterte dauerhaft („Couldn't start the background daemon"), wenn ein Update das Binary ersetzt hatte, aus dem ein laufender `claude agents`-Prozess gestartet war; das Kontextfenster (und die Auto-Compact-Anzeige) sprang nach einem Auto-Update kurz auf 200k zurück und meldete beim Resume langer Sessions fälschlich „100 % Kontext verbraucht"; supervised und Background-Sessions stürzten ab, wenn ein Server eine HTTP/2-Verbindung mit GOAWAY schloss, während Requests unterwegs waren; abgeschnittene `stream-json`-Ausgabe beim Piping großer Antworten aus `claude -p`; `CLAUDE_CODE_MAX_OUTPUT_TOKENS` & Co. nutzten still die Mantisse von Werten in wissenschaftlicher Notation (`1e6` wurde zu `1`); sehr große Markdown-Tabellen blockierten das Rendering (ab 200 Zeilen jetzt „… N more rows"); Tool-Fixes bei Edit (Datei nach dem Lesen geändert, Zieltext aber weiterhin eindeutig), Read („shorter than offset" bei leeren Dateien), Grep (stilles „No files found" bei ungültiger Regex, zu niedrige Count-Summen bei Pagination) und Glob (Null-Byte im Pfad); `apiKeyHelper`-Skriptfehler versteckten sich hinter einem generischen 401 nach ~10 stillen Retries (jetzt echter Fehler binnen 3 Versuchen); irreführendes „Truncated event message received" bei Bedrock hinter einem transformierenden Gateway (nennt jetzt Content-Type und Proxy); `/release-notes` schob die angesehenen Notes in den Modell-Kontext („Show all" injizierte das gesamte Changelog in jeden Folge-Request); der Agent-Tool startete ohne Tools, wenn die `tools`-Liste eines Subagents ins Leere lief (jetzt klarer Fehler mit den unbekannten Einträgen); `/usage` zeigte veraltete Balken über frischeren Daten bzw. einen Fehlerbildschirm bei Rate-Limit (jetzt letzter Stand mit „as of"-Hinweis); katastrophale Löschungen (`rm -rf ~`) in Befehlen mit `$(…)`/Backticks/`<(…)` fragen jetzt auch unter `--dangerously-skip-permissions` und im Auto-Mode nach; fertige Background-Agents verschwanden sofort aus `/tasks`; `Ctrl+X` in der Agent-View zerstört keine ungepushten Commits mehr und löscht auch umbenannte Branch-Worktrees; ein älterer Daemon startete Worker einer neueren Version nicht mehr still auf dem alten Binary neu; sowie ein Bedrock-Auth-Fix für AWS-SSO-Profile, deren `sso_region` von der Bedrock-Region abweicht (Regression aus 2.1.207).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Vor allem stabilere Background-Sessions über Updates hinweg, verlässlichere Headless-/SDK-Läufe und ein Ende der falschen „Kontext voll"-Warnung nach Auto-Updates.
- **Version:** v2.1.208

---

### Platform Release Notes (10. Juli 2026)

---

### [Dreams unterstützt Claude Fable 5 und Claude Sonnet 5]
- **Was:** Die Managed-Agents-Funktion „Dreams" (Research Preview) läuft jetzt auch auf Claude Fable 5 und Claude Sonnet 5 — bislang war die Modellauswahl enger gefasst.
- **Einsatz:** Modell in der Dreams-Konfiguration wählen (Doku: `platform.claude.com/docs/en/managed-agents/dreams#limits`)
- **Mehrwert:** Dreams-Läufe lassen sich auf ein günstigeres bzw. auf das neue Sonnet-5-Modell mit 1M-Kontext legen, statt an ein einzelnes Modell gebunden zu sein.
- **Version:** Platform Release Notes, 10.07.2026

---

### Woche 28 (11. Juli 2026) — v2.1.207

---

### [Auto-Mode auf Bedrock, Vertex AI und Foundry ohne Opt-in]
- **Was:** Der Auto-Mode steht auf Amazon Bedrock, Google Vertex AI und Microsoft Foundry jetzt ohne die Umgebungsvariable `CLAUDE_CODE_ENABLE_AUTO_MODE` zur Verfügung. Abschalten lässt er sich über die Einstellung `disableAutoMode`.
- **Einsatz:** Automatisch aktiv; deaktivieren via `"disableAutoMode": true` in den Settings.
- **Mehrwert:** Wer Claude Code über einen der drei Cloud-Provider betreibt, bekommt den Auto-Mode (Classifier statt Berechtigungs-Prompts) ohne Extra-Konfiguration — ein Reibungspunkt weniger in Enterprise-Setups.
- **Version:** v2.1.207

### [Bedrock, Vertex und Claude Platform on AWS nutzen standardmäßig Opus 4.8]
- **Was:** Auf Bedrock, Vertex und Claude Platform on AWS ist Claude Opus 4.8 jetzt das Standardmodell.
- **Einsatz:** Automatisch aktiv (bzw. `/model` zum Abweichen)
- **Mehrwert:** Ohne manuelle Modellwahl läuft man auf den Cloud-Providern direkt auf dem aktuellen Top-Modell statt auf einem älteren Default.
- **Version:** v2.1.207

### [Auto-Mode liest `autoMode` nicht mehr aus repo-lokalen Settings]
- **Was:** Der Auto-Mode wertet die Einstellung `autoMode` nicht mehr aus `.claude/settings.local.json` (also aus dem Repo) aus — sie muss in `~/.claude/settings.json` stehen. Analog werden Plugin-Optionswerte (`pluginConfigs`) nicht mehr aus projektweiten `.claude/settings.json` gelesen; nur User-Settings, `--settings` und Managed Settings zählen.
- **Einsatz:** `autoMode` nach `~/.claude/settings.json` verschieben; Plugin-Optionen ebenfalls auf User-/Managed-Ebene setzen.
- **Mehrwert:** Ein geklontes Repo kann nicht mehr per eingecheckter Settings-Datei den Auto-Mode oder Plugin-Optionen der eigenen Session umbiegen — deutlich kleinerer Angriffs-/Überraschungsradius bei fremdem Code.
- **Version:** v2.1.207

### [Plugin-Hooks: `${user_config.*}` in Shell-Kommandos abgelehnt (Shell-Injection-Fix)]
- **Was:** In Shell-Form-Kommandos von Plugin-Hooks, Monitors und dem MCP-`headersHelper` wird `${user_config.*}` jetzt zurückgewiesen — es war ein Shell-Injection-Vektor. Hooks nutzen stattdessen die Exec-Form (`args`-Array) oder `$CLAUDE_PLUGIN_OPTION_<KEY>`; Monitors und `headersHelper` lesen den Wert im Skript (Config-Datei oder `env`-Block des Servers).
- **Einsatz:** Betroffene Plugin-Hooks auf `args`-Array bzw. `$CLAUDE_PLUGIN_OPTION_<KEY>` umstellen.
- **Mehrwert:** Ein Plugin-Konfigurationswert kann nicht mehr als Shell-Code ausgeführt werden — wichtiger Härtungsschritt für alle, die fremde Plugins installieren.
- **Version:** v2.1.207

### [Terminal friert bei langen Streaming-Antworten nicht mehr ein]
- **Was:** Beim Streamen sehr langer Listen, Tabellen, Absätze oder Code-Blöcke fror das Terminal ein und Tastatureingaben hingen hinterher — behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange Antworten (große Refactorings, ausführliche Reviews) blockieren die Eingabe nicht mehr — man kann während des Streamens weitertippen oder abbrechen.
- **Version:** v2.1.207

### [Bugfix-Sammlung v2.1.207]
- **Was:** Umfangreiche Fehlerbehebungen, u. a.: Remote Managed Settings aus einem nicht-interaktiven Lauf (`claude -p`, SDK) wurden dauerhaft als „zugestimmt" verbucht, ohne dass je der Security-Consent-Dialog erschien — behoben; harmlose systemgenerierte Konversations-Updates lösten falsche Prompt-Injection-Warnungen aus; der Auto-Updater überschrieb bei jedem Release ein eigenes Launcher-Skript bzw. einen Symlink unter `~/.local/bin/claude` (`/doctor` meldet einen extern verwalteten Launcher jetzt); zusammengesetzte Befehle mit `cd` fragten nach einer Berechtigung, obwohl die einzige Ausgabe-Umleitung nach `/dev/null` ging; das Transcript sprang nach Ende des Streamings über den Anfang der Antwort hinaus; `extensions.worktreeConfig` blieb nach Entfernen des letzten `worktree.sparsePaths`-Worktrees in der `.git/config` zurück (brach go-git-Tools wie `tea`); fehlerhafte Bracket-Muster in Rules-Globs, Skill-Pfaden, `.ignore` und `.worktreeinclude` zerschossen Datei-Lesevorgänge, Datei-Vorschläge und Worktree-Erstellung; eine fehlerhafte Teammate-Mailbox-Nachricht trieb Agent-Teams in eine Crash-Schleife im Sekundentakt, bis die Mailbox-Datei von Hand gelöscht wurde; per Plan-Annahme automatisch benannte Background-Sessions zeigten den Namen nicht in ihrer Agent-View-Zeile; Background-Sessions, die einen Git-Worktree betreten hatten, kamen nach einem Cold-Reopen aus der Agent-Liste leer zurück; Remote-Control-Task-Status gingen bei Netzunterbrechung/Credential-Refresh verloren; vom Desktop-App gehostete Remote-Control-Sessions zeigten auf Mobile/Web keinen Background-Agent-/Workflow-Fortschritt; Deep-Research-Läufe beschrifteten jeden Fetch-Phase-Agent mit „unknown" (jetzt Quell-Hostname); Bedrock forderte bei jedem API-Request frische AWS-SSO-Credentials vom IAM Identity Center an; unter Windows hing Claude unbegrenzt, wenn die AWS-Credential-Auflösung stockte (z. B. hängender `credential_process`) — der 60-Sekunden-Stall-Guard greift jetzt; `/usage-credits` schnitt fehlerhafte Beträge (z. B. ein eingefügter Zeitstempel) still auf Ziffern zurecht — sie werden jetzt abgelehnt, und Beträge über 1.000 $ verlangen eine getippte Bestätigung. **Verbesserungen an der Agent-View:** erneutes Einfügen desselben Textes klappt den `[Pasted text #N]`-Platzhalter auf, statt einen zweiten anzulegen; Peeks blockierter Sessions beginnen mit der Rückfrage und zeigen eine ausformulierte Wartezeit (`waiting 3m`) statt zweimal denselben Zeitstempel.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sicherere Consent-Behandlung im Headless-/SDK-Betrieb, stabilere Worktree- und Background-Sessions, verlässlichere AWS-/Bedrock-Anbindung und weniger Fehlalarme bei Prompt-Injection-Warnungen.
- **Version:** v2.1.207

---

### What's-New-Digest Woche 28 (6.–10. Juli 2026)

---

### [Eingebauter Browser in der Desktop-App]
- **Was:** Claude Code auf dem Desktop hat jetzt einen eingebauten Browser. Claude kann darin Dokumentationen, Designs oder beliebige Websites öffnen und mit den Seiten interagieren (lesen, klicken) — genau wie bisher schon mit der Vorschau des lokalen Dev-Servers. Der Browser ist sandboxed und konfigurierbar: Man entscheidet, ob Browsing-Sessions persistiert werden, und Safety-Classifier prüfen Aktionen auf externen Seiten.
- **Einsatz:** Claude Code Desktop-App → Browser-Pane („Browse external sites", Doku: `/docs/en/desktop#browse-external-sites`)
- **Mehrwert:** Claude kann selbst nachschlagen und ausprobieren, ohne dass man Inhalte manuell hineinkopiert oder eine separate Browser-Integration (Chrome-Extension) aufsetzt — Recherche und UI-Verifikation laufen direkt in der App. (Ergänzt den bereits in v2.1.205 reservierten MCP-Namen „Claude Browser".)
- **Version:** What's-New Woche 28 (Desktop-App, kein CLI-Release)

---

### What's-New-Digest Woche 27 (29. Juni – 3. Juli 2026)

---

### [Claude Desktop für Linux (Beta)]
- **Was:** Die Claude-Desktop-App gibt es jetzt als Beta für Ubuntu 22.04+ und Debian 12+ (x86_64 und arm64). Sie bietet dieselbe Chat-, Cowork- und Claude-Code-Erfahrung wie unter macOS und Windows: parallele Sessions, visuelles Diff-Review, integriertes Terminal und Editor sowie Live-App-Vorschau. Die Installation läuft über Anthropics apt-Repository, Updates kommen damit über die normale Paketverwaltung.
- **Einsatz:** Installation aus Anthropics apt-Repository (Doku: `/docs/en/desktop-linux`)
- **Mehrwert:** Linux-Entwickler bekommen endlich die volle Desktop-Erfahrung (inkl. Cowork und paralleler Sessions) statt nur der CLI — und die Updates laufen über `apt`, ohne eigenen Update-Mechanismus.
- **Version:** What's-New Woche 27 (Desktop-App, kein CLI-Release)

### [`/radio`: Claude-FM-Lo-Fi-Stream]
- **Was:** `/radio` öffnet den Lo-Fi-Radiostream „Claude FM" im Browser; ist kein Browser verfügbar, wird die Stream-URL ausgegeben. Nicht verfügbar auf Amazon Bedrock, Google Cloud's Agent Platform und Microsoft Foundry.
- **Einsatz:** `/radio`
- **Mehrwert:** Hintergrundmusik zum Coden direkt aus der Session — nett, aber kein Produktivitäts-Feature.
- **Version:** What's-New Woche 27 (CLI)

---

### Platform Release Notes — 10. Juli 2026

---

### [Access Transparency: erweiterte `cmek_preserve`-Dokumentation]
- **Was:** Die Dokumentation der **Access Transparency**-`cmek_preserve`-Events wurde erweitert: Sie enthält jetzt ein Filter-Beispiel, ein Beispiel-Event-Payload sowie zwei Aufbewahrungs-Gründe (`policy_violation_investigation`, `csae_report`). Klargestellt wird zudem, dass ein Preservation-Event geschrieben wird, egal ob die Aufbewahrung von einem menschlichen Reviewer oder einer automatisierten Safety-Pipeline ausgelöst wurde.
- **Einsatz:** Doku unter „CMEK content preservation" in der Access-Transparency-Dokumentation (`/docs/en/manage-claude/access-transparency#cmek-content-preservation`); Events über die Access-Transparency-Logs filtern.
- **Mehrwert:** Enterprise-/CMEK-Kunden können `cmek_preserve`-Events jetzt anhand konkreter Payload-/Filterbeispiele und benannter Aufbewahrungsgründe gezielt auswerten und in ihre Compliance-Prozesse einbinden — mehr Transparenz darüber, warum und wodurch Inhalte aufbewahrt wurden.
- **Version:** Platform-Release-Notes 10.07.2026 (kein CLI-Release)

---

### Woche 28 (10. Juli 2026) — v2.1.206

---

### [Verzeichnis-Pfad-Vorschläge für `/cd`]
- **Was:** `/cd` schlägt jetzt beim Tippen passende Verzeichnispfade vor — analog zum Verhalten von `/add-dir`.
- **Einsatz:** `/cd <Tab/Teilpfad>`
- **Mehrwert:** Schnelleres, fehlerärmeres Wechseln des Arbeitsverzeichnisses mitten in der Session, ohne den vollständigen Pfad von Hand tippen zu müssen.
- **Version:** v2.1.206

### [`/doctor`-Check schlägt Trimmen eingecheckter `CLAUDE.md`-Dateien vor]
- **Was:** `/doctor` hat einen neuen Check, der vorschlägt, eingecheckte `CLAUDE.md`-Dateien zu verschlanken, indem Inhalte gestrichen werden, die Claude ohnehin aus dem Codebase ableiten kann.
- **Einsatz:** `/doctor` (bzw. `/checkup`)
- **Mehrwert:** Kleinere, fokussiertere `CLAUDE.md` sparen Kontext-Tokens und reduzieren Redundanz — der Check zeigt konkret, was raus kann.
- **Version:** v2.1.206

### [`/commit-push-pr` erlaubt `git push` zum konfigurierten Push-Remote automatisch]
- **Was:** `/commit-push-pr` erlaubt `git push` jetzt automatisch nicht nur an `origin`, sondern auch an das konfigurierte Push-Remote des Repos (`remote.pushDefault` bzw. das einzige Remote, falls nur eines konfiguriert ist).
- **Einsatz:** `/commit-push-pr`
- **Mehrwert:** In Fork-/Multi-Remote-Setups läuft der Push ohne zusätzliche Berechtigungsrückfrage durch — weniger Reibung bei Repos, die nicht gegen `origin` pushen.
- **Version:** v2.1.206

### [Gateway: `/login` unterstützt öffentliche Anthropic-Gateway-Endpunkte]
- **Was:** `/login` unterstützt jetzt von Anthropic betriebene öffentliche Gateway-Endpunkte.
- **Einsatz:** `/login` (bei Nutzung eines Anthropic-Public-Gateway-Endpunkts)
- **Mehrwert:** Anmeldung funktioniert auch hinter den öffentlichen Gateway-Endpunkten reibungslos — relevant für Nutzer, die Claude über einen solchen Upstream ansprechen.
- **Version:** v2.1.206

### [`EnterWorktree` fragt bei Worktrees außerhalb `.claude/worktrees/` nach]
- **Was:** `EnterWorktree` verlangt jetzt eine Bestätigung, bevor es einen Git-Worktree betritt, der außerhalb des projekteigenen `.claude/worktrees/`-Verzeichnisses liegt.
- **Einsatz:** Automatisch aktiv (`EnterWorktree`-Tool)
- **Mehrwert:** Schutz davor, dass ein Agent unbeabsichtigt in einen fremden/externen Worktree wechselt und dort arbeitet — mehr Kontrolle über den Blast-Radius.
- **Version:** v2.1.206

### [Background-Agents aktualisieren sich im Hintergrund nach einem Update]
- **Was:** Nach einem Claude-Code-Update aktualisieren sich Background-Agents jetzt gleich im Hintergrund auf die neue Version, statt beim Attach einen langsamen Stale-Session-Upgrade nachzuholen.
- **Einsatz:** Automatisch aktiv (Background-Agents)
- **Mehrwert:** Kein Warten mehr beim Anhängen an eine Hintergrund-Session, die noch auf einer alten Version lief — das Upgrade ist bereits erledigt.
- **Version:** v2.1.206

### [Verbesserungen v2.1.206: `/code-review`, Agent-View]
- **Was:** Die Findings-Qualität von `/code-review` auf `claude-opus-4-8` wurde über alle Effort-Level verbessert. In der Agent-View nutzt die Status-Spalte jetzt die volle Terminalbreite (statt bei 64 Zeichen abzuschneiden); `Ctrl+X` entfernt eine abgeschlossene Session dauerhaft, Sessions werden nicht mehr doppelt gerendert, und gelöschte Background-Jobs bleiben gelöscht.
- **Einsatz:** `/code-review` bzw. `claude agents`
- **Mehrwert:** Präzisere Code-Review-Ergebnisse auf dem aktuellen Opus-Modell und eine aufgeräumtere, besser lesbare Agent-Übersicht.
- **Version:** v2.1.206

### [Bugfix-Sammlung v2.1.206]
- **Was:** Umfangreiche Fehlerbehebungen, u. a.: ein abgelaufener Login ließ jedes Modell mit der irreführenden Meldung „There's an issue with the selected model" scheitern, statt zu `/login` aufzufordern — behoben; `claude --resume`/`--continue` reagierten beim Start nicht auf Tastatureingaben; per `--mcp-config`/`.mcp.json` konfigurierte MCP-Server ignorierten ein pro-Server gesetztes `request_timeout_ms` (lang laufende MCP-Tool-Calls liefen in frischen Sessions in den 60-s-Default) — behoben; `CLAUDE_CODE_EXTRA_BODY` wurde von `claude agents`/`--bg`-Background-Workern still ignoriert (der shell-exportierte Override folgt jetzt der dispatchenden Session); OAuth-MCP-Server verlangten nach einem einzelnen fehlgeschlagenen Token-Refresh eine manuelle Neu-Authentifizierung; ein `--permission-prompt-tool`, das auf einen MCP-Server zeigte, crashte beim Cold-Start mit „MCP tool not found", bevor der Server fertig verbunden war; der `/model`-Picker zeigte teils den Preis eines anderen als des benannten Modells an (und listete keine First-Party-Listenpreise mehr bei Providern, die sie nicht berechnen); server-gelieferte Modellzeilen wurden im `/model`-Picker falsch platziert, wenn eine Entitlement-/Allowlist-Einschränkung die Bezugszeile entfernte; Desktop-Sessions blieben nach einem mitten im Turn gesendeten Slash-Befehl auf „running" hängen; Tastatureingaben wurden in der Agent-View ignoriert, wenn unter Windows vor einem bloßen `claude --resume` ein Setup-Prompt erschien; `claude rm` ließ den entfernten Job im Daemon-Roster (die Zeile tauchte in `claude agents` wieder auf); `/remote-control` zeigte im ausgeloggten Zustand „Unknown command" statt einer Anmelde-Anleitung; Pfeil-links stieg im Workflow-Detail nicht aus einer Phase/einem Agent zurück; `/status` listete dieselbe Broken-Install-Warnung doppelt; falsche „disused plugin"-Tipps und verzerrte Disuse-Telemetrie für LSP-Plugins; `/doctor`s Update-Check verglich Homebrew-Installationen jetzt gegen den Channel des Casks statt gegen den Settings-Channel; diverse Fixes an der Fullscreen-„Jump-to-bottom"-Pill (falscher Ctrl+End-Hinweis auf macOS, nicht angezeigte rebound-Chords, Umbruch über das Transcript); Bedrock: mehrminütiger Startup-Hang bei Nutzung eines `awsCredentialExport`-Helpers in Netzen mit eingeschränktem Egress — behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich robustere Anmeldung, MCP-Konfiguration und Background-/Agent-Bedienung — kein irreführender Modellfehler bei abgelaufenem Login, korrekte MCP-Timeouts, verlässliche `/model`-Preise und ein aufgeräumteres `claude agents`.
- **Version:** v2.1.206

---

### Platform Release Notes — 8. Juli 2026

---

### [API-Key-Ablaufdatum in der Claude Console]
- **Was:** Beim Erstellen eines API-Keys oder Admin-API-Keys in der Claude Console lässt sich jetzt ein Ablaufdatum festlegen — als Preset, benutzerdefinierte Dauer oder „Never". Für Keys mit einer Laufzeit von mindestens 7 Tagen mailt Anthropic dem Ersteller rechtzeitig vor Ablauf. Bestehende Keys bleiben unverändert. Die Admin-API meldet das Ablaufdatum jedes Keys im Feld `expires_at`.
- **Einsatz:** Claude Console → Settings → Keys (beim Erstellen Ablauf wählen); programmatisch über das `expires_at`-Feld der Admin-API (`api_keys/list`).
- **Mehrwert:** Kurzlebige, automatisch ablaufende Keys senken das Risiko vergessener Langzeit-Credentials und erleichtern Key-Rotation; die Vorab-E-Mail verhindert überraschende Ausfälle, wenn ein Key ausläuft.
- **Version:** Platform-Release-Notes 08.07.2026 (kein CLI-Release)

---

### Woche 28 (8. Juli 2026) — v2.1.205

---

### [Auto-Mode-Regel gegen Manipulation von Session-Transkripten]
- **Was:** Der Auto-Mode blockiert jetzt Versuche, Session-Transkript-Dateien zu manipulieren (z. B. um sich nachträglich Freigaben in den Verlauf zu schreiben).
- **Einsatz:** Automatisch aktiv (Auto-Mode)
- **Mehrwert:** Höhere Integrität des Audit-Verlaufs — ein Agent kann sich nicht selbst „gefälschte" Genehmigungen ins Transkript schreiben und daraus riskante Aktionen ableiten.
- **Version:** v2.1.205

### [`/doctor` ist jetzt ein vollständiger Setup-Checkup (Alias `/checkup`)]
- **Was:** `/doctor` diagnostiziert nicht mehr nur, sondern ist ein kompletter Setup-Checkup, der erkannte Probleme auch beheben kann. `/checkup` ist ein Alias dafür.
- **Einsatz:** `/doctor` oder `/checkup`
- **Mehrwert:** Ein einziger Befehl prüft und repariert die Installation/Konfiguration — schnellere Fehlerbehebung ohne manuelles Nachforschen, wo etwas klemmt.
- **Version:** v2.1.205

### [Auto-Update-Downloads streamen auf Platte statt in den RAM]
- **Was:** Binär-Downloads des Auto-Updaters werden jetzt direkt auf die Festplatte gestreamt, statt komplett im Speicher gepuffert zu werden — das senkt den Peak-Speicherbedarf des Updaters um rund 400 MB.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Updates belasten den Arbeitsspeicher kaum noch — relevant auf speicherarmen Maschinen und in Containern, wo der 400-MB-Spike bisher zu OOM-Abbrüchen führen konnte.
- **Version:** v2.1.205

### [Background-Task-Notifications weisen auf fehlende menschliche Eingabe hin]
- **Was:** Benachrichtigungen von Background-Tasks nennen jetzt ausdrücklich, dass keine menschliche Eingabe erfolgt ist — das verhindert, dass fabrizierte, ins Transkript geschriebene „Freigaben" als echte Genehmigungen behandelt und ausgeführt werden.
- **Einsatz:** Automatisch aktiv (Background-Agents)
- **Mehrwert:** Zusätzlicher Schutz gegen Prompt-Injection/Selbst-Genehmigung — ein Hintergrund-Agent führt keine riskante Aktion aus, weil im Verlauf eine erfundene Zustimmung steht.
- **Version:** v2.1.205

### [Agent-View: farbiges Status-Wort, Classifier-Headline und PR-Verlinkung]
- **Was:** In `claude agents` zeigen die Zeilen jetzt ein farbiges Status-Wort und eine vom Classifier geschriebene Kurz-Überschrift statt rohem Tool-Call-Text; der Peek öffnet mit vollem Status inkl. der exakten Rückfrage bei blockierten Sessions. Zudem verlinken Sessions, die einen bestehenden PR editieren, mergen, kommentieren oder pushen, diesen PR nun in der Agent-Ansicht (bisher nur beim Erstellen).
- **Einsatz:** `claude agents`
- **Mehrwert:** Auf einen Blick erkennbar, was jede Session tut und woran sie hängt — ohne Tool-Call-Rauschen; PR-Bezug ist auch bei Folge-Aktionen sichtbar.
- **Version:** v2.1.205

### [`--json-schema`-Fixes: ungültiges Schema und `format`-Keyword]
- **Was:** `--json-schema` produzierte bei ungültigem Schema still unstrukturierte Ausgabe, und Schemas mit dem `format`-Keyword wurden abgelehnt. Beides ist behoben.
- **Einsatz:** `claude -p ... --json-schema <schema>`
- **Mehrwert:** Strukturierte CLI-Ausgabe ist zuverlässiger — ein fehlerhaftes Schema fällt nicht mehr still auf Freitext zurück, und gängige `format`-Constraints (z. B. `date`, `email`) funktionieren.
- **Version:** v2.1.205

### [Reservierter MCP-Server-Name „Claude Browser"]
- **Was:** Der MCP-Server-Name „Claude Browser" ist jetzt reserviert (neben „Claude Preview") — im Vorgriff auf die Umbenennung des Claude-Desktop-Panes. Nutzerkonfigurierte MCP-Server können sich nicht mehr unter einem dieser Namen registrieren.
- **Einsatz:** Automatisch aktiv (MCP-Konfiguration)
- **Mehrwert:** Verhindert Namenskollisionen mit dem kommenden eingebauten Browser-Pane — keine überraschenden Konflikte bei künftigen Desktop-Updates.
- **Version:** v2.1.205

### [Bugfix-Sammlung v2.1.205]
- **Was:** Umfangreiche Fehlerbehebungen, u. a.: eine mitten in der Arbeit gesendete Nachricht ging still verloren, wenn der Turn am `--max-turns`-Limit endete — behoben; Windows-Worktree-Entfernung löschte Dateien außerhalb des Worktrees, wenn darin eine NTFS-Junction oder ein Verzeichnis-Symlink lag — behoben; Background-Agents blieben nach Wiederaufnahme via `SendMessage` fälschlich als „failed"/„completed" gelistet; Background-Jobs kippten in der Agent-Liste von „needs input" zurück auf „working", wenn der Turn keinen lesbaren Text enthielt; `claude attach` warf einen Fehler, wenn ein Background-Agent gerade im Upgrade-Neustart war, statt auf dessen Rückkehr zu warten; Session-zu-PR-Verlinkung übersah einen PR, der in einem Bash-Aufruf mit über 30K großer Ausgabe erstellt wurde; `claude mcp add-from-claude-desktop` blieb bei Servernamen mit nicht unterstützten Zeichen hängen (ungültige Namen werden jetzt gemeldet, restliche Server trotzdem importiert); ein Plugin-LSP-Server, der die Initialisierung nicht schaffte, verhinderte, dass ein gültiger LSP-Server eines anderen Plugins dieselbe Dateiendung bediente — behoben; Windows-Crash, wenn das Startverzeichnis von Claude während eines laufenden Befehls gelöscht/gesperrt/ausgehängt wurde; Crash, wenn ein File-Watcher geschlossen wurde, während ein Verzeichnis-Scan noch lief; Project-Verify-Skills wurden bei jeder Session neu geschrieben statt nur bei geändertem dokumentierten Befehl; die Agent-Ansicht renderte eine Zeile zu hoch und beschnitt ihren Header bei leichtem Überlauf; Background-Tasks in den Web-/Mobile-Remote-Control-Panels zeigten veralteten „Running"-Status (voller Task-Status wird jetzt bei jeder Membership-Änderung weitergereicht); Auto-Mode fragt jetzt nach, bevor `rm -rf` auf eine aus dem Kontext nicht auflösbare Variable läuft; Cowork-VM-Mode-Local-Agent-Sessions scheiterten auf CLI 2.1.203+ mit „Not logged in · Please run /login" — behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich robustere Background-/Agent-Bedienung, sichereres Worktree- und Auto-Mode-Verhalten (kein versehentliches Löschen außerhalb des Worktrees, kein `--max-turns`-Nachrichtenverlust) und ein funktionierender Cowork-Login auf aktuellen CLI-Versionen.
- **Version:** v2.1.205

---

### Woche 28 (8. Juli 2026) — v2.1.204

---

### [SessionStart-Hooks streamen im Headless-Modus wieder — kein Idle-Reaping mehr]
- **Was:** Im Headless-Betrieb (nicht-interaktive Sessions) wurden Hook-Events während `SessionStart`-Hooks nicht gestreamt, wodurch Remote-Worker mitten im Hook als „idle" erkannt und abgeräumt (idle-reaped) werden konnten. Das ist behoben.
- **Einsatz:** Automatisch aktiv (Headless-/Remote-Worker-Sessions mit SessionStart-Hooks)
- **Mehrwert:** Länger laufende `SessionStart`-Hooks (z. B. Setup-/Sync-Skripte) brechen Remote-Worker nicht mehr fälschlich ab — stabilere automatisierte und Hintergrund-Läufe.
- **Version:** v2.1.204

---

### Woche 28 (7. Juli 2026) — v2.1.203

---

### [Warnung vor ablaufendem Login]
- **Was:** Claude Code warnt jetzt, wenn dein Login demnächst abläuft, damit du dich rechtzeitig neu anmelden kannst, bevor Background-Sessions unterbrochen werden.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine überraschend abbrechenden Hintergrund-Sessions mehr wegen abgelaufener Authentifizierung — du wirst vorher erinnert, dich neu einzuloggen.
- **Version:** v2.1.203

### [Grauer ⏸-Badge im Footer bei manuellem Berechtigungsmodus]
- **Was:** Im manuellen Berechtigungsmodus zeigt der Footer jetzt einen grauen ⏸-Badge, sodass der aktive Modus stets sichtbar ist.
- **Einsatz:** Automatisch aktiv (manueller Permission-Modus)
- **Mehrwert:** Man sieht auf einen Blick, dass jede Aktion bestätigt werden muss — kein versehentliches Arbeiten im falschen Modus.
- **Version:** v2.1.203

### [Zusätzliche Arbeitsverzeichnisse in MCP `roots/list`]
- **Was:** Die zusätzlichen Arbeitsverzeichnisse einer Session werden jetzt in MCP `roots/list` aufgeführt; bei Änderung der Menge wird eine `notifications/roots/list_changed`-Benachrichtigung gesendet.
- **Einsatz:** Automatisch aktiv (MCP-Server, die `roots` nutzen)
- **Mehrwert:** MCP-Server sehen alle relevanten Projektwurzeln (z. B. nach `/add-dir`) und reagieren dynamisch auf Änderungen — bessere mehrverzeichnis-fähige Tool-Integration.
- **Version:** v2.1.203

### [Settings-Toggle „Enable Remote Control for all sessions" (VS Code)]
- **Was:** In VS Code gibt es einen neuen Settings-Schalter „Enable Remote Control for all sessions", der Remote Control (Mobile/Web) global für alle Sessions aktiviert.
- **Einsatz:** VS Code Settings → „Enable Remote Control for all sessions"
- **Mehrwert:** Man muss Remote Control nicht mehr pro Session einschalten — einmal aktivieren und alle Sessions sind vom Handy/Web aus steuerbar.
- **Version:** v2.1.203

### [Bugfix-Sammlung v2.1.203 — Fokus Background-Sessions & Worktrees]
- **Was:** Umfangreiche Fehlerbehebungen, u. a.: Öffnen/Wechseln von Background-Agent-Sessions auf macOS stockte 15–20 s wegen falscher Low-Memory-Erkennung (Regression aus 2.1.196) — behoben; Background-Sessions wurden dauerhaft unerreichbar (Attach/Reply/Stop), wenn das Session-Token des Daemons veraltete — sie erholen sich jetzt automatisch; Rückkehr zu `claude agents` stoppte still laufende Subagents und startete den Prompt von vorn — die Arbeit läuft jetzt weiter; Memory-/CPU-Regression in interaktiven Sessions behoben (der Kontext-Indikator analysiert nicht mehr nach jedem Turn das ganze Transcript); Background-Agents erbten einen veralteten `PATH` vom Daemon statt vom dispatchenden Shell (fehlende Tools unter Windows) — behoben; Background-/Agent-View-Sessions verwarfen ein shell-exportiertes `ANTHROPIC_BASE_URL` (API-Keys gingen an den Default-Endpoint, 401) — behoben; Bash scheiterte mit „argument list too long" in Repos mit vielen Git-Worktrees; worktree-isolierte Subagents führten Shell-Befehle teils im Parent-Checkout statt im eigenen Worktree aus — behoben; Worktree-Erstellung lehnte verschachtelte Repos in Multi-Repo-Workspaces ab — behoben; Background-Agents crash-loopten, wenn ihr Arbeitsverzeichnis gelöscht/ersetzt/ungültig wurde — sie scheitern jetzt einmal mit klarer Fehlermeldung; ein fehlgeschlagener Daemon-Auto-Upgrade tötete still alle laufenden Background-Sessions — behoben; `TaskStop`/`TaskOutput` fanden von einem anderen Agent gespawnte Background-Agents nicht (Fehler listen jetzt laufende Agents nach ID/Beschreibung); diverse `claude agents`-Fixes (verworfene Composer-Nachricht, Crash beim Öffnen einer bereits woanders offenen Session, falsches „Needs input", nur „exit_with_message" statt echtem Fehler); Background-Sessions ignorierten `effortLevel`-Änderungen beim Fork über den Daemon — behoben; `@`-Directory-Picker in `claude agents` zeigte registrierte Git-Worktrees nicht; Background-Task-Ausgabe unter Windows wurde nach `/clear` dauerhaft durch eine leere Datei ersetzt — behoben; diverse Terminal-/Render-Fixes (Content-Sprünge beim Hochscrollen, Flackern in Bash-Mode mit History-Vorschlag, literale `^[[I`/`^[[O`-Escapes beim Reattach); LSP-only-Plugins wurden fälschlich als ungenutzt markiert — behoben. **Verbesserungen:** flüssigeres Streaming langer Antworten (Live-Preview rendert nicht mehr den ganzen Bildschirm neu); Subagents delegieren seltener ihre ganze Aufgabe weiter; Binärgröße und Startup-Speicher je ~7 MB reduziert (Lazy-Loading einer großen Dependency). **Änderungen:** Pfeil-links schließt Background-Tasks-/Diff-/Workflow-Detail-Ansichten nicht mehr (stattdessen Esc); leere `claude agents`-Ansicht zeigt immer die Sektionen (Needs input / Working / Completed); Startup-Warnungen „claude command missing or broken" wandern nach `/doctor` und `/status`.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich robustere Background-Sessions und Worktree-Handhabung (kein 15–20-s-Stall auf macOS, keine still verlorenen Subagents, keine verschluckten `PATH`/`ANTHROPIC_BASE_URL`), schnellere/leichtere CLI und aufgeräumtere `claude agents`-Bedienung.
- **Version:** v2.1.203

---

### 7. Juli 2026 — Blog-Announcements

---

### [Claude Code & Claude Cowork für Behörden (Government, Public Beta)]
- **Was:** Anthropic bringt Claude Code und Claude Cowork als Public Beta in **Claude for Government Desktop** — eine **FedRAMP-High-autorisierte** Umgebung. Behördenteams können damit Software bauen/modernisieren (Claude Code) bzw. Memos, RFP-Reviews, Fallbearbeitung und Präsentationen an Claude delegieren (Cowork), direkt auf lokalen Dateien. Die Inferenz läuft innerhalb der autorisierten Umgebung, der Konversationsverlauf bleibt lokal auf behördeneigenen Geräten.
- **Einsatz:** Zugang über claude.com/solutions/government; Verwaltung mit Hash-Chain-(tamper-evident-)Audit-Logs, SCIM-Group-Mappings, Abteilungs-Administration und Usage-Tracking pro Nutzer/Modell im Admin-Konsole. Anthropic bleibt Vertragspartner (kein separater Cloud-Provider-Vertrag nötig).
- **Mehrwert:** Öffentliche Verwaltung erhält Claude Code/Cowork in einer compliance-konformen Umgebung, die den Agency-Authority-to-Operate-(ATO-)Prozess mit auditierbaren, manipulationssicheren Logs unterstützt — agentische KI-Entwicklung auch dort einsetzbar, wo strenge Governance-Anforderungen gelten.
- **Version:** Blog-Announcement 07.07.2026 (kein CLI-Release)

### [Claude Cowork kommt auf Mobile und Web]
- **Was:** Claude Cowork — der Agent, der eine übergebene Aufgabe eigenständig über Dateien, Kalender, E-Mail, Messaging, Web und verbundene Tools hinweg bis zur Fertigstellung bearbeitet — ist nicht mehr auf den Desktop beschränkt. Beta-Rollout zunächst für Max-Nutzer auf **iOS, Android und Web**; Desktop bleibt die voll-featured Variante mit lokalem Dateizugriff.
- **Einsatz:** iOS/Android über die Sidebar der Claude-App; Web über den Start-Bildschirm von claude.ai. Aufgaben laufen im **Hintergrund ohne aktives Gerät** weiter (auch geplante Läufe); bei Entscheidungen, die menschliches Urteil brauchen, kommt eine **Notification aufs Handy** für einen Mid-Task-Redirect. Cowork-Nutzungslimits bis **05.08.2026 verdoppelt**.
- **Mehrwert:** Cross-Device-Continuity — Aufgabe am Desktop starten, unterwegs am Handy überwachen und fertige Arbeit überall abrufen; Arbeit pausiert nicht mehr, sobald man den Laptop verlässt. (Hinweis: ~90 % der Cowork-Nutzung ist laut Anthropic keine Software-Entwicklung, sondern Business-Operations & Content-Erstellung; Chat und Cowork sind auf Web und Desktop nun vereinheitlicht.)
- **Version:** Blog-Announcement 07.07.2026 (kein CLI-Release)

---

### Woche 28 (6. Juli 2026) — v2.1.202

---

### [„Dynamic workflow size" in `/config` — Größe dynamischer Workflows steuern]
- **Was:** Neue Einstellung „Dynamic workflow size" in `/config`, mit der man vorgibt, wie groß Claude dynamische Workflows generell anlegt (kleine/mittlere/große Agent-Zahlen). Es ist eine beratende Richtlinie, keine erzwungene Obergrenze.
- **Einsatz:** `/config` → „Dynamic workflow size" (small/medium/large)
- **Mehrwert:** Grobe Kontrolle über den Ressourcen- und Token-Aufwand agentischer Workflows, ohne jeden einzelnen Lauf manuell begrenzen zu müssen — kostenbewusster oder maximal-gründlicher je nach Wunsch.
- **Version:** v2.1.202

### [OpenTelemetry-Attribute `workflow.run_id` und `workflow.name`]
- **Was:** Von Workflow-gespawnten Agents emittierte Telemetrie enthält jetzt die OTel-Attribute `workflow.run_id` und `workflow.name`, sodass sich die Aktivität eines Workflow-Laufs aus den OTel-Daten rekonstruieren lässt.
- **Einsatz:** Automatisch aktiv (bei aktiviertem OpenTelemetry-Export)
- **Mehrwert:** Workflow-Läufe werden im Monitoring nachvollziehbar — man kann alle Agents eines Laufs zuordnen und Kosten/Dauer pro Workflow auswerten.
- **Version:** v2.1.202

### [`/review <pr>` wieder als schneller Single-Pass-Review]
- **Was:** `/review <pr>` führt wieder einen schnellen Single-Pass-Review durch. Für den mehrstufigen Multi-Agent-Review nutzt man jetzt `/code-review <level> <pr#>` mit gewählter Effort-Stufe.
- **Einsatz:** `/review <pr>` (schnell) bzw. `/code-review <level> <pr#>` (Multi-Agent)
- **Mehrwert:** Klare Trennung: schnelle Durchsicht per `/review`, tiefe Prüfung bewusst per `/code-review` — kein unnötig teurer Multi-Agent-Lauf mehr, wenn nur ein schneller Blick gewünscht ist.
- **Version:** v2.1.202

### [Skill-Doppel-Laden behoben]
- **Was:** Das erneute Aufrufen eines bereits geladenen Skills hängte bisher eine doppelte Kopie seiner Anweisungen an den Kontext. Das ist behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein aufgeblähter Kontext und keine widersprüchlich doppelten Skill-Anweisungen mehr bei wiederholtem Skill-Aufruf — sauberer Kontext und stabileres Prompt-Caching.
- **Version:** v2.1.202

### [Bugfix-Sammlung v2.1.202]
- **Was:** Umfangreiche Fehlerbehebungen und Verbesserungen, u. a.: Crash der Inline-`Ctrl+R`-History-Suche beim Bestätigen/Abbrechen während des Scannens behoben; `/rename` auf Background-Sessions wurde bei Job-Neustart zurückgesetzt (brach die Adressierung per neuem Namen) — behoben; transiente mTLS-Handshake-Fehler bei In-Place-Rotation des Client-Zertifikats behoben; von Remote Control (Mobile/Web) in eine interaktive Session gesendete Befehle scheiterten mit „Unknown command" — behoben; ohne Bildunterschrift aus der Remote-Control-App gesendete Bilder/Dateien wurden still verworfen — behoben; die von `claude auth login` / `claude mcp login --no-browser` ausgegebene Sign-in-URL ist bei Zeilenumbruch über SSH jetzt zuverlässig als ein einziger Hyperlink klickbar; Öffnen eines Chats aus `claude agents` scheiterte teils mit „currently running as a background agent" plus Worker-Crash/Respawn-Schleife — behoben; Workflow-Skripte mit Unicode-Quote-Escapes wurden vor dem Parsen korrumpiert (Parse-Fehler zeigen jetzt die betroffene Zeile statt pauschal „TypeScript" zu beschuldigen); Sprachdiktat wiederholte bei Mikrofon-/Recorder-Fehler endlos — wiederholte Aufnahmefehler pausieren die Spracheingabe jetzt; `/remote-control`-Sessions zeigten in Mobile/Web den falschen Berechtigungsmodus — behoben; Fortsetzen/Öffnen des Resume-Pickers dauerte in Repos mit vielen Git-Worktrees Minuten und fraß viel Speicher — behoben; Installer-/Updater-Downloads scheiterten bei mitten im Download abbrechender Proxy-/Netzverbindung sofort mit „aborted" — transiente Verbindungsabbrüche werden jetzt wiederholt. **Verbesserung:** `/workflows`-Agent-Liste mit breiteren Titeln, eigener Zeit-Spalte, kürzeren Modellnamen und ohne Tool-Call-Zähler pro Zeile; klarere MCP-Fehlermeldung, wenn eine Server-Config `url` ohne `type` hat (schlägt `"type": "http"` vor statt des irreführenden „command: expected string").
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar stabilere Remote-Control-/Background-Session-Bedienung, robustere Netz-/mTLS-/Download-Behandlung, schnelleres Resume in Worktree-lastigen Repos und aufgeräumtere Workflow-/MCP-Diagnostik.
- **Version:** v2.1.202

---

### Woche 27 (3. Juli 2026) — v2.1.201

---

### [Sonnet-5-Sessions: keine Mid-Conversation-System-Rolle für Harness-Reminder]
- **Was:** In Claude-Sonnet-5-Sessions werden Harness-Hinweise (Reminder) nicht mehr über eine mitten im Gespräch eingefügte `system`-Rolle übermittelt.
- **Einsatz:** Automatisch aktiv (nur Sonnet-5-Sessions)
- **Mehrwert:** Sauberere Konversationsstruktur für Sonnet 5 — Harness-Reminder stören das Rollen-/Nachrichtenmuster nicht mehr, was Modellverhalten und Prompt-Caching zugutekommt.
- **Version:** v2.1.201

---

### Woche 27 (3. Juli 2026) — v2.1.200

---

### [`AskUserQuestion`-Dialoge laufen nicht mehr automatisch weiter]
- **Was:** `AskUserQuestion`-Dialoge setzen die Arbeit nicht mehr standardmäßig nach einem Idle-Timeout selbstständig fort. Das automatische Weiterlaufen ist jetzt Opt-in.
- **Einsatz:** Bei Bedarf Idle-Timeout per `/config` aktivieren
- **Mehrwert:** Rückfragen bleiben stehen, bis man tatsächlich antwortet — keine überraschend selbstständig getroffene Default-Wahl mehr, während man weg ist.
- **Version:** v2.1.200

### [Standard-Berechtigungsmodus jetzt „Manual"]
- **Was:** Der voreingestellte Berechtigungsmodus ist über CLI, VS Code und JetBrains hinweg auf „Manual" umgestellt.
- **Einsatz:** Automatisch aktiv; anderer Modus (Auto etc.) weiterhin manuell wählbar
- **Mehrwert:** Einheitliches, vorsichtiges Default-Verhalten über alle Oberflächen — Aktionen werden standardmäßig bestätigt statt automatisch ausgeführt.
- **Version:** v2.1.200

### [Bugfix-Sammlung v2.1.200]
- **Was:** Umfangreiche Fehlerbehebungen und Stabilitäts-Verbesserungen, u. a.: Startup-Crash behoben, wenn `disabledMcpServers`/`enabledMcpServers` in `.claude.json` kein Array ist; Background-Sessions brachen nach Sleep/Wake bzw. beim Wiederöffnen einer hängenden Session mitten im Turn ab; Background-Sessions ließen nach einem Stall-Respawn bereits abgebrochene Turns erneut laufen; Background-Agents starteten nach einem Daemon-Crash mit veralteter `daemon.lock` nicht neu; Daemon-Handover verhindert jetzt, dass ältere Builds übernehmen (Build-Aktualität wird am eingebetteten Versions-Zeitstempel gemessen); Background-Agent-Roster-Korruption, Feld-Erhalt und das Strippen des Socket-Auth-Tokens behoben; von Ratelimits abgeschnittene Subagents lieferten leere Ergebnisse statt sauber zu scheitern; Steuerbytes aus Background-Agent-Ausgabe erreichten das Terminal; `claude agents --plugin-dir` zeigte Plugins nicht in der Agent-Ansicht, wenn das Flag hinter `agents` stand; projekt-scoped Plugins luden nicht aus Git-Worktrees; `/mcp`-Server-Liste-Fokus für Screenreader; irreführende Sprachdiktat-Meldung „Voice connection failed" bei fehlender Audioaufnahme; Render-Flackern unter tmux 3.4+ mit synchronisierter Terminal-Ausgabe. **Barrierefreiheit:** verbesserte Screenreader-Ausgabe (dekorative Glyphen ausgeblendet, Transcript-Symbole als Labels vorgelesen). **Install:** Install-Skript erklärt jetzt Out-of-Memory-Kills.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich robustere Background-Sessions und -Agents (sauberes Verhalten nach Sleep/Wake, Stall-Respawn und Daemon-Crash, kein Turn-Doppellauf), sicherer Daemon-Handover und spürbar bessere Screenreader-Unterstützung.
- **Version:** v2.1.200

---

### Woche 27 (2. Juli 2026) — v2.1.199

---

### [Gestapelte Slash-Skill-Aufrufe laden alle führenden Skills (bis zu 5)]
- **Was:** Bei verketteten Aufrufen wie `/skill-a /skill-b do XYZ` werden jetzt alle führenden Skills geladen (bis zu 5), nicht mehr nur der erste.
- **Einsatz:** `/skill-a /skill-b /skill-c <Auftrag>`
- **Mehrwert:** Man kann mehrere Skills in einem Prompt kombinieren und ihre Anweisungen greifen alle gemeinsam — kein Umweg über Einzelaufrufe mehr.
- **Version:** v2.1.199

### [SSL-Zertifikatsfehler scheitern sofort mit Lösungshinweis]
- **Was:** SSL-Zertifikatsfehler (TLS-inspizierende Proxies, fehlendes `NODE_EXTRA_CA_CERTS`, abgelaufene Zertifikate) verbrannten bisher erst mehrere Retries, bevor eine hilfreiche Meldung kam. Jetzt scheitern sie sofort mit konkretem Fix-Hinweis.
- **Einsatz:** Automatisch aktiv; bei Bedarf `NODE_EXTRA_CA_CERTS` setzen
- **Mehrwert:** Hinter Corporate-Proxies wird die Ursache sofort statt nach langem Warten sichtbar — schnellere Fehlerbehebung.
- **Version:** v2.1.199

### [Transiente 429-Ratelimits werden automatisch mit Backoff wiederholt]
- **Was:** Transiente Server-Ratelimit-Fehler (429er, die nichts mit dem eigenen Nutzungslimit zu tun haben) werden für Abonnenten jetzt automatisch mit Backoff wiederholt, statt den Turn abzubrechen.
- **Einsatz:** Automatisch aktiv (Abonnenten)
- **Mehrwert:** Kurzzeitige Kapazitätsengpässe unterbrechen die Arbeit nicht mehr — der Turn läuft nach dem Backoff einfach weiter.
- **Version:** v2.1.199

### [Retry-Watchdog: höhere Retry-Grenzen für transiente Fehler]
- **Was:** `CLAUDE_CODE_RETRY_WATCHDOG` hebt die Standard-Retry-Zahl für nicht-kapazitätsbedingte transiente Fehler auf 300 an und hebt die bisherige Obergrenze von 15 für `CLAUDE_CODE_MAX_RETRIES` auf.
- **Einsatz:** `CLAUDE_CODE_RETRY_WATCHDOG` / `CLAUDE_CODE_MAX_RETRIES` als Env-Var setzen
- **Mehrwert:** Langlaufende, unbeaufsichtigte Sessions überstehen deutlich mehr transiente Störungen, ohne abzubrechen.
- **Version:** v2.1.199

### [Teilweise Streaming-Antworten bleiben bei Mid-Stream-Fehlern erhalten]
- **Was:** Wenn die API nach bereits gestreamter Teilantwort mitten im Stream einen Overloaded-/Server-Fehler wirft, wird die Teilantwort nicht mehr verworfen, sondern mit einem „unvollständig"-Hinweis behalten. Analog geben Subagents, die von Ratelimit/Server-Fehler abgeschnitten werden, jetzt ihre Teilarbeit an den Parent zurück (statt still zu scheitern).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein Totalverlust bereits erzeugter Ausgabe bei Netz-/Server-Hickups — auch angefangene Subagent-Ergebnisse gehen nicht verloren.
- **Version:** v2.1.199

### [Subagent-API-Fehler werden korrekt an den Parent gemeldet]
- **Was:** Subagents meldeten API-Fehler (z. B. „usage limit reached") bisher fälschlich als erfolgreiches Ergebnis. Der Fehler wird jetzt korrekt an den Parent-Agent durchgereicht.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Der Parent erkennt echte Fehlschläge seiner Subagents und kann reagieren, statt mit einem Scheinerfolg weiterzuarbeiten.
- **Version:** v2.1.199

### [`claude agents`: PR-Links als schlichtes `#N`]
- **Was:** In den `claude agents`-Session-Zeilen erscheinen Pull-Request-Links jetzt als schlichtes `#N` ohne das redundante „PR"-Label.
- **Einsatz:** `claude agents`
- **Mehrwert:** Aufgeräumtere, kompaktere Agent-Übersicht.
- **Version:** v2.1.199

### [Bugfix-Sammlung v2.1.199]
- **Was:** Umfangreiche Fehlerbehebungen, u. a.: Background-Agent-Daemon auf Linux tötete sich (und alle laufenden Agents) nach unsauberem Shutdown alle ~50 s selbst — behoben; Background-Agents scheiterten beim Cold-Start über SSH auf macOS mit „Could not switch to audit session" (Regression in 2.1.196); `claude stop` wurde bei Kollision mit einem Background-Agent-Respawn still rückgängig gemacht — Respawn respektiert jetzt den Stop; Fortschrittsanzeigen von Background-Jobs blieben bei langen Befehlen minutenlang stehen; Background-Sessions auf speicherarmen Maschinen zeigen jetzt „wenig Speicher" statt generischem Fehler; Remote-Sessions flackerten in der Agent-Ansicht zwischen Working/Idle; leerlaufende Subagents verschwanden aus dem Panel, während andere noch arbeiteten — überzählige klappen jetzt in eine ausklappbare Summary-Zeile; `/model` bzw. `/fast` beim Betrachten eines Subagents öffnete still den Modell-Picker des Leads — jetzt Hinweis, dass der Befehl für den Lead gilt; `SessionStart`-/`Setup`-/`SubagentStart`-Hooks verbargen stderr bei Exit-Code 2 — Fehler wird jetzt im Transcript gezeigt; `claude --dangerously-skip-permissions daemon <subcommand>` wurde als Chat-Prompt statt als Subcommand behandelt; `SendMessage` leitete bei wiederverwendeten Agent-Namen falsch weiter — erkennt jetzt den Mismatch; Öffnen/Fortsetzen einer Session ohne neue Nachrichten ließ die Transcript-Datei unnötig wachsen; Backgrounden einer Session per `←`/`/background` verlor ihre `/color` in der Agent-Zeile; Zurücksetzen einer korrupten Config aus dem Recovery-Dialog zerstörte sie unwiederbringlich — jetzt vorher Backup; Claude in Chrome öffnete wiederholt die Reconnect-Seite bei unterschiedlichen Builds/Config-Verzeichnissen; Plan-Modus fragte bei zustandsändernden Browser-Tool-Aufrufen nicht nach — schreibgeschützte `browser_batch`-Aufrufe werden jetzt korrekt auto-erlaubt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich stabilere Background-Agents (kein Selbstabschuss, sauberes Stop-Verhalten, verlässliche SSH-/macOS-Coldstarts), robusteres Config-Recovery und ehrlichere Fehlersichtbarkeit in Hooks und Subagents.
- **Version:** v2.1.199

---

### Blog / Ankündigungen (2. Juli 2026)

---

### [Admin-Analytics & Kostenkontrolle für Claude-Ausgaben]
- **Was:** Anthropic hat ein Bündel neuer Admin-Werkzeuge für Sichtbarkeit und Steuerung der Claude-Ausgaben in Organisationen (Enterprise) veröffentlicht. **Analytics/Sichtbarkeit:** Admin-Dashboard mit Nutzungs- und Kosten-Aufschlüsselung pro Team und pro Nutzer; Claude-Code-spezifische Analytics (täglich aktualisiert: aktive Entwickler, Session-Zahlen, Top-Befehle); ein **Value-Tab**, der Produktivitätsgewinn, Kosten pro Commit und Jahres-ROI mit anpassbaren Eingaben schätzt; **Analytics Chat** für natürlichsprachige Abfragen („Welche Teams haben ihre Nutzung diesen Monat verdoppelt?"); eine **Analytics-API** zur Integration in bestehende Tools (Datadog, CloudZero); sowie individuelle Nutzer-Sicht auf eigene Trends, Ausgaben pro Produkt/Modell/Skill und Fortschritt zum Limit. **Kostenkontrolle:** Model-Defaults & Entitlements (welches Modell je Rolle/org-weit Gespräche startet), Spend-Alerts bei 75 % und 90 % des Org-Limits (Nutzer: 75 %/95 % mit In-App-Anfrage), Per-Group-Spend-Caps und Zugriffskontrollen, sowie eine **Admin-API** für automatisierte Limit-Reviews und das Aufspüren gefährdeter Nutzer.
- **Einsatz:** Admin-Konsole → Analytics/Dashboards (Filter u. a. nach SCIM-Gruppen); Analytics- und Admin-API für eigene Reporting-/Automations-Workflows
- **Mehrwert:** Kontinuierliche Kostentransparenz und Governance für agentische Workloads — Ausgaben werden laufend statt erst zum Monatsende sichtbar, Premium-Modell-Nutzung lässt sich per Default eindämmen, und Reporting integriert sich in bestehende Cloud-Kosten-Tools.
- **Version:** Blog-Ankündigung (2.7.)

---

### Woche 27 (1. Juli 2026) — v2.1.198

---

### [Claude in Chrome — allgemein verfügbar (GA)]
- **Was:** Claude in Chrome ist jetzt allgemein verfügbar (nicht mehr nur Preview). Die Browser-Integration erlaubt Claude, im Chrome-Kontext zu agieren.
- **Einsatz:** Automatisch aktiv (Chrome-Integration)
- **Mehrwert:** Stabile, produktiv nutzbare Browser-Anbindung ohne Preview-Vorbehalte.
- **Version:** v2.1.198

### [Background-Agent-Notifications via Hooks (`agent_needs_input` / `agent_completed`)]
- **Was:** Zwei neue Hook-Events feuern für Hintergrund-Agents: `agent_needs_input`, wenn ein Agent auf eine Eingabe wartet, und `agent_completed`, wenn er fertig ist. So lassen sich eigene Benachrichtigungen (Desktop, Slack, Push …) an den Agent-Lebenszyklus knüpfen.
- **Einsatz:** Hooks auf `agent_needs_input` / `agent_completed` in den Settings registrieren
- **Mehrwert:** Man wird proaktiv informiert, wenn ein langlaufender Hintergrund-Agent blockiert ist oder abgeschlossen hat — kein manuelles Poll-Checken der Agents-Ansicht mehr.
- **Version:** v2.1.198

### [`/dataviz`-Skill für Diagramme & Dashboards]
- **Was:** Neuer `/dataviz`-Skill, der beim Entwurf von Charts und Dashboards unterstützt.
- **Einsatz:** `/dataviz`
- **Mehrwert:** Schneller strukturierte Datenvisualisierungen aufsetzen, ohne die Chart-Konfiguration von Hand herzuleiten.
- **Version:** v2.1.198

### [Gateway: „Claude Platform on AWS" als Upstream-Provider]
- **Was:** Das Gateway unterstützt jetzt „Claude Platform on AWS" (`anthropicAws`) als vorgelagerten Provider.
- **Einsatz:** Upstream-Provider `anthropicAws` im Gateway konfigurieren
- **Mehrwert:** Claude-Code-Gateway-Setups können Traffic direkt über die Claude Platform auf AWS leiten.
- **Version:** v2.1.198

### [Background-Agents: Auto-Commit, Push & Draft-PR bei Abschluss]
- **Was:** Hintergrund-Agents committen, pushen und öffnen bei Abschluss jetzt automatisch einen Draft-PR mit ihrer Arbeit.
- **Einsatz:** Automatisch aktiv (Background-Agents)
- **Mehrwert:** Ergebnisse eines fertigen Hintergrund-Agents landen ohne manuelle Git-Schritte direkt als reviewbarer Draft-PR — der Weg vom Agent-Ergebnis zum Review verkürzt sich deutlich.
- **Version:** v2.1.198

### [Explore-Agent erbt das Session-Modell (max. Opus)]
- **Was:** Der Explore-Agent nutzt jetzt das Modell der Haupt-Session (nach oben auf Opus gedeckelt), statt ein festes eigenes Modell zu verwenden.
- **Einsatz:** Automatisch aktiv (Explore-Agent)
- **Mehrwert:** Konsistente Modellqualität bei Erkundungs-Aufgaben — der Explore-Agent ist so leistungsfähig wie die laufende Session (bis Opus).
- **Version:** v2.1.198

### [Subagents erben die Extended-Thinking-Konfiguration]
- **Was:** Subagents übernehmen jetzt die Extended-Thinking-Einstellung der Session, statt sie separat konfigurieren zu müssen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Einheitliches Reasoning-Verhalten über Haupt-Session und ihre Subagents hinweg — keine überraschend „flacher" denkenden Subagents mehr.
- **Version:** v2.1.198

### [`/agents`-Wizard entfernt]
- **Was:** Der interaktive `/agents`-Einrichtungs-Wizard wurde entfernt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Aufräumen einer nicht mehr benötigten Setup-Oberfläche; Agent-Konfiguration läuft über die etablierten Wege.
- **Version:** v2.1.198

### [Fokus-Modus mit Subagent-Aktivitäts-Zusammenfassungen & highlight.js 11]
- **Was:** Der Fokus-Modus zeigt jetzt Zusammenfassungen der Subagent-Aktivität. Zudem wurde das Syntax-Highlighting auf highlight.js 11 aktualisiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Besserer Überblick, was Subagents im Fokus-Modus gerade tun, plus moderneres/robusteres Code-Highlighting.
- **Version:** v2.1.198

### [Bugfix-Sammlung v2.1.198]
- **Was:** Viele Fixes auf einen Schlag, u. a.: Netzwerk-Abbrüche mitten in der Antwort werden mit Retry-Backoff abgefangen; übermäßige Background-Classifier-Requests reduziert; `/diff`-Panel aktualisierte sich beim Branch-Wechsel nicht; Markdown-Tabellen liefen im Vollbild-Modus über; AWS- und Mantle-Sessions liefen ab (jetzt automatischer Token-Refresh); Local-Network-Host-Probleme auf macOS mit Local-Network-Entitlements; `/desktop` schlug nach Worktree-Operationen fehl; Background-Agents zeigten auf macOS wiederholt „Reconnecting…"; bedingte `.claude/rules/`-Regeln über symlinkte Pfade funktionierten nicht.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar stabilere Antworten bei Netzproblemen, zuverlässigere Cloud-Sessions (AWS/Mantle), korrekte `/diff`- und Vollbild-Darstellung sowie robustere Background-Agents auf macOS.
- **Version:** v2.1.198

---

### Platform / API (1. Juli 2026)

---

### [Zugriff auf Claude Fable 5 & Mythos 5 wiederhergestellt]
- **Was:** Der Zugriff auf die Modelle Claude Fable 5 und Claude Mythos 5 wurde wiederhergestellt (Redeployment). Details im Anthropic-Statement „Redeploying Fable 5 & Mythos 5".
- **Einsatz:** `model: "claude-fable-5"` bzw. `claude-mythos-5` wieder nutzbar
- **Mehrwert:** Wer auf diese Modelle gebaut hatte, kann sie wieder produktiv einsetzen — die vorherige Nicht-Verfügbarkeit ist aufgehoben.
- **Version:** Platform API (1.7.)

---

### Woche 27 (30. Juni 2026) — v2.1.197

---

### [Claude Sonnet 5 — neues Default-Modell mit 1M-Kontext]
- **Was:** Claude Sonnet 5 ist jetzt das Standard-Modell in Claude Code. Es bringt ein natives 1-Million-Token-Kontextfenster mit und läuft zur Einführung zum Aktionspreis von 2 $ / 10 $ pro Mtok (Input/Output) bis zum 31. August 2026. Für den Zugang ist ein Update auf v2.1.197 nötig.
- **Einsatz:** Auf v2.1.197 aktualisieren; Sonnet 5 ist danach automatisch voreingestellt (Modellwahl weiterhin über `/model`)
- **Mehrwert:** Deutlich größerer Kontext (1M Token) zum vergünstigten Einführungspreis — große Codebasen und lange Sessions passen ohne Aufteilung in ein einziges Fenster, bei niedrigeren Token-Kosten.
- **Version:** v2.1.197

---

### Platform / API (30. Juni 2026)

---

### [Claude Sonnet 5 auf der API — Verhaltensänderungen & neuer Tokenizer]
- **Was:** Claude Sonnet 5 (`claude-sonnet-5`) ist auch auf der Claude API verfügbar: 1M-Token-Kontextfenster, 128k Max-Output, gleiche Tools/Features wie Sonnet 4.6 — **außer Priority Tier** (nicht unterstützt). Einführungspreis 2 $ / 10 $ pro Mtok bis 31.8.2026 (danach Standard 3 $ / 15 $). Beim Umstieg gelten drei Verhaltensänderungen: **Adaptive Thinking ist per Default an**; **manuelles Extended Thinking** (`thinking: {type: "enabled", budget_tokens: N}`) ist entfernt und liefert HTTP 400 (war auf 4.6 schon deprecated); und **Sampling-Parameter** (`temperature`, `top_p`, `top_k`) auf Nicht-Default-Werten liefern HTTP 400. Sonnet 5 nutzt zudem einen **neuen Tokenizer**, der für denselben Text ~30 % mehr Tokens erzeugt.
- **Einsatz:** `model: "claude-sonnet-5"`; manuelle Thinking-Budgets und abweichende Sampling-Werte aus dem Code entfernen; Token-Budgets für +30 % Tokenizer-Aufschlag neu kalkulieren
- **Mehrwert:** Größter Kontext zum Aktionspreis auch programmatisch nutzbar — aber Migration erfordert Anpassung, da Extended-Thinking- und Sampling-Aufrufe sonst mit 400 abbrechen.
- **Version:** Platform API (30.6.)

### [Managed Agents: Event-Deltas im Session-Event-Stream]
- **Was:** Session-Event-Streams für Claude Managed Agents unterstützen jetzt Event-Deltas. Per Opt-in über den Query-Parameter `event_deltas[]` auf `GET /v1/sessions/{session_id}/events/stream` liefern `event_start`- und `event_delta`-Events eine Vorschau auf den Text einer Agent-Nachricht, während er generiert wird — noch bevor das vollständige `agent.message`-Event eintrifft.
- **Einsatz:** `event_deltas[]`-Query-Parameter am Events-Stream-Endpoint setzen
- **Mehrwert:** Streaming-artige Live-Ausgabe von Managed-Agent-Antworten für responsivere UIs, statt auf die fertige Nachricht warten zu müssen.
- **Version:** Platform API (30.6.)

### [Managed Agents: Rückwärts-Paginierung beim Session-Listing]
- **Was:** `GET /v1/sessions` liefert jetzt neben `next_page` auch einen `prev_page`-Cursor. Diesen als `page`-Parameter übergeben, um zur vorherigen Seite zurückzublättern.
- **Einsatz:** `prev_page`-Cursor als `page` an `GET /v1/sessions` übergeben
- **Mehrwert:** Bidirektionales Blättern durch Session-Listen — vorherige Seiten sind ohne Neuaufbau der Paginierung erreichbar.
- **Version:** Platform API (30.6.)

### [Managed Agents: Agent-Konfiguration pro Session überschreiben]
- **Was:** Beim Erstellen einer Managed-Agents-Session lässt sich die Agent-Konfiguration nur für diese eine Session überschreiben. Mit `agent` und `type: "agent_with_overrides"` können Modell, System-Prompt, Tools, MCP-Server oder Skills ersetzt werden; der Agent selbst bleibt unverändert.
- **Einsatz:** `agent` mit `type: "agent_with_overrides"` beim Session-Erstellen übergeben
- **Mehrwert:** Ein-Session-Experimente und Sonderfälle (anderes Modell, angepasste Tools) ohne einen separaten Agent anlegen oder den Basis-Agent verändern zu müssen.
- **Version:** Platform API (30.6.)

### [Managed Agents: `injection_location` für Environment-Variable-Credentials]
- **Was:** Vaults für Managed Agents unterstützen jetzt ein `injection_location`-Setting auf Environment-Variable-Credentials (Tab „Environment variable"). Es steuert, ob der Wert beim Egress in die ausgehenden Request-Header, den Request-Body oder in beides eingesetzt wird.
- **Einsatz:** `injection_location` an der Credential konfigurieren
- **Mehrwert:** Feinsteuerung, wohin ein Secret injiziert wird — passend zu APIs, die den Token im Body statt im Header (oder in beiden) erwarten.
- **Version:** Platform API (30.6.)

### [Managed Agents: Webhooks für Agent-, Deployment- & Deployment-Run-Lifecycle]
- **Was:** Webhooks für Managed Agents decken jetzt den Lebenszyklus von Agent, Deployment und Deployment-Run ab. Man kann auf eine neu veröffentlichte Agent-Version, ein pausiertes Deployment oder einen fehlgeschlagenen geplanten Run reagieren — ohne zu pollen.
- **Einsatz:** Auf die neuen Event-Typen (Agent-, Deployment-, Deployment-Run-Events) unter „Subscribe to webhooks" subscriben
- **Mehrwert:** Ereignisgetriebene Automatisierung rund um Agent-Deployments (z. B. Alarm bei fehlgeschlagenem Scheduled Run) statt periodischem Status-Polling.
- **Version:** Platform API (30.6.)

---

### Woche 27 (29. Juni 2026) — v2.1.196

---

### [Organisations-Default-Modelle im Console setzen]
- **Was:** Admins können jetzt im Org-Console Default-Modelle festlegen. Im `/model`-Picker erscheinen sie als „Org default" (bzw. „Role default"), solange kein Modell manuell gewählt wurde.
- **Einsatz:** Default-Modell in der Org-Console konfigurieren; wirkt im `/model`-Menü
- **Mehrwert:** Organisationen steuern zentral, mit welchem Modell ihre Entwickler standardmäßig arbeiten — ohne dass jeder einzeln umstellen muss.
- **Version:** v2.1.196

### [Lesbare Session-Namen]
- **Was:** Sessions bekommen beim Start automatisch einen klickbaren, lesbaren Default-Namen — zur leichteren Identifikation und zum Anschreiben (Messaging).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sessions sind auf einen Blick auseinanderzuhalten, statt sich kryptische IDs merken zu müssen.
- **Version:** v2.1.196

### [Klickbare Datei-Anhänge im Chat]
- **Was:** Der Chat unterstützt jetzt klickbare Datei-Anhänge. Per Cmd/Ctrl-Klick wird die Datei direkt im Finder/Explorer angezeigt.
- **Einsatz:** Cmd/Ctrl-Klick auf einen Datei-Anhang
- **Mehrwert:** Schneller Sprung von einem referenzierten File zum tatsächlichen Speicherort im Dateisystem.
- **Version:** v2.1.196

### [Streaming-Idle-Watchdog standardmäßig aktiv]
- **Was:** Der Streaming-Idle-Watchdog ist jetzt für alle Provider per Default aktiviert: Er bricht ab und wiederholt, wenn ein Antwort-Stream 5 Minuten lang keine Events mehr liefert.
- **Einsatz:** Standardmäßig aktiv; abschalten mit `CLAUDE_ENABLE_STREAM_WATCHDOG=0`
- **Mehrwert:** Hängengebliebene Streams (z. B. bei Netz-/Provider-Problemen) blockieren nicht mehr endlos, sondern werden automatisch neu angestoßen.
- **Version:** v2.1.196

### [Agent-View: Öffnen aus Vordergrund-Session mit einem `←`]
- **Was:** Die Agents-Ansicht aus einer Vordergrund-Session zu öffnen verlangt jetzt nur noch ein einzelnes `←` statt zweier — analog zum Verhalten bei Hintergrund-Sessions.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Konsistente, schnellere Navigation in die Agent-Übersicht.
- **Version:** v2.1.196

### [MCP-Security: keine Selbst-Freigabe in nicht vertrauten Workspaces]
- **Was:** `claude mcp list`/`get` starten keine `.mcp.json`-Server mehr, die sich über eine eingecheckte `.claude/settings.json` in nicht vertrauten Workspaces selbst freigegeben hatten. Stattdessen erscheint `⏸ Pending approval`.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schließt eine Lücke, über die ein geteiltes Repo MCP-Server ohne explizite Zustimmung des Nutzers hätte starten können.
- **Version:** v2.1.196

### [Hintergrund-Sessions überleben Stops, Neustarts & Updates]
- **Was:** Lang laufende Befehle und Workflows überleben jetzt Prozess-Stops, Neustarts und Updates (auf Windows per Shell-Hand-off statt Kill). Von einem Daemon-Neustart getötete Worker setzen beim nächsten Öffnen der Agents-Ansicht automatisch an ihrem letzten Punkt fort.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Hintergrund-Arbeit geht bei Updates oder Abstürzen nicht mehr verloren — sie nimmt zuverlässig den Faden wieder auf.
- **Version:** v2.1.196

### [`/code-review`: ~25 % weniger Tokens]
- **Was:** `/code-review` führt seine fünf Cleanup-Finder zu einem zusammen, was den Token-Verbrauch um rund 25 % senkt.
- **Einsatz:** Automatisch aktiv (`/code-review`)
- **Mehrwert:** Günstigere und schnellere Code-Reviews bei gleichem Funktionsumfang.
- **Version:** v2.1.196

### [Bugfix-Sammlung v2.1.196]
- **Was:** Viele Fixes auf einen Schlag, u. a.: eine Hintergrund-Job-Transkript-Probe löschte Konversationen dauerhaft und führte Prompts erneut aus (Dateien werden jetzt beiseitegelegt statt gelöscht); flackernde Rate-Limit-Warnung und über-zählte Telemetrie bei parallelen Requests; doppelte Recap-Zeilen nach Background-Turns; PowerShell `git diff`/`git grep`, `egrep`/`fgrep` und gequotete `|`-Muster meldeten falsche Fehler; diverse `claude agents`-Panel-Probleme (Tastatur-Fokus, verlorene Subagent-Typen, falscher Status); `--dangerously-skip-permissions` fiel still auf Auto-Mode zurück statt den Bypass-Hinweis zu zeigen; durch Server-Neustart unterbrochene Remote-Sessions resumten nicht; mit `/cd` verschobene Sessions tauchten im alten Verzeichnis wieder auf; `claude plugin validate` übersprang lokale Plugins mit Quelle „." und stoppte nach der ersten Fehlerklasse; `Esc Esc` am Idle-Prompt öffnete das Rewind-Menü nicht mehr (Regression; Background-Agents jetzt mit `Ctrl+C` bzw. `Ctrl+X Ctrl+K` stoppen); MCP-OAuth forderte ohne angegebenen Scope den vollen `scopes_supported`-Katalog an und scheiterte mit `invalid_scope` bei GitLab-Self-Hosted und anderen Enterprise-IdPs; Plugin-Dependency-Versions-Pins wurden nicht respektiert, wenn der Marketplace als lokaler Ordner-Pfad (git-basiert) hinzugefügt war; `claude agents`-Session-Status (Completed-Zeilen kippten zwischen „Done" und „Needs your input", hängende Agents heißen jetzt „Needs attention", PR-Ergebnisse zeigen einen klickbaren Link); `/context` zeigte auf Bedrock 0 Tokens; `/deep-research` meldete Verifier-Fehler fälschlich als „all claims refuted"; und Voice-Diktat verschluckte Leerzeichen bzw. startete bei schnellem Tippen spurious die Aufnahme.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar stabilere Background-Jobs, Agents-Ansicht, PowerShell-Tooling und Voice-Diktat — plus ein behobener Datenverlust-Bug bei Konversationen.
- **Version:** v2.1.196

### [Terminal-UI: weniger Rendering pro Frame]
- **Was:** Die Terminal-UI überspringt während des Streamings No-op-Subtree-Walks, was das Rendering pro Frame reduziert. Remote Control wird zudem deaktiviert, wenn `ANTHROPIC_BASE_URL` auf einen Nicht-Anthropic-Host zeigt (analog zu Bedrock/Vertex/Foundry).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Flüssigere Ausgabe beim Streaming und konsistentes Remote-Control-Verhalten bei Drittanbieter-Endpunkten.
- **Version:** v2.1.196

---

### Woche 26 (26. Juni 2026) — v2.1.195

---

### [Mausklicks im Fullscreen deaktivierbar (`CLAUDE_CODE_DISABLE_MOUSE_CLICKS`)]
- **Was:** Die neue Umgebungsvariable `CLAUDE_CODE_DISABLE_MOUSE_CLICKS` schaltet im Fullscreen-Modus Maus-Klick/-Drag/-Hover ab, während das Scrollen mit dem Mausrad erhalten bleibt.
- **Einsatz:** `CLAUDE_CODE_DISABLE_MOUSE_CLICKS=1` setzen
- **Mehrwert:** Wer im Terminal lieber natives Markieren/Kopieren per Maus nutzt, behält die gewohnte Maussteuerung — ohne dass Claude Code die Klicks abfängt, aber weiterhin mit Mausrad-Scroll.
- **Version:** v2.1.195

### [Hook-Matcher mit Bindestrich matchen jetzt exakt]
- **Was:** Hook-Matcher mit Bindestrich-Bezeichnern (z. B. `code-reviewer`, `mcp__brave-search`) führten versehentlich zu Teilstring-Matches; sie matchen jetzt exakt. Um alle Tools eines MCP-Servers mit Bindestrich zu treffen, `mcp__brave-search__.*` verwenden.
- **Einsatz:** Automatisch aktiv (ggf. Matcher auf `…__.*` umstellen)
- **Mehrwert:** Hooks feuern wieder genau für die gemeinten Tools — keine unbeabsichtigten Treffer durch Teilstring-Überschneidungen mehr.
- **Version:** v2.1.195

### [Voice-Diktat: Fixes für macOS-Stille und sprachenfreie Auto-Submit-Erkennung]
- **Was:** Zwei Voice-Diktat-Fixes: Auf macOS wurde in langen Sessions nach Wechsel des Standard-Eingabegeräts nur noch Stille aufgenommen; das ist behoben. Außerdem feuerte das Auto-Submit nie für Sprachen ohne Wortzwischenräume (Japanisch, Chinesisch, Thai) — jetzt funktioniert es auch dort.
- **Einsatz:** Automatisch aktiv (`/voice`)
- **Mehrwert:** Zuverlässiges Diktat über lange Sessions und über Gerätewechsel hinweg, plus korrektes Auto-Submit für ostasiatische Sprachen.
- **Version:** v2.1.195

### [Voice-Modus auf Linux: „kein Mikrofon" vs. „SoX fehlt" unterschieden]
- **Was:** Der Voice-Modus auf Linux unterscheidet jetzt zwischen „kein Mikrofon vorhanden" und „SoX nicht installiert" — auch wenn SoX zwar installiert ist, aber kein Audio-Aufnahmegerät existiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Klarere Fehlerdiagnose beim Voice-Setup unter Linux — man weiß sofort, ob die Software oder die Hardware fehlt.
- **Version:** v2.1.195

### [Plugin-Fixes: Install-Consent & Enable/Disable bei abweichenden Namen]
- **Was:** Zwei Plugin-Korrekturen: Externe Plugins, die nur über die projektlokale `.claude/settings.json` aktiviert sind, verlangen jetzt auf jedem Lade-Pfad explizite Install-Zustimmung. Und `/plugin` Enable/Disable funktioniert jetzt auch, wenn der `name` in der `plugin.json` vom Namen des Marketplace-Eintrags abweicht.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sicherheit (kein stilles Laden projektaktivierter Plugins ohne Zustimmung) und Zuverlässigkeit beim Ein-/Ausschalten von Plugins mit abweichendem Namen.
- **Version:** v2.1.195

### [Hintergrund-Agents: Robustheit von Daemons & abgestürzten Tasks]
- **Was:** Mehrere Fixes für Hintergrund-Jobs: Sie verschwanden aus `claude agents` bzw. verloren Daten, wenn sie von einer neueren Claude-Code-Version geschrieben wurden; ein abgestürzter Task zeigte beim erneuten Öffnen bis zu 5 Sekunden lang einen leeren Bildschirm statt seines Neustarts; und Background-Agent-Daemons liefen unerreichbar weiter, wenn der Control-Socket nicht startete, was Neustarts blockierte.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Hintergrund-Agents überstehen Versions-Upgrades und Abstürze zuverlässig — kein Datenverlust, keine hängenden, unerreichbaren Daemons mehr.
- **Version:** v2.1.195

### [`claude agents`-Liste füllt die Höhe; Remote-Startup mit Provisioning-Checkliste]
- **Was:** Die „Completed"-Liste in `claude agents` füllt jetzt den verfügbaren vertikalen Platz; auf niedrigen Terminals wird der Header kompakter, damit Live-Sessions sichtbar bleiben. Zusätzlich zeigt der Remote-Session-Start eine Provisioning-Checkliste, während der Container hochfährt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Bessere Platznutzung in der Agent-Übersicht und transparenter Fortschritt beim Hochfahren von Remote-Sessions statt unkommentierter Wartezeit.
- **Version:** v2.1.195

---

### Platform / API (Juni 2026)

---

### [Fast Mode für Opus 4.6 entfernt]
- **Was:** Der Fast Mode für Claude Opus 4.6 wurde entfernt. Requests an `claude-opus-4-6` mit `speed: "fast"` laufen jetzt mit Standard-Geschwindigkeit, werden zu Standard-Raten abgerechnet und liefern **keinen Fehler** mehr. Das Feld `usage.speed` in der Antwort zeigt die tatsächlich genutzte Geschwindigkeit. Für weiterhin schnelle Antworten: Migration auf Claude Opus 4.8.
- **Einsatz:** `speed: "fast"` von `claude-opus-4-6` auf `claude-opus-4-8` umstellen; `usage.speed` zur Kontrolle prüfen
- **Mehrwert:** Klare Stilllegung des alten Fast Mode ohne harten Bruch — bestehende Requests brechen nicht ab, laufen aber zum Standardtarif; Opus 4.8 ist der neue Pfad für Fast Mode.
- **Version:** Platform-Release-Note 29.6.2026

### [Höhere API-Rate-Limits & konsolidierte Usage-Tiers (Start, Build, Scale)]
- **Was:** Die Rate-Limits der Claude API wurden über alle Tiers angehoben: Sonnet- und Haiku-Limits entsprechen jetzt auf jeder Stufe den Opus-Limits. Die Usage-Tiers wurden auf drei konsolidiert — **Start, Build, Scale**. Die meisten Organisationen rücken auf eine höhere Stufe; keine erhält niedrigere Limits als zuvor, keine Aktion nötig.
- **Einsatz:** Aktuellen Tier und Limits in der [Claude Console](https://platform.claude.com/settings/limits) einsehen
- **Mehrwert:** Mehr Durchsatz für Sonnet/Haiku ohne Zutun, und ein einfacheres, übersichtlicheres Tier-Modell.
- **Version:** Platform-Release-Note 26.6.2026

### [Fast Mode für Opus 4.7 deprecated (Entfernung 24.7.2026)]
- **Was:** Der Fast Mode für Claude Opus 4.7 ist als deprecated markiert; Entfernung am **24. Juli 2026**. Danach liefern Requests an `claude-opus-4-7` mit `speed: "fast"` einen Fehler. Migration: Fast Mode auf Claude Opus 4.8.
- **Einsatz:** `speed: "fast"` von `claude-opus-4-7` auf `claude-opus-4-8` umstellen
- **Mehrwert:** Frühzeitige Warnung, damit Integrationen mit Opus-4.7-Fast-Mode rechtzeitig migrieren, bevor der harte Cutoff greift.
- **Version:** Platform-Release-Note 25.6.2026

### [Claude Apps Gateway für Amazon Bedrock & Google Cloud]
- **Was:** Ein neuer „Claude apps gateway" bringt die Claude-Apps (Web/Desktop-Erlebnis, nicht nur die rohe API) über Amazon Bedrock und Google Cloud in die eigene Cloud-Umgebung.
- **Einsatz:** Über Bedrock bzw. Google Cloud bereitstellen (siehe Announcement-Post)
- **Mehrwert:** Unternehmen, die Daten in Bedrock/Google Cloud halten, können das Claude-App-Erlebnis innerhalb ihres bestehenden Cloud- und Compliance-Rahmens nutzen.
- **Version:** Blog-Ankündigung 29.06.2026

### [Claude in Microsoft Foundry allgemein verfügbar (GA)]
- **Was:** Claude in Microsoft Foundry ist jetzt allgemein verfügbar (General Availability).
- **Einsatz:** Claude-Modelle über Microsoft Foundry produktiv einsetzen
- **Mehrwert:** Foundry-Kunden erhalten einen offiziell unterstützten, GA-reifen Weg zu Claude — auch als Provider für Claude Code (`ANTHROPIC_*`-Foundry-Setups).
- **Version:** Blog-Ankündigung 29.06.2026

---

### Woche 26 (25. Juni 2026) — v2.1.193

---

### [Auto-Mode: alle Shell-Befehle durch den Klassifizierer leiten (`autoMode.classifyAllShell`)]
- **Was:** Mit der neuen Einstellung `autoMode.classifyAllShell` werden *alle* Bash-/PowerShell-Befehle durch den Auto-Mode-Klassifizierer geprüft — nicht mehr nur die Muster, die nach beliebiger Code-Ausführung aussehen.
- **Einsatz:** In den Settings `autoMode.classifyAllShell` aktivieren
- **Mehrwert:** Strengere Sicherheitsprüfung im Auto-Mode: auch unscheinbare Shell-Befehle laufen durch die Hintergrund-Sicherheitschecks, statt ungeprüft durchzurutschen.
- **Version:** v2.1.193

### [Auto-Mode: Ablehnungsgründe sichtbar gemacht]
- **Was:** Wenn der Auto-Mode eine Aktion blockiert, erscheint der konkrete Grund jetzt im Transkript, im Ablehnungs-Toast und unter „Recently denied" in `/permissions`.
- **Einsatz:** Automatisch aktiv (im Auto-Mode)
- **Mehrwert:** Man versteht sofort, *warum* eine Aktion abgelehnt wurde, statt nur zu sehen, *dass* sie blockiert wurde — erleichtert das Nachjustieren der Regeln.
- **Version:** v2.1.193

### [OpenTelemetry: Modell-Antworttext als Log-Event (`claude_code.assistant_response`)]
- **Was:** Ein neues OTel-Log-Event `claude_code.assistant_response` enthält den Antworttext des Modells. Standardmäßig redigiert; wird nur geloggt, wenn `OTEL_LOG_ASSISTANT_RESPONSES=1`. Ist die Variable nicht gesetzt, folgt sie `OTEL_LOG_USER_PROMPTS` — Deployments, die bereits Prompt-Inhalte loggen, erhalten nach dem Upgrade also auch Antwort-Inhalte. Mit `OTEL_LOG_ASSISTANT_RESPONSES=0` bleibt es bei reinem Prompt-Logging.
- **Einsatz:** `OTEL_LOG_ASSISTANT_RESPONSES=1` setzen (bzw. `=0` zum Deaktivieren)
- **Mehrwert:** Vollständigere Observability für Teams — Modell-Antworten lassen sich zentral auswerten; gleichzeitig wichtiger Hinweis zum Datenschutz beim Upgrade.
- **Version:** v2.1.193

### [Bash-Modus: Live-Autovervollständigung für Dateipfade]
- **Was:** Im Bash-Modus (`!`) vervollständigt Claude Code Dateipfade jetzt live während des Tippens.
- **Einsatz:** Automatisch aktiv (im `!`-Bash-Modus)
- **Mehrwert:** Schnelleres, fehlerfreieres Eingeben von Pfaden bei direkten Shell-Befehlen — kein Raten oder Abtippen langer Pfade mehr.
- **Version:** v2.1.193

### [Startup-Hinweis bei MCP-Servern, die Authentifizierung brauchen]
- **Was:** Beim Start erscheint jetzt ein Hinweis, wenn MCP-Server eine Authentifizierung benötigen, mit Verweis auf `/mcp`.
- **Einsatz:** Automatisch aktiv (bei Bedarf `/mcp` aufrufen)
- **Mehrwert:** Nicht authentifizierte MCP-Server fallen sofort beim Start auf, statt erst beim ersten fehlschlagenden Tool-Call — weniger rätselhafte MCP-Fehler.
- **Version:** v2.1.193

### [Automatisches Aufräumen untätiger Hintergrund-Shell-Befehle bei Speicherdruck]
- **Was:** Bei Speicherdruck beendet Claude Code automatisch untätige Hintergrund-Shell-Befehle, um Ressourcen freizugeben.
- **Einsatz:** Automatisch aktiv (Deaktivieren mit `CLAUDE_CODE_DISABLE_BG_SHELL_PRESSURE_REAP=1`)
- **Mehrwert:** Lange Sessions mit vielen Hintergrundprozessen bleiben stabiler und belegen weniger Speicher.
- **Version:** v2.1.193

### [Verbesserte Hintergrund-Agents: keine „end your response"-Anweisung mehr]
- **Was:** Das Start-Ergebnis eines Hintergrund-Agents weist Claude nicht mehr an, „die Antwort zu beenden" — Claude arbeitet stattdessen an anderen Aufgaben weiter, während der Agent läuft. Zusätzlich gefixt: Hintergrund-Agents werden beim Backgrounding nicht mehr fälschlich abgebrochen, gepinnte Agents werden nach jedem Auto-Update nicht mehr erneut „Continue from where you left off" gefragt, und das Backgrounding des Haupt-Turns erzeugt keinen Phantom-Subagent („general-purpose (resumed)") mehr, der die Konversation neu durchläuft.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Hintergrund-Agents laufen zuverlässig parallel weiter, ohne den Haupt-Thread auszubremsen oder Geister-Subagents zu spawnen.
- **Version:** v2.1.193

### [MCP `headersHelper`: automatische Re-Auth bei 401/403]
- **Was:** Der MCP-`headersHelper` wird jetzt automatisch erneut ausgeführt und verbindet neu, wenn ein Tool-Call mit 401/403 antwortet.
- **Einsatz:** Automatisch aktiv (für MCP-Server mit `headersHelper`-Auth)
- **Mehrwert:** Abgelaufene Tokens werden transparent erneuert — MCP-Verbindungen brechen bei Auth-Ablauf nicht mehr ab.
- **Version:** v2.1.193

### [Plugin-Auto-Rename folgt Marketplace-`renames`-Map]
- **Was:** Umbenennungen von Plugins über die `renames`-Map eines Marketplaces werden jetzt automatisch übernommen — die eigenen Settings werden auf den neuen Namen aktualisiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Plugins funktionieren nach einer Umbenennung durch den Anbieter ohne manuelles Eingreifen weiter.
- **Version:** v2.1.193

### [Sammel-Fixes & kleinere Verbesserungen v2.1.193]
- **Was:** Weitere Korrekturen: `/model` und andere client-daten-abhängige UI zeigen direkt nach `/login` keinen veralteten/leeren Zustand mehr; das Agent-Panel blendet beim Betrachten eines Subagents nicht mehr die Geschwister-Agents aus; die `/add-dir`-Meldung ist klarer, wenn das Verzeichnis bereits ein Arbeitsverzeichnis ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Rundere Bedienung bei Login, Agent-Panel und `/add-dir`.
- **Version:** v2.1.193

---

### Woche 26 (25. Juni 2026) — v2.1.191

---

### [`/rewind`: Konversation von vor einem `/clear` wiederherstellen]
- **Was:** `/rewind` kann eine Konversation jetzt aus dem Zustand *vor* einem `/clear` wiederherstellen — der zuvor verworfene Verlauf ist also nicht endgültig weg.
- **Einsatz:** Nach einem versehentlichen `/clear` einfach `/rewind` ausführen
- **Mehrwert:** Ein versehentliches `/clear` ist kein Datenverlust mehr — der frühere Gesprächsverlauf lässt sich gezielt zurückholen.
- **Version:** v2.1.191

### [Hintergrund-Agents lassen sich endgültig stoppen]
- **Was:** Über das Tasks-Panel gestoppte Hintergrund-Agents werden nicht mehr „wiederbelebt" — ein Stopp ist jetzt permanent.
- **Einsatz:** Automatisch aktiv (Agent im Tasks-Panel stoppen)
- **Mehrwert:** Verlässliche Kontrolle über laufende Agents — gestoppte Tasks bleiben gestoppt und verbrauchen keine Ressourcen mehr.
- **Version:** v2.1.191

### [~37 % weniger CPU-Last beim Streamen von Antworten]
- **Was:** Während des Streamens von Antworten werden Text-Updates jetzt auf 100 ms zusammengefasst, was die CPU-Auslastung um rund 37 % senkt. Zusätzlich wächst der Speicherverbrauch langer Sessions langsamer (Terminal-Output-Cache verkleinert).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar geringere Systemlast und stabilere lange Sessions — gerade auf schwächeren Maschinen oder bei langen Streaming-Antworten.
- **Version:** v2.1.191

### [Sandbox-Netzwerk-Freigaben werden für die Session gemerkt]
- **Was:** Im Sandbox-Netzwerk-Berechtigungsdialog mit „Yes" freigegebene Hosts werden jetzt für den Rest der Session gemerkt, statt bei jeder Verbindung erneut zu fragen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein wiederholtes Wegklicken desselben Host-Dialogs mehr — flüssigeres Arbeiten in der Sandbox.
- **Version:** v2.1.191

### [MCP-Zuverlässigkeit: Retries, bessere OAuth- & Fehlerausgaben]
- **Was:** Mehrere MCP-Verbesserungen: Capability-Discovery wiederholt vorübergehende Netzwerkfehler mit kurzem Backoff; OAuth-Discovery und Token-Requests wiederholen sich einmalig nach transienten Fehlern, und Headless-Umgebungen überspringen das Browser-Popup und gehen direkt zum URL-Einfügen-Prompt; HTTP-404-Fehler zeigen jetzt die URL und verweisen auf die MCP-Konfiguration.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabilere MCP-Server-Verbindungen trotz Netzwerk-Hängern und klarere Fehlermeldungen erleichtern die Fehlersuche bei MCP-Setups.
- **Version:** v2.1.191

### [`/voice`: klare Meldung bei Organisations-Sperre]
- **Was:** Wenn `/voice` durch eine Organisationsrichtlinie deaktiviert ist, erklärt die Meldung jetzt die Einschränkung, statt nur generisch „not available" zu zeigen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Nutzer verstehen sofort, warum ein Feature gesperrt ist, statt zu rätseln.
- **Version:** v2.1.191

### [Managed Settings: `forceRemoteSettingsRefresh` & frischere Policy-Fetches]
- **Was:** `forceRemoteSettingsRefresh` greift jetzt auch, wenn es per MDM oder Datei-Policy gesetzt wurde; der Fetch sendet zudem `Cache-Control: no-cache`, damit Proxys keine veralteten Antworten ausliefern.
- **Einsatz:** Automatisch aktiv (für verwaltete Deployments via MDM/Datei-Policy)
- **Mehrwert:** Zentrale Einstellungen erreichen verwaltete Geräte zuverlässig und ohne Proxy-Cache-Verzögerung.
- **Version:** v2.1.191

### [Sammel-Fixes & kleinere Verbesserungen v2.1.191]
- **Was:** Zahlreiche Korrekturen, u. a.: Scroll-Position springt beim Lesen älterer Ausgabe während eines Streams nicht mehr nach unten; Cmd+Klick auf Links im Fullscreen für Ghostty über ssh/tmux gefixt; `claude agents` sendet Builtin-Slash-Befehle (z. B. `/usage`) nicht mehr als Prompt-Text an Hintergrund-Sessions; eingefügte Bilder zeigen wieder `[Image #N]` statt voller Pfade; Hooks mit komma-getrennten Matchern (`"Bash,PowerShell"`) feuern wieder; `/permissions`-Tab „Recently denied" behält Freigaben beim Schließen; Agent-Panel springt beim Scrollen nicht mehr um eine Zeile; Welcome-Splash passt wieder ins 80×24-Terminal; `/login`-URL bricht im Windows Terminal nicht mehr ab; vim-Mode-Prompt-History-Suche weist auf Slash-Befehle hin.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Viele kleine Reibungspunkte in Scrolling, Hintergrund-Agents, Hooks, Permissions und Terminal-Darstellung verschwinden — insgesamt rundere Bedienung.
- **Version:** v2.1.191

---

### Woche 26 (24. Juni 2026) — v2.1.188 / v2.1.189 / v2.1.190

---

### [v2.1.190 — Bugfixes & Zuverlässigkeit]
- **Was:** Reiner Wartungs-Release: „Bug fixes and reliability improvements". Keine einzeln aufgeführten Changelog-Punkte.
- **Einsatz:** Automatisch aktiv (Update auf v2.1.190)
- **Mehrwert:** Allgemeine Stabilitäts- und Zuverlässigkeitsverbesserungen ohne neue, sichtbare Funktionen.
- **Version:** v2.1.190

### [v2.1.188 — Bugfixes & Zuverlässigkeit]
- **Was:** Reiner Wartungs-Release: „Bug fixes and reliability improvements". Keine einzeln aufgeführten Changelog-Punkte.
- **Einsatz:** Automatisch aktiv (Update auf v2.1.188)
- **Mehrwert:** Allgemeine Stabilitäts- und Zuverlässigkeitsverbesserungen ohne neue, sichtbare Funktionen.
- **Version:** v2.1.188

### [Hinweis: Versionsnummern-Verschiebung v2.1.187 → v2.1.189]
- **Was:** Das große Feature-Sammelpaket (`sandbox.credentials`, org-weite Modell-Restriktionen, Maus-Klick in Fullscreen-Menüs, `/install-github-app`-Workflow optional, `/btw`-Pfeilnavigation, `/plugin`-Aufräumhinweis, MCP-Tool-Idle-Timeout, StructuredOutput-Loop-Fix, Sammelpakete Remote/Agents-View/Worktrees & Eingabe/UI) ist im **kanonischen Changelog (CHANGELOG.md)** unter **v2.1.189** gelistet — hier weiter unten bereits vollständig unter v2.1.187 dokumentiert. Es handelt sich also nur um eine Versionsnummern-Verschiebung, **keine inhaltlichen Neuerungen**.
- **Einsatz:** —
- **Mehrwert:** Klarstellung gegen Doppel-Dokumentation: Wer auf v2.1.189 referenziert, findet dieselben Features hier unter v2.1.187.
- **Version:** v2.1.189

---

### Woche 25 (23. Juni 2026) — v2.1.187

---

### [`sandbox.credentials`: Sandbox-Befehle von Credentials & Secrets aussperren]
- **Was:** Neue Einstellung `sandbox.credentials` verhindert, dass in der Sandbox laufende Befehle Credential-Dateien und geheime Umgebungsvariablen lesen können.
- **Einsatz:** `sandbox.credentials` in den Settings setzen
- **Mehrwert:** Zusätzliche Schutzschicht — selbst kompromittierter oder fehlerhafter Sandbox-Code kommt nicht mehr an Tokens, API-Keys oder Secrets aus der Umgebung.
- **Version:** v2.1.187

### [Org-weite Modell-Beschränkungen im Model-Picker]
- **Was:** Von der Organisation konfigurierte Modell-Beschränkungen greifen jetzt im Model-Picker, bei `--model`, `/model` und `ANTHROPIC_MODEL`. Bei Auswahl eines gesperrten Modells erscheint die Meldung „restricted by your organization's settings".
- **Einsatz:** Automatisch aktiv (sofern die Organisation Modell-Restriktionen konfiguriert hat)
- **Mehrwert:** Unternehmen können verbindlich vorgeben, welche Modelle genutzt werden dürfen — der Nutzer sieht klar, warum ein Modell nicht wählbar ist.
- **Version:** v2.1.187

### [Maus-Klick in Auswahl-Menüs (Fullscreen-Modus)]
- **Was:** Auswahl-Menüs (Permission-Prompts, `/model`, `/config` usw.) lassen sich im Fullscreen-Modus jetzt per Mausklick bedienen.
- **Einsatz:** Im Fullscreen-Modus Menüeinträge direkt anklicken
- **Mehrwert:** Schnellere, intuitivere Bedienung — kein zwingendes Tab-/Pfeiltasten-Navigieren mehr in Dialogen.
- **Version:** v2.1.187

### [`/install-github-app`: GitHub-Actions-Workflow jetzt optional]
- **Was:** Bei `/install-github-app` ist das Einrichten des GitHub-Actions-Workflows nun optional — man kann nur die GitHub-App installieren und die Workflow-/Secret-Schritte überspringen.
- **Einsatz:** `/install-github-app` ausführen und die Workflow-Einrichtung überspringen
- **Mehrwert:** Wer nur die App-Integration will (z. B. ohne CI), spart sich die unnötigen Workflow- und Secret-Schritte.
- **Version:** v2.1.187

### [`/btw`: Pfeiltasten-Navigation durch frühere Antworten]
- **Was:** `/btw` unterstützt jetzt ←/→-Navigation, um durch frühere Antworten zu blättern.
- **Einsatz:** In `/btw` mit ←/→ zwischen den Antworten wechseln
- **Mehrwert:** Frühere Zwischenantworten lassen sich bequem erneut ansehen, ohne sie neu anzufordern.
- **Version:** v2.1.187

### [`/plugin`: selten genutzte Plugins zum Aufräumen]
- **Was:** `/plugin` hebt jetzt Plugins hervor, die man länger nicht genutzt hat, damit man sie aufräumen kann.
- **Einsatz:** `/plugin` öffnen
- **Mehrwert:** Hält die Plugin-Liste schlank — ungenutzte Plugins fallen auf und können gezielt entfernt werden.
- **Version:** v2.1.187

### [Remote-MCP-Tool-Calls: Timeout statt 5-Minuten-Hänger]
- **Was:** Remote-MCP-Tool-Calls, die 5 Minuten lang keine Antwort liefern, brechen jetzt mit einem Fehler ab, statt unbegrenzt zu blockieren. Das Timeout ist über `CLAUDE_CODE_MCP_TOOL_IDLE_TIMEOUT` einstellbar.
- **Einsatz:** Automatisch aktiv; Timeout per `CLAUDE_CODE_MCP_TOOL_IDLE_TIMEOUT` anpassbar
- **Mehrwert:** Hängende Remote-MCP-Server legen die Session nicht mehr für Minuten lahm — man bekommt einen sauberen Fehler und kann weiterarbeiten.
- **Version:** v2.1.187

### [Fix: Strukturierte Ausgabe (`--json-schema` / Workflow-`agent({schema})`)]
- **Was:** Das Modell kann `StructuredOutput` nach einem erfolgreichen Aufruf nicht mehr endlos erneut aufrufen; Folge-Turns liefern jetzt zuverlässig strukturierte Ausgabe.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabilere strukturierte Ausgaben in Skripten und Workflows — keine Endlos-Schleifen oder fehlende Schema-Antworten mehr.
- **Version:** v2.1.187

### [Fix: Sammelpaket Remote, Agents-View, Worktrees & Subagent-Tiefe]
- **Was:** Mehrere Fixes: `--resume` scheiterte mit „No conversation found", wenn der ursprüngliche `-p`-Lauf keine Modell-Turns erzeugte; Claude-Code-Remote-Sessions starteten ~2,7 s langsamer (Agent-Proxy-CA-Install); `/update` über Remote Control hing bei anstehendem Trust-Dialog; Hintergrund-Jobs in der Agents-View blieben endlos auf „working"; Channel-Verbindungen brachen nach Wechsel in die Agents-View (sowie nach `/bg`, `/tui`, `/update`); Agent-Stop-Benachrichtigungen ordneten den Verursacher falsch zu (jetzt „finished"/„stopped" statt „came to rest"); Subagent-Tiefe wird bei Resume/Fork korrekt verfolgt; verwaiste Worktree-Registrierungen getöteter Agents werden automatisch aufgeräumt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Robusteres Arbeiten mit Remote-Sessions, Hintergrund-Agents und Worktrees — weniger Hänger, korrektere Statusmeldungen und kein Müll in `.git/worktrees/`.
- **Version:** v2.1.187

### [Fix: Sammelpaket Eingabe, UI & Terminal]
- **Was:** Mehrere Fixes: eingefügter koreanischer/CJK-Text wurde in manchen Terminals zu Mojibake; Cmd+Klick öffnete URLs im Fullscreen-Modus von Ghostty (macOS) nicht; `claude --help` listete das `--bg`/`--background`-Flag nicht; Esc, Ctrl-C und Ctrl-D funktionierten während eines laufenden `/share`-Uploads nicht; die VSCode-Extension reagierte beim Fortsetzen einer großen Session nicht mehr.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Saubere Texteingabe (auch CJK), funktionierende Tastatur-/Maus-Shortcuts und eine reaktionsfähige VSCode-Extension auch bei großen Sessions.
- **Version:** v2.1.187

---

### Woche 25 (22. Juni 2026) — v2.1.186

---

### [`claude mcp login` / `claude mcp logout`: MCP-Auth ohne interaktives Menü]
- **Was:** Zwei neue CLI-Befehle `claude mcp login <name>` und `claude mcp logout <name>` authentifizieren bzw. melden einen MCP-Server ab — ohne den Umweg über das interaktive `/mcp`-Menü.
- **Einsatz:** `claude mcp login <server-name>` zum An-, `claude mcp logout <server-name>` zum Abmelden
- **Mehrwert:** MCP-Auth lässt sich direkt skripten und in Setup-/CI-Abläufe einbauen, statt jedes Mal das TUI-Menü zu bedienen.
- **Version:** v2.1.186

### [`!`-Bash-Befehle lösen automatische Claude-Antwort aus]
- **Was:** Ein mit `!` abgesetzter Bash-Befehl löst jetzt automatisch eine Claude-Antwort aus, statt nur die Ausgabe stumm anzuhängen. Abschaltbar über die Einstellung `"respondToBashCommands": false`.
- **Einsatz:** `!<befehl>` eingeben; zum Deaktivieren `respondToBashCommands` in den Settings auf `false` setzen
- **Mehrwert:** Claude reagiert sofort auf das Ergebnis eines manuell ausgeführten Befehls (z. B. Fehlermeldung, Test-Output), ohne dass man die Ausgabe extra kommentieren muss.
- **Version:** v2.1.186

### [`/workflows`: Status-Filter in der Agent-Detailansicht]
- **Was:** In der Agent-Detailansicht von `/workflows` filtert die Taste `f` die angezeigten Agents nach Status.
- **Einsatz:** In `/workflows` die Detailansicht öffnen und `f` drücken
- **Mehrwert:** Bei vielen parallelen Agents findet man laufende/blockierte/fertige schneller, ohne durch die ganze Liste zu scrollen.
- **Version:** v2.1.186

### [`/plugin`: eigene „Skills"-Sektion im Installed-Tab]
- **Was:** Der Installed-Tab von `/plugin` hat jetzt eine eigene „Skills"-Sektion.
- **Einsatz:** `/plugin` → Tab „Installed"
- **Mehrwert:** Installierte Skills sind übersichtlich an einem Ort sichtbar, getrennt von anderen Plugin-Bestandteilen.
- **Version:** v2.1.186

### [`teammateMode: "iterm2"` für Teammate-Panes]
- **Was:** Neue Einstellung `teammateMode: "iterm2"` lässt Teammates in iTerm2-Panes laufen; bei Fehlschlägen im Auto-Mode erscheint eine Warnung.
- **Einsatz:** In den Settings `teammateMode: "iterm2"` setzen (macOS/iTerm2)
- **Mehrwert:** Teammate-Sessions integrieren sich nativ in iTerm2 statt nur in tmux — passendere Fenster-/Pane-Verwaltung für iTerm2-Nutzer.
- **Version:** v2.1.186

### [`/login`: „Claude Platform on AWS — refresh credentials"]
- **Was:** Das `/login`-Menü bietet eine neue Option „Claude Platform on AWS - refresh credentials" zum Erneuern der AWS-Anmeldedaten.
- **Einsatz:** `/login` → „Claude Platform on AWS - refresh credentials"
- **Mehrwert:** Abgelaufene AWS-Credentials lassen sich direkt aus Claude Code erneuern, ohne die Session zu verlassen.
- **Version:** v2.1.186

### [Hintergrund-Subagents: Permission-Prompts in der Hauptsession statt Auto-Deny]
- **Was:** Braucht ein im Hintergrund laufender Subagent eine Berechtigung, wird der Prompt jetzt in der Hauptsession angezeigt, statt die Aktion automatisch abzulehnen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Hintergrund-Subagents bleiben bei berechtigungspflichtigen Schritten nicht mehr stillschweigend hängen — man kann sie gezielt freigeben.
- **Version:** v2.1.186

### [Agent-Teams erben das `--effort`-Level des Leiters]
- **Was:** Teammates übernehmen jetzt das `--effort`-Level der Leiter-Session.
- **Einsatz:** Automatisch aktiv (Agent-Teams)
- **Mehrwert:** Einheitliches Effort-Niveau im ganzen Team — kein versehentlich abweichender Aufwand bei einzelnen Teammates.
- **Version:** v2.1.186

### [`CLAUDE_CODE_MAX_RETRIES`-Cap auf 15 + `CLAUDE_CODE_RETRY_WATCHDOG`]
- **Was:** Die Obergrenze für `CLAUDE_CODE_MAX_RETRIES` wurde auf 15 angehoben; für unbeaufsichtigte Sessions gibt es zusätzlich den `CLAUDE_CODE_RETRY_WATCHDOG`.
- **Einsatz:** `CLAUDE_CODE_MAX_RETRIES` (bis 15) bzw. `CLAUDE_CODE_RETRY_WATCHDOG` als Env-Variablen setzen
- **Mehrwert:** Robustere lang laufende/unbeaufsichtigte Läufe — mehr Wiederholungsversuche und ein Watchdog gegen festhängende Retries.
- **Version:** v2.1.186

### [`claude mcp get` / `claude mcp remove`: Tippfehler-Vorschläge]
- **Was:** `claude mcp get` und `claude mcp remove` schlagen bei vertippten Server-Namen den wahrscheinlich gemeinten Namen vor.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Frust bei Tippfehlern — man muss den exakten Server-Namen nicht aus dem Kopf treffen.
- **Version:** v2.1.186

### [Fix: Sammelpaket Streaming, Sessions & UI]
- **Was:** Mehrere Fixes: Streaming-Requests scheiterten nach Ruhezustand der Maschine mit „Content block not found"; die Scroll-Position eines Subagent-Transkripts blutete ins Haupt-Transkript; die Vorschau von Hintergrund-Tasks blitzte mit rohen Tool-Namen auf; Chrome-Tab-Gruppen-Isolation für parallele CLI-Sessions; doppelte Hintergrund-Session-Recaps; diverse UI-Probleme (Ausrichtung der Permission-Prompts, Subagent-Dismissal, Strikethrough-Rendering). Außerdem verbesserte Memory-Compaction-Hinweise.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabileres Streaming nach Standby, saubere Transkript-Anzeige und ruhigere, korrekte UI bei parallelen Sessions und Hintergrund-Tasks.
- **Version:** v2.1.186

### [`/review <pr>` nutzt jetzt die `/code-review medium`-Engine]
- **Was:** Der Befehl `/review <pr>` läuft jetzt über dieselbe Review-Engine wie `/code-review medium`.
- **Einsatz:** `/review <pr-nummer>`
- **Mehrwert:** PR-Reviews liefern dieselbe, ausgereiftere Befund-Qualität wie `/code-review` — kein zweiter, abweichender Review-Pfad mehr.
- **Version:** v2.1.186

### [`claude mcp login --no-browser`: MCP-Auth über SSH]
- **Was:** `claude mcp login <name>` unterstützt jetzt `--no-browser` mit stdin-Redirect, um die Authentifizierung über SSH abzuschließen (statt einen lokalen Browser zu öffnen).
- **Einsatz:** `claude mcp login <server-name> --no-browser`
- **Mehrwert:** MCP-Server lassen sich auch auf Remote-/Headless-Maschinen ohne Browser per SSH anmelden.
- **Version:** v2.1.186

### [Skill-Frontmatter: case-insensitive Keys + robustes Handling fehlerhafter `SKILL.md`]
- **Was:** Die Frontmatter-Keys `display-name`, `default-enabled`, `fallback` und `metadata.*` werden jetzt in kebab-case, snake_case und camelCase akzeptiert. Bei fehlerhaftem YAML-Frontmatter wird der Skill-Body mit leeren Metadaten geladen, statt still zu scheitern.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Reibung beim Skill-Schreiben — Schreibweise der Keys ist egal, und ein YAML-Tippfehler legt den Skill nicht mehr lautlos lahm.
- **Version:** v2.1.186

### [Workflow-Subagents mit `{schema}` brechen nach 5 Fehlversuchen ab]
- **Was:** Workflow-`agent({schema})`-Subagents, die wiederholt an der Schema-Validierung scheitern, brechen jetzt nach 5 Versuchen ab, statt endlos zu loopen.
- **Einsatz:** Automatisch aktiv (Workflows mit `schema`-Option)
- **Mehrwert:** Ein Subagent, der das geforderte Schema nie trifft, blockiert nicht mehr den ganzen Workflow — der Lauf scheitert kontrolliert statt hängenzubleiben.
- **Version:** v2.1.186

### [Agent-Deny-/Allowed-Types-Regeln greifen für benannte Subagent-Spawns]
- **Was:** `Agent(type)`-Deny-Regeln und `Agent(x,y)`-Allowed-Types-Beschränkungen werden jetzt auch beim Spawnen benannter Subagents durchgesetzt.
- **Einsatz:** Automatisch aktiv (Permission-Regeln für Agent-Typen)
- **Mehrwert:** Berechtigungsregeln für Subagent-Typen lassen sich nicht mehr durch benannte Spawns umgehen — verlässlichere Eingrenzung, welche Agent-Typen laufen dürfen.
- **Version:** v2.1.186

---

### Woche 25 (20. Juni 2026) — v2.1.185

---

### [Klarerer Stream-Stall-Hinweis: „Waiting for API response"]
- **Was:** Der Hinweis bei stockendem Antwort-Stream lautet jetzt „Waiting for API response · will retry in …" statt „No response from API · Retrying in …" und erscheint erst nach 20 Sekunden Stille statt nach 10.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Fehlalarme bei kurzen Pausen (erst nach 20 s) und eine ruhigere, präzisere Formulierung — die Verbindung gilt nicht sofort als abgerissen, sondern als „wird abgewartet".
- **Version:** v2.1.185

---

### Woche 25 (19. Juni 2026) — v2.1.183 + Blog-Ankündigungen (18. Juni)

---

### [Claude Code unterstützt Artifacts]
- **Was:** Claude Code kann den Arbeitsfortschritt einer Session als Artifact festhalten — eine live aktualisierte, teilbare Visual-Page (z. B. PR-Walkthrough, System-Erklärung, Dashboard, Incident-/Release-Checkliste). Das Artifact wird aus dem vollen Session-Kontext gebaut (Codebase, Connectors, Konversation) und aktualisiert sich, während die Session weiterarbeitet; bei jedem Publish entsteht eine neue Version unter demselben Link mit Versionshistorie und Restore.
- **Einsatz:** In der Session ein Artifact erstellen/aktualisieren lassen; Teilen erfolgt direkt von der Seite an Teammitglieder/Organisation. Standardmäßig privat für den Autor, nur für authentifizierte Org-Mitglieder sichtbar (nicht öffentlich machbar). Admins steuern Zugriff per Org-Toggle, Rollen-Scoping, Retention-Policy und Compliance-API.
- **Mehrwert:** Aus einer Coding-Session entsteht ohne Mehraufwand eine lebende Doku-/Statusseite — Teammitglieder sehen Updates sofort, eine Incident-Seite bündelt z. B. fehlschlagenden Test, betroffene Funktion, Monitoring-Spike und Root-Cause-Analyse an einem Ort.
- **Version:** Blog-Ankündigung 18.06.2026

### [Zentral verwaltete Authorization für MCP-Connectors (Enterprise)]
- **Was:** Admins verbinden ihren Identity-Provider (zunächst Okta) mit Claude und provisionieren MCP-Connectors organisationsweit. Zugriff läuft über bestehende IdP-Gruppen/Rollen statt über Einzel-Autorisierungen; Connectors erscheinen beim Login automatisch passend zur Gruppenzugehörigkeit — konsistent über Claude Chat, Claude Code und Cowork.
- **Einsatz:** Enterprise-Admins koppeln den IdP, mappen Connectors auf Gruppen/Rollen und können erzwingen, dass Connectors nur über den IdP laufen (trennt Arbeits- von Privat-Accounts). Optional kürzere Token-Lebensdauern für schnelleres Deprovisioning.
- **Mehrwert:** Kein manuelles Connector-Onboarding mehr (`„2.000 Mitarbeiter über Okta, null Extra-Schritte"`); zentrale Governance und schnelles Sperren beim Ausscheiden, eingebettet in die vorhandene Identity-Infrastruktur.
- **Version:** Blog-Ankündigung 18.06.2026

### [Auto-Mode: Schutz vor destruktiven Git- und IaC-Befehlen]
- **Was:** Im Auto-Mode werden destruktive Git-Befehle (`git reset --hard`, `git checkout -- .`, `git clean -fd`, `git stash drop`) blockiert, wenn du nicht ausdrücklich um das Verwerfen lokaler Arbeit gebeten hast. `git commit --amend` wird blockiert, wenn der Commit nicht in dieser Session vom Agent erstellt wurde, und `terraform destroy` / `pulumi destroy` / `cdk destroy` nur erlaubt, wenn du genau diesen Stack genannt hast.
- **Einsatz:** Automatisch aktiv (Auto-Mode)
- **Mehrwert:** Schützt vor versehentlichem Verlust uncommitteter Arbeit oder dem Abriss von Infrastruktur — die gefährlichsten Befehle brauchen jetzt eine explizite Aufforderung.
- **Version:** v2.1.183

### [Warnung bei veraltetem oder automatisch ersetztem Modell]
- **Was:** Wird ein angefordertes Modell deprecated oder automatisch auf ein neueres umgestellt, erscheint eine Warnung auf stderr — im Print-Modus (`-p`) und jetzt auch für Modelle, die in Agent-Frontmatter gesetzt sind.
- **Einsatz:** Automatisch aktiv (sichtbar in `-p` / bei Agent-Frontmatter-Modellen)
- **Mehrwert:** Keine stillen Modellwechsel mehr — du merkst sofort, wenn dein gewünschtes Modell nicht (mehr) verwendet wird.
- **Version:** v2.1.183

### [`attribution.sessionUrl`: claude.ai-Session-Link aus Commits/PRs weglassen]
- **Was:** Neue Einstellung `attribution.sessionUrl`, um den claude.ai-Session-Link aus Commits und PRs in Web- und Remote-Control-Sessions zu entfernen.
- **Einsatz:** In den Settings `attribution.sessionUrl` entsprechend setzen
- **Mehrwert:** Saubere Commit-/PR-Historie ohne interne Session-Links — relevant für öffentliche Repos oder strikte Commit-Konventionen.
- **Version:** v2.1.183

### [`/config --help`: alle Shorthand-Keys auflisten]
- **Was:** `/config --help` listet alle verfügbaren Shorthand-Keys für die `/config key=value`-Syntax auf.
- **Einsatz:** `/config --help`
- **Mehrwert:** Man muss sich die Setting-Keys nicht merken — die gültigen Kürzel sind direkt im Prompt abrufbar.
- **Version:** v2.1.183

### [`/config`-Toggle: Enter/Space ändern, Esc speichert]
- **Was:** Im `/config`-Toggle ändern jetzt sowohl Enter als auch Space die gewählte Einstellung, und Esc speichert und schließt, statt zu verwerfen.
- **Einsatz:** Automatisch aktiv (`/config`-Dialog)
- **Mehrwert:** Intuitiveres Verhalten — versehentliches Verwerfen mit Esc passiert nicht mehr.
- **Version:** v2.1.183

### [Startup: „setup issues"-Zeile unter dem Logo entfernt]
- **Was:** Die „setup issues"-Zeile unter dem Logo beim Start wurde entfernt — Konfigurationsprobleme zeigt jetzt `/doctor` bzw. `--debug`.
- **Einsatz:** `/doctor` oder Start mit `--debug` für Konfig-Diagnose
- **Mehrwert:** Aufgeräumterer Startbildschirm; Diagnose bleibt gezielt abrufbar.
- **Version:** v2.1.183

### [Fix: Sammelpaket Subagents, Teammates & Tasks]
- **Was:** Mehrere Fixes: `thinking.disabled.display`-400-Fehler (`Extra inputs are not permitted`) bei Subagent-Spawns und Session-Titel-Generierung behoben; WebSearch lieferte in Subagents leere Ergebnisse; user-level Skills tauchten bei mehreren aktiven Plugins mehrfach im Slash-Command-Autocomplete auf; MCP-Server, die Auth erfordern, legten dem Modell im Headless-/SDK-Modus Auth-Stub-Tools offen; tmux-Teammate-Panes starteten bei langsamer Shell-rc-Initialisierung nicht (und Tastatureingaben während des Spawns leakten in das neue Pane); Hintergrund-Tasks eines Teammates wurden beim Turn-Ende des Teammates gekillt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verlässlichere Subagent-/Teammate-Workflows und keine störenden 400-Fehler oder verlorenen Background-Tasks mehr.
- **Version:** v2.1.183

### [Fix: Sammelpaket TUI, vim & Anzeige]
- **Was:** Mehrere Anzeige-Fixes: Terminal-Cursor blieb nach History-Navigation im vim-Modus mit nativem Cursor oberhalb des Prompts hängen; Fullscreen-TUI-Korruption (Statusline mitten im Bild, doppelte Spinner-Zeilen, verschmolzener Text) im Windows Terminal unter starker verschachtelter Subagent-Last; Turns endeten stumm ohne sichtbare Ausgabe, wenn das Modell nur einen Thinking-Block lieferte (Claude promptet jetzt einmal nach); Focus-Mode zeigte „Ran N PostToolUse hooks"-Timing-Zeilen unter jeder Antwort.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabilere, sauberere Darstellung — besonders bei vim, Windows Terminal und vielen parallelen Subagents.
- **Version:** v2.1.183

### [Fix: Scheduled Tasks & Webhooks nicht mehr als Tastatureingabe]
- **Was:** Scheduled-Task- und Webhook-Trigger-Zustellungen wurden als Tastatureingabe behandelt; sie werden jetzt als Task-Benachrichtigungen klassifiziert und können im Auto-Mode keine ausstehende Aktion mehr genehmigen oder den Session-Titel setzen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Automatisierte Trigger können keine sicherheitsrelevanten Bestätigungen mehr versehentlich auslösen — sicherer im unbeaufsichtigten Betrieb.
- **Version:** v2.1.183

---

### Blog-Ankündigungen (17. Juni 2026)

---

### [Claude Design bleibt „on brand" — mit Sync zu Claude Code]
- **Was:** Claude Design importiert und erzwingt jetzt Design-System-Komponenten: Man bindet Komponenten aus GitHub-Repos, Design-Dateien oder Direkt-Uploads ein, Claude baut damit und prüft jeden Output gegen die Marken-Vorgaben, bevor er angezeigt wird. Admins können ein Standard-System freigeben und gegen Änderungen sperren, sodass alle Arbeiten den Firmen-Guidelines entsprechen. Pro Turn werden im Schnitt weniger Tokens bei besseren Ergebnissen und deutlich weniger Fehlern verbraucht.
- **Einsatz:** In Claude Design (claude.ai/design bzw. Desktop-Sidebar) ein Design-System importieren; Übergabe Design→Code per `/design-sync` und `/design` direkt in Claude Code für nahtlose Handoffs mit konsistenten Komponenten. Verfügbar für Pro, Max, Team und Enterprise.
- **Mehrwert:** Designvorlagen und Code bleiben markenkonform und synchron — Entwickler ziehen geprüfte Komponenten ohne Stilbruch in den Code, statt Design-Specs manuell nachzubauen.
- **Version:** Blog-Ankündigung 17.06.2026

### [Workload Identity Federation (WIF) für die Claude Platform — jetzt allgemein verfügbar]
- **Was:** WIF ist auf der Claude Platform allgemein verfügbar und ersetzt statische API-Keys durch kurzlebige, scope-begrenzte Credentials, die zur Request-Zeit ausgestellt werden. Externe Identitäten (AWS-IAM-Rollen, GCP-Service-Accounts, GitHub-Actions-Tokens etc.) werden an Service-Accounts der Claude Platform gebunden — kein Verwalten statischer Secrets mehr. Die Console bietet geführte Konfiguration mit Validierung und Test-Befehl; API-Keys laufen parallel weiter, sodass man Workload für Workload migrieren kann.
- **Einsatz:** In der Claude Console WIF einrichten (externe Identität an Service-Account binden); Migration schrittweise, da Keys und WIF koexistieren. Org-weite/programmatische Konfiguration über die Admin-API.
- **Mehrwert:** Schluss mit langlebigen API-Keys in CI/CD und Prod — kurzlebige, gescopte Credentials senken das Leak-Risiko und passen in bestehende IAM-/OIDC-Infrastruktur, von GitHub-Actions-Startups bis Enterprise.
- **Version:** Blog-Ankündigung 17.06.2026

---

### Platform-Update (18. Juni 2026)

---

### [Code-Execution-Tool `code_execution_20260120`: SDK-Support in allen Sprach-SDKs]
- **Was:** Die SDKs für Python, TypeScript, Go, Java, Ruby, PHP und C# unterstützen jetzt `code_execution_20260120` — die Version des Code-Execution-Tools mit persistentem REPL-State und der Mindestversion für Programmatic Tool Calling. Zum Aktivieren den `type` des Tools auf `code_execution_20260120` setzen; kein Beta-Header nötig. Verfügbar auf Claude Fable 5, Mythos 5, Opus 4.5+ und Sonnet 4.5+.
- **Einsatz:** Im SDK das Tool mit `type: "code_execution_20260120"` konfigurieren (Voraussetzung für Programmatic Tool Calling)
- **Mehrwert:** Code-Execution behält jetzt den REPL-Zustand über Zellen hinweg — Variablen und Importe bleiben erhalten — und schaltet zugleich Programmatic Tool Calling in allen offiziellen SDKs frei.
- **Version:** Platform Release Notes 18.06.2026

---

### Platform-Update (15. Juni 2026)

---

### [Claude Sonnet 4 und Opus 4 endgültig abgeschaltet (Retirement jetzt wirksam)]
- **Was:** Die zuvor angekündigte Abkündigung ist nun vollzogen: Sonnet 4 (`claude-sonnet-4-20250514`) und Opus 4 (`claude-opus-4-20250514`) wurden am 15.06.2026 auf der Claude API retired. Jeder Request an diese Modell-IDs liefert ab sofort einen Fehler. Empfohlene Migration: Sonnet 4.6 bzw. Opus 4.8. Forschende können über das External Researcher Access Program weiteren Zugang beantragen.
- **Einsatz:** Hartcodierte Modell-IDs `claude-sonnet-4-20250514` / `claude-opus-4-20250514` in Skripten, Agents und Configs auf `claude-sonnet-4-6` bzw. `claude-opus-4-8` umstellen
- **Mehrwert:** Klare Handlungsaufforderung — wer noch auf den alten IDs läuft, bekommt jetzt harte Fehler statt stiller Weiterleitung; rechtzeitiges Umstellen verhindert Pipeline-Ausfälle.
- **Version:** Platform Release Notes 15.06.2026

---

### Platform/API-Updates (11. Juni 2026)

---

### [Code-Execution-Tool: 90-Sekunden-Limit pro Zelle offengelegt (`code_execution_20260521`)]
- **Was:** Das Code-Execution-Tool der Claude API unterstützt jetzt die Version `code_execution_20260521`, die das 90-Sekunden-Zeitlimit pro Zellen-Ausführung direkt in der Tool-Beschreibung benennt — so kann das Modell lang laufende Zellen besser einplanen. Kein Beta-Header mehr nötig.
- **Einsatz:** API-Tool `code_execution_20260521` verwenden (z. B. in eigenen Agents/Skripten, die das Code-Execution-Tool nutzen)
- **Mehrwert:** Weniger abgeschnittene Zellen-Läufe — das Modell weiß um die Zeitgrenze und teilt rechenintensive Schritte sinnvoll auf.
- **Version:** Platform Release Notes 11.06.2026

### [Web Search / Web Fetch: `response_inclusion` zum Auslassen verbrauchter Result-Blöcke]
- **Was:** Web-Search- (`web_search_20260318`) und Web-Fetch-Tool (`web_fetch_20260318`) der Claude API bekommen einen `response_inclusion`-Parameter, mit dem bereits konsumierte Result-Blöcke aus der API-Antwort entfernt werden können. Kein Beta-Header nötig.
- **Einsatz:** In agentischen Workflows `response_inclusion` setzen, um Such-/Fetch-Ergebnisse nach Verarbeitung aus der Antwort zu droppen
- **Mehrwert:** Spart Tokens und hält den Kontext schlank — in langen agentischen Schleifen blähen alte Suchergebnisse die Antwort nicht mehr auf.
- **Version:** Platform Release Notes 11.06.2026

---

### Platform-Update (10. Juni 2026)

---

### [Self-Hosted-Sandbox `work`-Endpoint jetzt auf Claude Platform on AWS]
- **Was:** Der Endpoint `GET /v1/environments/{id}/work` — listet ausstehende Arbeit für eine Self-Hosted-Sandbox auf — ist jetzt auch auf der Claude Platform on AWS verfügbar. Autorisiert wird er über die neue IAM-Action `GetEnvironment`.
- **Einsatz:** In AWS-Deployments von Managed Agents mit Self-Hosted-Sandboxes `GET /v1/environments/{id}/work` abrufen; IAM-Policy um die Action `GetEnvironment` ergänzen.
- **Mehrwert:** AWS-Kunden erreichen Feature-Parität beim Self-Hosted-Sandbox-Polling über AWS-Billing und IAM-Auth — der eigene Sandbox-Worker fragt ausstehende Tool-Aufgaben innerhalb des AWS-Governance-Rahmens ab.
- **Version:** Platform Release Notes 10.06.2026

---

### Woche 25 (17. Juni 2026) — v2.1.181 / v2.1.180

---

### [`/config key=value`: jede Einstellung direkt aus dem Prompt setzen]
- **Was:** Neue Syntax `/config key=value`, um jede beliebige Einstellung mitten in der Konversation zu setzen (z. B. `/config thinking=false`). Funktioniert interaktiv, im `-p`-Modus und in Remote Control.
- **Einsatz:** `/config thinking=false`, `/config <key>=<value>`
- **Mehrwert:** Einstellungen lassen sich blitzschnell umschalten, ohne Menü oder Datei-Edit — auch scriptbar im headless-Modus und über Remote Control.
- **Version:** v2.1.181

### [`sandbox.allowAppleEvents`: Apple Events aus der Sandbox]
- **Was:** Neue Opt-in-Einstellung `sandbox.allowAppleEvents`, die sandboxed Befehle unter macOS Apple Events senden lässt.
- **Einsatz:** In den Settings `sandbox.allowAppleEvents: true` setzen
- **Mehrwert:** macOS-Automatisierung (AppleScript/`osascript`) funktioniert auch in der Sandbox, wenn man sie gezielt freigibt — ohne die Sandbox ganz aufzugeben.
- **Version:** v2.1.181

### [`CLAUDE_CLIENT_PRESENCE_FILE`: Push-Benachrichtigungen am Rechner unterdrücken]
- **Was:** Neue Umgebungsvariable `CLAUDE_CLIENT_PRESENCE_FILE` — zeigt sie auf eine Marker-Datei, werden mobile Push-Benachrichtigungen unterdrückt, solange du am Rechner sitzt.
- **Einsatz:** `CLAUDE_CLIENT_PRESENCE_FILE=/pfad/zur/marker-datei` setzen (Datei vorhanden = anwesend)
- **Mehrwert:** Keine doppelten Handy-Pings, wenn du ohnehin am Terminal arbeitest — Benachrichtigungen kommen nur, wenn du wirklich weg bist.
- **Version:** v2.1.181

### [Streaming langer Absätze: zeilenweise statt blockweise]
- **Was:** Langer Fließtext erscheint jetzt Zeile für Zeile, statt auf den ersten Zeilenumbruch zu warten.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Antworten wirken flüssiger und reaktiver — man liest mit, statt auf ganze Blöcke zu warten.
- **Version:** v2.1.181

### [Auto-Retry bei Verbindungsabbruch während des Denkens]
- **Was:** Bricht die API-Verbindung mitten in der Thinking-Phase ab, wird jetzt automatisch erneut versucht, statt „Connection closed while thinking" anzuzeigen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Wackelige Verbindungen unterbrechen den Denkprozess nicht mehr — die Anfrage läuft selbstständig weiter.
- **Version:** v2.1.181

### [Subagent-Panel: aufgeräumter und kompakter]
- **Was:** Inaktive Subagents verschwinden nach 30 s automatisch, die Liste ist auf 5 Zeilen mit Scroll-Hinweisen begrenzt und Tastatur-Hinweise erscheinen jetzt in der Fußzeile.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Bei vielen parallelen Subagents bleibt das Panel übersichtlich, statt den Bildschirm zu fluten.
- **Version:** v2.1.181

### [MCP-OAuth-Seite im Claude-Code-Look]
- **Was:** Die MCP-OAuth-Browser-Seite ist optisch an Claude Code angepasst und schließt sich bei Erfolg automatisch.
- **Einsatz:** Automatisch aktiv (bei MCP-OAuth-Flows)
- **Mehrwert:** Stimmigerer, reibungsloserer Auth-Flow — kein verwaistes Browser-Tab nach erfolgreicher Anmeldung.
- **Version:** v2.1.181

### [Vollbild: URLs nur noch per Cmd/Ctrl-Klick öffnen]
- **Was:** Im Vollbild-Modus öffnen sich URLs nur noch per Cmd-Klick (macOS) bzw. Ctrl-Klick — analog zum nativen Terminalverhalten.
- **Einsatz:** Automatisch aktiv (Vollbild-Modus)
- **Mehrwert:** Kein versehentliches Öffnen von Links bei normaler Textauswahl oder Klicks.
- **Version:** v2.1.181

### [Bun-Runtime auf 1.4 aktualisiert]
- **Was:** Die mitgelieferte Bun-Runtime wurde auf Version 1.4 angehoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Aktuellere Runtime mit Performance- und Stabilitätsverbesserungen unter der Haube.
- **Version:** v2.1.181

### [`Improved N memories`: keine Datei-Liste mehr außerhalb von Verbose]
- **Was:** Die Zeile `Improved N memories` listet die einzelnen Dateien nur noch im Verbose-Modus auf.
- **Einsatz:** Automatisch aktiv (Datei-Liste mit `--verbose`)
- **Mehrwert:** Weniger Rauschen in der normalen Ausgabe; Details bleiben bei Bedarf abrufbar.
- **Version:** v2.1.181

### [Fix: Prompt-Caching auf custom Base-URL und Foundry]
- **Was:** Prompt-Caching griff nicht bei eigener `ANTHROPIC_BASE_URL` und auf Foundry, weil ein Attestation-Token pro Request jede Runde wechselte. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Selbst-gehostete/Foundry-Setups profitieren wieder vom Prompt-Cache — günstiger und schneller.
- **Version:** v2.1.181

### [Fix: 0-Byte-/abgeschnittene Dateien auf Netzlaufwerken]
- **Was:** Write/Edit erzeugten auf Netzlaufwerken und Cloud-synchronisierten Ordnern teils 0-Byte- oder abgeschnittene Dateien. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Datei-Operationen sind auf Netz- und Cloud-Pfaden (OneDrive, NAS etc.) wieder verlässlich vollständig.
- **Version:** v2.1.181

### [Fix: Sammelpaket Start-Performance & -Stabilität]
- **Was:** Mehrere Startfehler behoben: ~120 ms Verzögerung pro Start in frischen Umgebungen (Regression aus 2.1.169, jetzt ohne Warten auf den Managed-Settings-Fetch ohne MCP-Server); bis zu 15 s blanker Terminal-Blockade bei langsamem Account-Settings-Fetch; Startabsturz (`TypeError: Cannot read properties of null`) bei korrupten Null-Projekt-Einträgen in `.claude.json`; macOS-TUI-Freeze (Ctrl+C tot) während Spotlight neu indexiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schnellerer, zuverlässigerer Start — keine Hänger, Freezes oder Abstürze beim Hochfahren mehr.
- **Version:** v2.1.181

### [Fix: verschachtelte Subagent-Ketten im Vordergrund begrenzt]
- **Was:** Vordergrund-Subagents konnten unbegrenzt verschachtelte Ketten starten — sie respektieren jetzt dasselbe 5-Ebenen-Tiefenlimit wie Hintergrund-Subagents.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schutz vor unkontrolliertem Subagent-Wildwuchs und damit verbundenem Ressourcen-/Token-Verbrauch.
- **Version:** v2.1.181

### [Fix: Sammelpaket Subagent-Anzeige]
- **Was:** Mehrere Subagent-Anzeigefehler behoben: Die „Thinking"-Dauer zeigte die Zeit des Eltern-Agents statt der eigenen; ein auf einen verschachtelten Agent wartender Subagent zeigte eine tickende Zeit statt „waiting"; `/recap` und Konversations-Forks nutzten direkt nach einem Modellwechsel noch das alte Modell.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Subagent- und Modellwechsel-Status sind jetzt korrekt und nachvollziehbar.
- **Version:** v2.1.181

### [Fix: lange Idle-Sessions verlieren ihren Verlauf nicht mehr]
- **Was:** Lang laufende inaktive Sessions verloren ihren Verlauf, wenn ein anderer Claude-Code-Prozess die 30-Tage-Transkript-Bereinigung ausführte. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Parallele Claude-Instanzen löschen sich nicht mehr gegenseitig die Historie weg — Idle-Sessions bleiben vollständig.
- **Version:** v2.1.181

### [Fix: macOS Apple-Events-Entitlement (Fehler -600)]
- **Was:** `open`, `osascript` und browserbasierte Auth-Flows scheiterten auf macOS mit Fehler -600 — durch das hinzugefügte Apple-Events-Entitlement behoben.
- **Einsatz:** Automatisch aktiv (macOS)
- **Mehrwert:** Link-Öffnen und OAuth-Flows funktionieren auf macOS wieder zuverlässig.
- **Version:** v2.1.181

### [Fix: Sammelpaket AWS/MCP-Credentials & -Status]
- **Was:** Mehrere Fixes: AWS-`awsCredentialExport`-Credentials mit kurzer Restlaufzeit lösten minütliche Refreshes aus (jetzt behoben, akzeptiert auch das JSON-Format von `aws configure export-credentials`); `claude mcp get`/`list` zeigte `✓ Connected`, obwohl `tools/list` fehlschlug — jetzt `! Connected · tools fetch failed` mit Fehlerdetail; `/remote-control` ließ eine veraltete „connecting…"-Zeile stehen und bestätigt jetzt im Transkript.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verlässlichere Credential-Handhabung und ehrlicher Verbindungsstatus — keine irreführenden „Connected"-Anzeigen oder Refresh-Stürme mehr.
- **Version:** v2.1.181

### [Fix: Sammelpaket UI, Clipboard & Eingabe]
- **Was:** Diverse UI-Fixes: Ctrl+V fügt jetzt Text ein, statt „No image found in clipboard" zu melden; Ctrl+C im Vollbild überschreibt nicht mehr die Zwischenablage mit alter App-Auswahl; AskUserQuestion-Vorschau bricht jetzt um statt am Dialogrand abzuschneiden; AskUserQuestion-Mehrfachauswahl verwirft getippte „Other"-Antworten nicht mehr; `/copy` und Copy-on-Select unter Linux erkennen jetzt auch nachträglich installierte Clipboard-Tools; IDE-Auswahl-Zeilennummern (IntelliJ/VS Code) waren um eins versetzt; Tab-eingerückter Code wird in der Write-Vorschau korrekt dargestellt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar weniger Reibung im Alltag — Clipboard, Eingabe-Dialoge und Code-Vorschau verhalten sich jetzt korrekt.
- **Version:** v2.1.181

### [Fix: weitere Stabilität (Windows/Worktree/Symlinks/Stats)]
- **Was:** ExitWorktree entfernt saubere Worktrees auch, wenn `git` unter Windows nicht auflösbar ist; Settings-Änderungen (`/effort`, `/model`) scheitern nicht mehr mit ENOENT bei relativ-symlinktem `~/.claude`; Agent-Anlage scheitert nicht mehr mit „EEXIST" bei bestehendem Agents-Verzeichnis (Windows/OneDrive); `/stats` zeigte „Most active day" und Tages-Chart in UTC-negativen Zeitzonen einen Tag zu früh; API-Retry-Indikator blieb nach Erfolg sichtbar. Alle behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger plattform- und Zeitzonen-spezifische Stolperfallen, korrekte Statistiken.
- **Version:** v2.1.181

### [v2.1.180: Stabilitäts-Release]
- **Was:** Reines Wartungs-Release mit Bugfixes und Zuverlässigkeitsverbesserungen ohne eigene detaillierte Changelog-Einträge.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Zwischenrelease zur Stabilisierung vor v2.1.181.
- **Version:** v2.1.180

---

### Woche 24/25 (16. Juni 2026) — v2.1.179

---

### [Fix: Verbindungsabbruch mitten im Stream]
- **Was:** Bricht die Verbindung während einer laufenden Antwort ab, bleibt die Teil-Antwort jetzt erhalten statt durch einen rohen Fehler ersetzt zu werden; zudem hängt der Spinner nicht mehr bei „running tool" fest.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Wackelige Netzverbindungen verlieren keinen bereits erzeugten Output mehr — die Session bleibt nutzbar statt mit Fehler oder Dauer-Spinner stehenzubleiben.
- **Version:** v2.1.179

### [Fix: Mausrad-Scrolling unter WSL2]
- **Was:** Mausrad-Scrolling im Windows Terminal und in VS Code unter WSL2 funktioniert wieder (Regression aus v2.1.172).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** WSL2-Nutzer können wieder normal durch lange Ausgaben scrollen.
- **Version:** v2.1.179

### [Fix: Sandbox-glob über großen Verzeichnisbaum]
- **Was:** Ein `denyRead`/`allowRead`-Glob über einen großen Verzeichnisbaum machte die Bash-Tool-Beschreibung riesig und die Session unter Linux unbenutzbar. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sandbox-Read-Regeln über große Baumstrukturen lähmen die Session nicht mehr — Bash bleibt nutzbar.
- **Version:** v2.1.179

### [Fix: Sammelpaket UI & Remote]
- **Was:** Mehrere Korrekturen: Die Feedback-Umfrage wertete eine einstellige Antwort direkt nach Turn-Ende fälschlich als Session-Bewertung; der Willkommensbildschirm stapelte mehrere Werbebanner (jetzt max. eines pro Session); Ctrl+O zeigte das Subagent-Transkript nicht; ein Klick ins Prompt-Eingabefeld holte den Fokus nicht aus dem Subagent-/Footer-Panel zurück; Remote-Session-Background-Tasks erschienen zwischen Turns fälschlich als „still running".
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Rundum sauberere UI-Bedienung — korrekte Fokus-/Transkript-Behandlung, kein Banner-Stapel, keine falschen Bewertungen oder Hängestatus.
- **Version:** v2.1.179

### [Plugin-Laden in Remote-Sessions schneller]
- **Was:** Die Plugin-Ladeleistung in Remote-Sessions wurde verbessert.
- **Einsatz:** Automatisch aktiv (Remote-Sessions)
- **Mehrwert:** Remote-Sessions mit Plugins starten und reagieren spürbar schneller.
- **Version:** v2.1.179

---

### Woche 24 (15. Juni 2026) — v2.1.178

---

### [`Tool(param:value)`: Permission-Regeln auf Tool-Parameter]
- **Was:** Neue Syntax für Permission-Regeln, die auf die Eingabe-Parameter eines Tools matcht (inkl. `*`-Wildcard) — z. B. `Agent(model:opus)`, um Opus-Subagents zu blockieren.
- **Einsatz:** In den Permission-Regeln Muster wie `Agent(model:opus)` oder `Tool(param:value)` setzen
- **Mehrwert:** Viel feinere Governance — man kann gezielt einzelne Parameter-Werte erlauben/sperren (etwa teure Modelle für Subagents), statt ein Tool nur ganz freizugeben oder ganz zu blockieren.
- **Version:** v2.1.178

### [Verschachtelte `.claude/skills` werden geladen]
- **Was:** Skills in verschachtelten `.claude/skills`-Verzeichnissen laden jetzt, wenn man an Dateien dort arbeitet. Bei Namenskollision erscheint der verschachtelte Skill als `<dir>:<name>`, sodass beide verfügbar bleiben.
- **Einsatz:** Automatisch aktiv (Skills in Unterverzeichnis-`.claude/skills` ablegen)
- **Mehrwert:** Monorepos/Teilprojekte können eigene, lokal gültige Skills mitbringen, ohne globale Namen zu überschreiben — kontextnahe Werkzeuge je nach Arbeitsverzeichnis.
- **Version:** v2.1.178

### [Verschachtelte `.claude/`-Verzeichnisse: nächstgelegene Definition gewinnt]
- **Was:** Bei Namenskollisionen gewinnen jetzt der Agent, Workflow und Output-Style aus dem `.claude/`-Verzeichnis, das dem Arbeitsverzeichnis am nächsten liegt. Projekt-Workflow-Saves zielen auf das nächstgelegene bestehende `.claude/workflows/`.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verschachtelte Konfigurationen verhalten sich intuitiv — lokale Overrides nahe am Code schlagen weiter entfernte Definitionen, ohne dass man umständlich umbenennen muss.
- **Version:** v2.1.178

### [Auto-Modus: Subagent-Spawns vor dem Start geprüft]
- **Was:** Subagent-Spawns werden im Auto-Modus jetzt vor dem Launch vom Klassifizierer bewertet — eine Lücke, durch die ein Subagent eine gesperrte Aktion ungeprüft anfordern konnte, ist geschlossen.
- **Einsatz:** Automatisch aktiv (Auto-Modus)
- **Mehrwert:** Auto-Modus-Guardrails greifen jetzt auch für von Subagents angeforderte Aktionen — keine Umgehung mehr über die Subagent-Ebene.
- **Version:** v2.1.178

### [`/doctor`: aufgeräumtes Layout]
- **Was:** `/doctor` zeigt jetzt ein konsistentes flaches Baum-Layout über alle Abschnitte, klarere Status-Icons pro Abschnitt und hervorgehobene Befehlsnamen.
- **Einsatz:** `/doctor` ausführen
- **Mehrwert:** Diagnose-Ausgaben sind schneller erfassbar — Probleme und betroffene Befehle springen direkt ins Auge.
- **Version:** v2.1.178

### [Workflow-Keyword: gezieltes Auslösen]
- **Was:** Das Workflow-Prompt-Keyword nutzt jetzt ein lila Shimmer-Highlight und löst nur noch bei expliziten Formulierungen wie „run a workflow" oder „workflow:" aus — nicht mehr bei jeder beiläufigen Erwähnung des Wortes.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Fehlauslösungen — Workflows starten nur, wenn man sie wirklich meint, und sind optisch klar markiert.
- **Version:** v2.1.178

### [`/bug`: Beschreibung jetzt Pflicht]
- **Was:** `/bug` verlangt jetzt vor dem Absenden eine Beschreibung und verwendet keinen Modell-Ablehnungstext mehr als GitHub-Issue-Titel.
- **Einsatz:** `/bug` mit Beschreibung nutzen
- **Mehrwert:** Sauberere, aussagekräftigere Bug-Reports — keine leeren oder mit Fehlertext betitelten Issues mehr.
- **Version:** v2.1.178

### [Remote-Control: klarere Fehlermeldungen]
- **Was:** Verbindungsfehler bei Remote Control zeigen jetzt einen dauerhaften roten „/rc failed"-Indikator in der Fußzeile; die „noch nicht aktiviert"-Meldung erklärt jetzt, ob es an einem Gate, einem fehlgeschlagenen Check, einem veralteten Entitlement oder einer Org-Policy liegt.
- **Einsatz:** Automatisch aktiv (Remote Control)
- **Mehrwert:** Man sieht sofort und verständlich, warum eine Remote-Verbindung scheitert — statt rätselhafter Fehlerzustände.
- **Version:** v2.1.178

### [Skill-Truncation-Warnung mit Anzahl]
- **Was:** Die Warnung bei abgeschnittener Skill-Liste zeigt jetzt, wie viele Skill-Beschreibungen betroffen sind.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Man erkennt das Ausmaß der Kürzung und kann gezielt aufräumen, statt blind zu raten.
- **Version:** v2.1.178

### [Fix: Sammelpaket Subagents]
- **Was:** Mehrere Subagent-Fixes: Das Anzeigen eines Subagent-Transkripts zeigt jetzt Tool-Ergebnisse und Live-Fortschritt; Nachrichten, die gesendet werden, während der Subagent seinen Turn beendet, gehen nicht mehr verloren; das Backgrounden eines laufenden Subagents (Ctrl+B) startet ihn nicht mehr von vorn.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Arbeiten mit Subagents wird nachvollziehbar und verlustfrei — kein Neustart bei Ctrl+B, voller Einblick ins Transkript.
- **Version:** v2.1.178

### [Fix: Compaction respektiert `--fallback-model`]
- **Was:** Compaction berücksichtigte das `--fallback-model` nicht — sie fällt jetzt bei Überlast oder Modell-Verfügbarkeitsfehlern auf die konfigurierte Fallback-Modell-Kette zurück.
- **Einsatz:** Automatisch aktiv (bei gesetztem `--fallback-model`)
- **Mehrwert:** Kontext-Verdichtung bricht nicht mehr ab, wenn das Hauptmodell überlastet ist — sie weicht auf das Fallback aus.
- **Version:** v2.1.178

### [Fix: Auth-Fehler nach externem Credential-Refresh]
- **Was:** Modell-Anfragen scheiterten weiter mit Auth-Fehlern, nachdem die Credentials außerhalb der Session erneuert wurden — Ursache war eine veraltete zwischengespeicherte Request-Konfiguration. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sessions erholen sich jetzt automatisch, wenn Credentials extern aktualisiert werden — kein manueller Neustart nötig.
- **Version:** v2.1.178

### [Fix: `claude agents` mit eigenem API-Gateway]
- **Was:** `claude agents`-Worker scheiterten mit `401 Invalid bearer token`, wenn der Daemon aus einer Shell mit eigenem API-Gateway (`ANTHROPIC_BASE_URL` + `ANTHROPIC_AUTH_TOKEN`) gestartet wurde. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Gateway-/Proxy-Setups funktionieren jetzt auch mit den `claude agents`-Workern.
- **Version:** v2.1.178

### [Fix: Sammelpaket Stabilität & Plattform]
- **Was:** Diverse Fixes: OOM-Crash, wenn die CLI eine veraltete Websocket-/OAuth-Filedescriptor-Umgebungsvariable vom Elternprozess erbt; Claude in Chrome verband sich still nicht, wenn das OAuth-Token zu einem anderen Account gehörte; verschachtelte Skills mit dir-qualifizierten Namen wurden in nicht-interaktiven Läufen von Permission-Prompts blockiert; Background-Sessions per `/bg`/`←←` zeigten ewig „Working"; MCP-Server-Level-Specs (`mcp__server`, `mcp__*`) in `disallowedTools` von Subagents wurden ignoriert; `CLAUDE_CODE_PLUGIN_KEEP_MARKETPLACE_ON_FAILURE=1` verhinderte frische Marketplace-Installs; Vim-Undo (`u`) schrittweise statt zusammengefasst; Statusline-Links mit eigenem URI-Schema (`vscode://`) öffneten in `claude agents` nicht; \[VSCode] Esc zum Schließen des CJK-IME-Fensters brach die laufende Aufgabe ab.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Breite Stabilitäts- und Plattform-Verbesserungen — weniger Crashes, korrekte Permission-/Plugin-Behandlung und sauberere Editor-/Windows-/IME-Integration.
- **Version:** v2.1.178

---

### Woche 24 (13. Juni 2026) — v2.1.177

---

### [v2.1.177: Reine Wartungs-Release]
- **Was:** Nur ein internes Housekeeping-Release (`chore: Update CHANGELOG.md and feed.xml`) — keine nutzerseitigen Features oder Fixes.
- **Einsatz:** Automatisch aktiv (nichts zu tun)
- **Mehrwert:** Keine funktionale Änderung; hier nur dokumentiert, damit v2.1.177 als aktuell jüngste Version nachvollziehbar ist.
- **Version:** v2.1.177

---

### Woche 24 (12. Juni 2026) — v2.1.176

---

### [Session-Titel in der Sprache der Konversation]
- **Was:** Session-Titel werden jetzt in der Sprache deiner Konversation generiert (statt fest auf Englisch). Über die neue `language`-Einstellung lässt sich eine feste Sprache erzwingen.
- **Einsatz:** Automatisch aktiv; optional in den Settings `language` setzen, um eine bestimmte Sprache zu pinnen
- **Mehrwert:** Wer auf Deutsch arbeitet, bekommt auch deutsche Session-Titel — die Sitzungsübersicht (`/resume`, Agents-View) wird konsistent und sofort lesbar.
- **Version:** v2.1.176

### [`footerLinksRegexes`: Eigene Link-Badges in der Fußzeile]
- **Was:** Neue Einstellung `footerLinksRegexes`, mit der sich per Regex erkannte Links als Badges in der Fußzeilen-Reihe anzeigen lassen — konfigurierbar über User- oder Managed-Settings.
- **Einsatz:** In den Settings `footerLinksRegexes` mit Regex-Mustern befüllen
- **Mehrwert:** Teams/Orgs können wiederkehrende Links (Tickets, Dashboards, interne Tools) als anklickbare Badges einblenden — schnellerer Sprung aus dem Terminal in die passenden Ressourcen.
- **Version:** v2.1.176

### [Bessere Bedrock-Credential-Cache-Strategie]
- **Was:** Credentials aus `awsCredentialExport` werden jetzt bis zu ihrem tatsächlichen `Expiration`-Zeitpunkt zwischengespeichert statt fest für 1 Stunde.
- **Einsatz:** Automatisch aktiv (Bedrock-Setups mit `awsCredentialExport`)
- **Mehrwert:** Weniger unnötige Credential-Refreshes und keine vorzeitigen Auth-Aussetzer mehr — stabilere, effizientere Bedrock-Sitzungen.
- **Version:** v2.1.176

### [Fix: `availableModels`-Allowlist gegen Alias-Umgehung gehärtet]
- **Was:** Über `ANTHROPIC_DEFAULT_*_MODEL`-Umgebungsvariablen ließen sich Alias-Modellwahlen bisher auf ein gesperrtes Modell umleiten — das ist jetzt unterbunden. Zudem verweigert `/fast` das Umschalten, wenn es auf ein Modell außerhalb der Allowlist wechseln würde.
- **Einsatz:** Automatisch aktiv (greift bei gesetzter `availableModels`-Allowlist)
- **Mehrwert:** Schließt zwei weitere Schlupflöcher der Modell-Governance — die Allowlist gilt jetzt auch gegen Env-Aliase und `/fast`, wichtig für regulierte Enterprise-Umgebungen.
- **Version:** v2.1.176

### [Fix: Auto-Modus scheiterte auf Fable 5 ohne Opus-4.8-Freigabe]
- **Was:** Der Auto-Modus schlug bei Organisationen ohne aktiviertes Opus 4.8 auf Fable 5 fehl — der Klassifizierer fällt jetzt auf das beste verfügbare Opus-Modell zurück.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Auto-Modus funktioniert jetzt auch in Orgs ohne Opus-4.8-Zugang zuverlässig — kein blockierter Workflow mehr.
- **Version:** v2.1.176

### [Fix: Hook-`if`-Bedingungen für Datei-Pfad-Muster]
- **Was:** Hook-`if`-Bedingungen für die Tools Read/Edit/Write matchten dokumentierte Muster wie `Edit(src/**)`, `Read(~/.ssh/**)` und `Read(.env)` nicht korrekt — jetzt behoben.
- **Einsatz:** Automatisch aktiv (betrifft Hooks mit pfadbasierten `if`-Bedingungen)
- **Mehrwert:** Pfadbasierte Hook-Regeln (z. B. Schutz für `.env`/`~/.ssh`) greifen jetzt wie dokumentiert — verlässliche Guardrails für sensible Dateien.
- **Version:** v2.1.176

### [Fix: Linux-Sandbox mit symlinkter `settings.json`]
- **Was:** Die Linux-Sandbox startete nicht, wenn `.claude/settings.json` ein Symlink mit absolutem Ziel war — behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Dotfile-Setups, die Settings per Symlink verwalten, funktionieren jetzt auch unter der Linux-Sandbox.
- **Version:** v2.1.176

### [Fix: `/copy` und Maus-Auswahl in tmux über SSH]
- **Was:** `/copy` und das Kopieren per Maus-Auswahl erreichten in tmux über SSH nicht die System-Zwischenablage; zudem lud der tmux-Paste-Buffer auf Versionen älter als 3.2 nicht. Beides behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kopieren aus Claude Code funktioniert jetzt zuverlässig in der verbreiteten tmux-über-SSH-Konstellation — relevant für Remote-Entwicklung auf Dev-Hosts.
- **Version:** v2.1.176

### [Fix: Diverse Remote-Control-Probleme behoben]
- **Was:** Sammlung von Fixes für Remote Control: Verbinden vom Web/Mobile schaltete still das Session-Modell um; Disconnect-Hinweise zeigten nur einen nackten Zahlencode statt eines lesbaren Grunds; fehlgeschlagene Verbindungen fügten eine doppelte Transkript-Zeile hinzu; Sessions trennten sich nicht beim Login mit einem anderen Account.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabilere, nachvollziehbarere Remote-Control-Sitzungen (Steuerung vom Handy/Web) — kein heimlicher Modellwechsel und verständliche Fehlermeldungen.
- **Version:** v2.1.176

### [Fix: Sammelpaket Background-Sessions & `claude agents`]
- **Was:** Mehrere Background-/Daemon-Fixes: Sessions zeigten nach `/bg` mitten im Turn ewig „Working", obwohl nichts mehr fortzusetzen war; PRs aus geplanten Wakeups erscheinen jetzt in der `claude agents`-Suche; Fixes für Windows (Netzwerkpfade, ReadOnly-`~/.claude/daemon`, fehlender Text-Cursor, `--bg -cn <name>`-Seeding); Respawn lehnt fehlerhafte Resume-IDs ab; Cloud-Sessions scheiterten nach langer Idle-Zeit mit „Could not resolve authentication method"; klarere Hinweise bei Versions-Skew nach Auto-Update (`claude daemon status`).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Background- und Cloud-Sessions laufen robuster und nachvollziehbarer — weniger hängende „Working"-Zustände, verlässliche Wiederaufnahme und bessere Windows-Unterstützung.
- **Version:** v2.1.176

### [Fix: Branch-Anzeige nach `/cd` und Worktree-Wechsel]
- **Was:** Nach `/cd` oder Worktree-Verschiebungen meldete die Session noch den Git-Branch des vorherigen Verzeichnisses — behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Die angezeigte Branch-Info stimmt jetzt nach Verzeichniswechseln — kein Verwechslungsrisiko mehr, auf welchem Branch man gerade arbeitet.
- **Version:** v2.1.176

---

### Woche 24 (12. Juni 2026) — v2.1.175

---

### [`enforceAvailableModels`: Default-Modell wird mit-eingeschränkt]
- **Was:** Neue Managed-Einstellung `enforceAvailableModels`. Ist sie aktiv, gilt die `availableModels`-Allowlist auch für das Default-Modell — löst „Default" auf ein nicht erlaubtes Modell auf, fällt es automatisch auf das erste erlaubte Modell zurück. Zudem können User- oder Projekt-Settings eine gemanagte `availableModels`-Liste nicht mehr aufweiten.
- **Einsatz:** Als Managed Setting `enforceAvailableModels` setzen (Enterprise-/Org-Policy)
- **Mehrwert:** Schließt das letzte Schlupfloch der Modell-Governance: Selbst über das Default-Modell oder lokale Settings lässt sich keine nicht freigegebene Modellklasse mehr erreichen — wichtig für strikt regulierte Enterprise-Setups.
- **Version:** v2.1.175

---

### Woche 24 (12. Juni 2026) — v2.1.174

---

### [`wheelScrollAccelerationEnabled`: Mausrad-Beschleunigung abschaltbar]
- **Was:** Neue Einstellung `wheelScrollAccelerationEnabled`, mit der sich die Mausrad-Scroll-Beschleunigung im Vollbild-Modus deaktivieren lässt.
- **Einsatz:** In den Settings `wheelScrollAccelerationEnabled: false` setzen
- **Mehrwert:** Präziseres, vorhersehbares Scrollen für alle, denen die beschleunigte Variante zu „springt" — besonders bei langen Transkripten.
- **Version:** v2.1.174

### [`/usage`-Attribution in VS Code]
- **Was:** Der „Account & usage"-Dialog (`/usage`) in VS Code zeigt jetzt eine Verbrauchs-Aufschlüsselung: Cache-Misses, Long-Context, Subagents sowie Aufteilung pro Skill/Agent/Plugin/MCP — wahlweise über die letzten 24 h oder 7 Tage.
- **Einsatz:** In VS Code `/usage` aufrufen
- **Mehrwert:** Endlich sichtbar, was die Plan-Limits real treibt — man erkennt teure Skills/Agents/MCP-Server und kann gezielt gegensteuern.
- **Version:** v2.1.174

### [Fix: `/model`-Picker zeigt die Default-Modellfamilie wieder]
- **Was:** Der `/model`-Picker blendete die Modellfamilie aus, auf die „Default" auflöst — jetzt erscheint Opus als eigene Zeile auf Max/Team-Premium/Enterprise, Sonnet auf Pro/Team und Opus auf Pay-as-you-go-API-Konten. Außerdem behoben: ein hartkodiertes Sonnet-Versionslabel, wenn `ANTHROPIC_DEFAULT_SONNET_MODEL` ein anderes Sonnet pinnt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Die Modellauswahl spiegelt wieder korrekt wider, welches Modell man tatsächlich nutzt — kein Rätselraten mehr, was hinter „Default" steckt.
- **Version:** v2.1.174

### [Fix: Falsches „Fable 5 verbraucht Credits"-Banner bei Enterprise]
- **Was:** Das Banner „Fable 5 is now consuming usage credits" erschien fälschlich auch bei Enterprise-Konten mit nutzungsbasierter Abrechnung — behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein irreführender Kosten-Hinweis mehr für Enterprise-Nutzer, deren Abrechnung ohnehin nutzungsbasiert läuft.
- **Version:** v2.1.174

### [Fix: Bedrock GovCloud-Regionen mit falschem Inference-Profil]
- **Was:** Bedrock-GovCloud-Regionen (`us-gov-*`) leiteten den falschen Inference-Profil-Präfix ab (`global` statt `us-gov`), was zu 400-Fehlern bei den abgeleiteten Modell-IDs führte — behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Claude Code läuft jetzt zuverlässig auf AWS GovCloud — relevant für öffentliche/regulierte Bedrock-Deployments.
- **Version:** v2.1.174

### [Fix: Background-Sessions erbten fremde Provider-Env]
- **Was:** Background-Sessions übernahmen die `ANTHROPIC_*`-Provider-Umgebung (Gateway-URL, Custom-Header, `/model`-Aliase) aus der Shell, die den Background-Daemon gestartet hatte — behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Background-Sessions nutzen jetzt die richtige Provider-Konfiguration statt versehentlich die einer anderen Session — verhindert subtile Fehlrouting-/Auth-Probleme.
- **Version:** v2.1.174

### [Fix: Skill-Hot-Reload sendet nur geänderte Skills]
- **Was:** Beim Hot-Reload wurde bisher das gesamte Skill-Listing erneut gesendet, sobald sich ein einziger Skill änderte — jetzt werden nur die tatsächlich geänderten Skills neu angekündigt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Geringerer Kontext-Overhead beim Iterieren an Skills — schnelleres, ressourcenschonenderes Skill-Development.
- **Version:** v2.1.174

### [Sammel-Bugfixes & Feinschliff (v2.1.174)]
- **Was:** Weitere Fixes: 1–2 s Pause beim Beenden von Claude Code kurz nach einem unterbrochenen/abgebrochenen Shell-Command (macOS/Linux) behoben; falscher Modellname in der Git-Commit-Co-Author-Attribution bei manchen Modellen korrigiert; der `/advisor`-Dialog wählte ein gespeichertes Advisor-Modell vor, das per `availableModels` blockiert war; Workflow-`agent()`-Subagents fehlten die Per-Agent-Attribution-Header; vorgewärmte Background-Worker scheiterten nach Leerlauf mit „Could not resolve authentication method".
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Reibung quer durch Shell-Handling, Git-Commits, Workflows und Background-Worker.
- **Version:** v2.1.174

---

### Woche 24 (11. Juni 2026) — v2.1.173

---

### [Fix: `[1m]`-Suffix bei Fable-5-Modellnamen wird normalisiert]
- **Was:** Modellnamen wie `claude-fable-5[1m]` wurden nicht normalisiert — da Fable 5 das 1M-Kontextfenster bereits standardmäßig mitbringt, wird das `[1m]`-Suffix jetzt automatisch entfernt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Bestehende Configs/Skripte mit `[1m]`-Suffix funktionieren weiter reibungslos, ohne dass man Modell-IDs anpassen muss.
- **Version:** v2.1.173

### [Fix: Falsche Sandbox-Warnung beim Start auf Windows]
- **Was:** Eine irreführende „sandbox dependencies missing"-Warnung beim Start auf Windows, wenn die Sandbox in den Settings aktiviert war, ist behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein falscher Alarm mehr beim Start — Windows-Nutzer mit aktivierter Sandbox sehen nur noch echte Probleme.
- **Version:** v2.1.173

---

### Woche 24 (10. Juni 2026) — v2.1.172

---

### [Verschachtelte Sub-Agents: Agenten spawnen eigene Agenten]
- **Was:** Sub-Agents können jetzt selbst weitere Sub-Agents starten — bis zu 5 Ebenen tief. Bisher war die Agent-Hierarchie auf eine Ebene begrenzt.
- **Einsatz:** Automatisch aktiv — Sub-Agents nutzen das Agent-Tool wie die Hauptsession
- **Mehrwert:** Komplexe Orchestrierungen werden natürlicher: ein Koordinator-Agent kann Arbeit eigenständig weiter zerlegen und delegieren, statt dass die Hauptsession jede Verzweigung selbst verwalten muss.
- **Version:** v2.1.172

### [Bedrock: AWS-Region aus `~/.aws`-Config]
- **Was:** Amazon Bedrock liest die AWS-Region jetzt aus den `~/.aws`-Konfigurationsdateien, wenn `AWS_REGION` nicht gesetzt ist — analog zur Präzedenz des AWS SDK. `/status` zeigt an, woher die Region stammt.
- **Einsatz:** Automatisch aktiv; Herkunft per `/status` prüfen
- **Mehrwert:** Bedrock-Setups verhalten sich wie andere AWS-Tools — keine überraschenden Regions-Fehler mehr, wenn nur die AWS-Config (nicht die Env-Variable) gepflegt ist.
- **Version:** v2.1.172

### [Suchleiste im `/plugin`-Marketplace]
- **Was:** Beim Durchstöbern der Plugins eines Marketplace in `/plugin` gibt es jetzt eine Suchleiste. Zudem behoben: verlorener Cursor nach dem Zurückspringen aus langen Listen und falsche Tab-Rückkehr per Esc.
- **Einsatz:** `/plugin` → Marketplace durchsuchen
- **Mehrwert:** Plugins in großen Marketplaces lassen sich gezielt finden statt mühsam durchzuscrollen.
- **Version:** v2.1.172

### [Fix: 1M-Kontext ohne Credits — Session kompaktiert sich automatisch]
- **Was:** Sessions mit 1M-Kontext, deren Usage-Credits aufgebraucht waren, blieben dauerhaft hängen — jetzt kompaktiert sich die Session automatisch zurück unter das Standard-Kontextlimit.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange Sessions enden nicht mehr in einer Sackgasse, wenn das 1M-Kontingent ausgeht — die Arbeit läuft im Standard-Kontext weiter.
- **Version:** v2.1.172

### [Modell-Governance: `availableModels` greift jetzt überall]
- **Was:** Mehrere Lücken in der Modell-Beschränkung geschlossen: `availableModels` gilt jetzt auch für Subagent-Modell-Overrides, den Dispatch-Modell-Picker und das Advisor-Modell. Außerdem behoben: Allowlists mit versionsspezifischen IDs (z. B. `claude-opus-4-8`) blendeten die Opus-/Sonnet-1M-Zeilen im `/model`-Picker fälschlich aus; der Picker bot auf Bedrock Modelle an, die der Provider nicht bereitstellt; doppelte `[1M][1m]`-Suffixe bei `ANTHROPIC_DEFAULT_OPUS_MODEL`; und `opusplan` liefert im Plan-Modus jetzt korrekt 1M-Kontext bzw. wechselt zuverlässig auf Opus.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Organisations-Policies zur Modellwahl sind lückenlos durchgesetzt, und die Modellauswahl verhält sich auf allen Providern konsistent — wichtig für Enterprise-Setups mit eingeschränkten Modelllisten.
- **Version:** v2.1.172

### [Fix: Wildcard-Regeln für `WebFetch`-Domains & Datei-Permissions]
- **Was:** `WebFetch(domain:*.example.com)`-Wildcard-Regeln matchten nie auf Subdomains (in Allow-, Deny- und Ask-Position), und Datei-Permission-Regeln mit Wildcards mitten im Muster (z. B. `Read(secrets-*/config.json)`) wurden beim Start abgelehnt — beides behoben.
- **Einsatz:** Automatisch aktiv — bestehende Wildcard-Regeln in `permissions` greifen jetzt wie dokumentiert
- **Mehrwert:** Permission-Profile funktionieren endlich wie konfiguriert — wer Subdomain- oder Pfad-Wildcards nutzt, bekommt jetzt das erwartete Verhalten statt stiller Lücken.
- **Version:** v2.1.172

### [Performance: schnellere lange Sessions, weniger Idle-CPU]
- **Was:** Redundante Message-Normalisierung entfernt und unnötige Verlaufs-Transformationen beim Streaming vermieden; der `/goal`-Status-Chip rendert das Terminal im Leerlauf nicht mehr mit 5 Hz neu; weniger UI-Re-Renders bei parallel laufenden Subagents; Chrome-Browser-Tools laden in einem gebündelten Aufruf statt einzeln.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar flüssigere lange Konversationen und geringere CPU-Last — besonders bei Multi-Agent-Läufen und aktiver Browser-Integration.
- **Version:** v2.1.172

### [Sammel-Bugfixes & Feinschliff (v2.1.172)]
- **Was:** Viele weitere Fixes: wiederkehrender „Image could not be processed"-Fehler bei mehreren Bildern behoben; Agents-View zeigte Sessions bis zu 30 s zu lange als „Working"; Background-Agents lasen auf vorgewärmten Workern teils Projekt-Settings eines fremden Verzeichnisses (`.mcp.json`-Approvals, Trust); Attach-Fehler (EAUTH) nach Daemon-Auto-Update behoben; Background-Sub-Agent blieb nach Stopp eines verschachtelten Agenten als „active" hängen; Up-Arrow-History zeigte Haupt-Prompts im Subagent-Tab; Memory-Recall findet gemountete Team-Stores (`CLAUDE_MEMORY_STORES`) in Remote-Sessions; Workflow-Validierung lehnte Skripte ab, die `Date.now()`/`Math.random()` nur in Strings/Kommentaren erwähnten; Maus-Tracking auf inkompatiblen Windows-Konsolen deaktiviert; OTEL-Metrik `claude_code.lines_of_code.count` hat ein neues `model`-Attribut; `/code-review` zeigt die `ultra`-Option auch ohne claude.ai-Login (mit Hinweis); Remote-Control-Footer zu „/rc active" verkürzt; `/loop` wird in Remote-Sessions nicht mehr beworben; VS Code: PowerShell-Tool-Aufrufe rendern korrekt statt als Roh-JSON, ANSI-Codes aus Shell-Output entfernt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Reibung quer durch Background-Agents, Remote-Sessions, Windows und VS Code — zuverlässigeres Multi-Agent-Arbeiten.
- **Version:** v2.1.172

---

### Woche 23 (9. Juni 2026) — v2.1.170

---

### [Claude Fable 5: neues Standardmodell in Claude Code]
- **Was:** Mit v2.1.170 zieht Claude Fable 5 ein — ein für den allgemeinen Gebrauch freigegebenes Modell der „Mythos"-Klasse, dessen Fähigkeiten alle bisher öffentlich verfügbaren Modelle übertreffen.
- **Einsatz:** `claude update` auf v2.1.170; Modellwahl über `/model`
- **Mehrwert:** Spürbar leistungsfähigeres Modell für anspruchsvolle Coding- und Agent-Aufgaben — mehr Tiefe ohne zusätzlichen Konfigurationsaufwand.
- **Version:** v2.1.170

### [Fix: VS-Code-Terminal-Sessions speichern Transkripte wieder]
- **Was:** Sessions, die aus dem integrierten VS-Code-Terminal (oder aus Shells mit vererbten Claude-Code-Umgebungsvariablen) gestartet wurden, speicherten ihre Transkripte nicht und tauchten nicht in `--resume` auf — jetzt behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verlässliches Fortsetzen von Sessions direkt aus der IDE — keine verlorenen Verläufe mehr bei VS-Code-Workflows.
- **Version:** v2.1.170

---

### Woche 23 (8. Juni 2026) — v2.1.169

---

### [`--safe-mode`: Start ohne alle Anpassungen]
- **Was:** Neue Flag `--safe-mode` (und `CLAUDE_CODE_SAFE_MODE`) startet Claude Code mit deaktivierten Anpassungen — CLAUDE.md, Plugins, Skills, Hooks und MCP-Server bleiben außen vor.
- **Einsatz:** `claude --safe-mode` oder `CLAUDE_CODE_SAFE_MODE=1`
- **Mehrwert:** Schnelle Fehlerdiagnose: lässt sich sofort prüfen, ob ein Problem von der eigenen Konfiguration oder von Claude Code selbst stammt — ohne mühsames Einzeln-Abschalten.
- **Version:** v2.1.169

### [`/cd`: Arbeitsverzeichnis wechseln ohne Cache-Verlust]
- **Was:** Neuer Befehl `/cd` verschiebt eine laufende Session in ein neues Arbeitsverzeichnis, ohne den Prompt-Cache mitten in der Session zu brechen.
- **Einsatz:** `/cd <pfad>`
- **Mehrwert:** Mid-Session in ein anderes Verzeichnis/Repo wechseln, ohne die Session neu zu starten oder den Cache (und damit Tempo/Kosten-Vorteil) zu verlieren.
- **Version:** v2.1.169

### [`disableBundledSkills`: gebündelte Skills ausblenden]
- **Was:** Neue Einstellung `disableBundledSkills` (und Env `CLAUDE_CODE_DISABLE_BUNDLED_SKILLS`) blendet mitgelieferte Skills, Workflows und eingebaute Slash-Commands vor dem Modell aus.
- **Einsatz:** In den Settings `disableBundledSkills` setzen oder `CLAUDE_CODE_DISABLE_BUNDLED_SKILLS=1`
- **Mehrwert:** Schlankerer Kontext und weniger Ablenkung des Modells durch ungenutzte Built-ins — nützlich für fokussierte, eigene Skill-Setups.
- **Version:** v2.1.169

### [Durchgesetzte Managed-MCP-Policies bei Reconnect & frühem Start]
- **Was:** Enterprise-MCP-Policies (`allowedMcpServers`/`deniedMcpServers`) griffen bisher nicht bei Reconnect, IDE-getippten Configs, `--mcp-config`-Servern in der ersten Session nach Installation oder vor dem Laden der Remote-Settings — jetzt durchgesetzt. Zudem schnellere Kaltstarts für Orgs ohne Remote-Settings.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verlässliche MCP-Governance in regulierten Umgebungen — keine Lücken mehr, durch die nicht genehmigte Server kurzzeitig durchrutschen.
- **Version:** v2.1.169

### [`claude agents --json`: blockierte Sessions, `--all`, neue Felder]
- **Was:** `claude agents --json` ließ blockierte und gerade erst dispatchte Background-Sessions aus — jetzt enthalten. Neu: `--all` bezieht abgeschlossene Sessions ein, plus neue Felder `id` und `state`.
- **Einsatz:** `claude agents --json --all`
- **Mehrwert:** Vollständige, skriptbare Übersicht aller Agent-Sessions inkl. Zustand — bessere Automatisierung und Monitoring von Multi-Session-Setups.
- **Version:** v2.1.169

### [`/workflows` öffnet sofort, auch während eines Turns]
- **Was:** Das `/workflows`-Panel öffnet jetzt unmittelbar, selbst wenn gerade ein Turn läuft.
- **Einsatz:** `/workflows`
- **Mehrwert:** Kein Warten mehr auf das Turn-Ende, um laufende Workflows zu inspizieren — flüssigere Bedienung bei langen Läufen.
- **Version:** v2.1.169

### [Robustere `TaskCreate`-Validierung]
- **Was:** `TaskCreate` repariert fehlerhafte Eingaben jetzt automatisch; Validierungsfehler für nicht geladene Tools enthalten das Schema.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger abgebrochene Task-Erstellungen und klarere Fehler — zuverlässigere Orchestrierung.
- **Version:** v2.1.169

### [Idle-Timeout auf Vertex/Foundry wiederhergestellt]
- **Was:** Standardmäßiger 5-Minuten-Idle-Timeout auf Vertex/Foundry zurück, sodass ein stehengebliebener Stream abbricht statt unbegrenzt zu hängen; `API_FORCE_IDLE_TIMEOUT=0` deaktiviert.
- **Einsatz:** Automatisch aktiv (Opt-out: `API_FORCE_IDLE_TIMEOUT=0`)
- **Mehrwert:** Keine endlos hängenden Sessions mehr bei Netz-/Backend-Aussetzern auf diesen Providern.
- **Version:** v2.1.169

### [Background-Sessions: Flags & Settings über Retire→Wake hinweg]
- **Was:** Background-Sessions bewahren `--ide`, `--chrome`, `--bare`, `--remote-control` u. a. über Retire→Wake; respektieren wieder projektbezogene `env`-Werte (z. B. `ANTHROPIC_MODEL`) auf vorgewärmten Workern; und werden über den blockierten Shared-Checkout-Edit vor `EnterWorktree` informiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Vorhersehbares Verhalten langlaufender Hintergrund-Agenten — keine verlorenen Flags, falschen Modelle oder vergeudeten Edit-Versuche mehr.
- **Version:** v2.1.169

### [Sammel-Bugfixes & Feinschliff (v2.1.169)]
- **Was:** Viele Fixes: Up/Down-Pfeile springen bei langen, umbrochenen Eingaben nicht mehr in die Command-History, sondern durch die visuellen Zeilen; ~30–50 ms UI-Stall pro Turn-Start für macOS-Nutzer mit claude.ai-Login behoben; `claude -p` auf Windows nicht mehr langsam/hängend beim Slash-Command-Scan (Regression aus 2.1.161); Remote Control bleibt nach Resume bei gleichzeitigem OAuth-Refresh nicht mehr auf „reconnecting"; Git-Credential-Manager-Popup auf Windows beim Start unterdrückt; Footer-Hinweise (z. B. „esc to interrupt") zeigen sich auch bei eigener Statusline; veraltete Permission-/Dialog-Prompts erscheinen nicht erneut beim Reattach toter Worker; Agents-View hinterlässt auf WSL/Windows Terminal keinen verstümmelten Frame mehr; MCPB-Plugin-Cache auf Windows nicht mehr fälschlich invalidiert; verwaiste `.in_use`-PID-Locks werden täglich aufgeräumt; untrusted Project-Settings können keine OTEL-Client-Zertifikatspfade ohne Trust-Bestätigung mehr setzen; Auto-Updater auf Windows hört auf zu retrien, wenn `claude.exe` gehalten wird; „CLAUDE.md ist zu lang"-Warnschwelle skaliert mit dem Modell-Kontextfenster; reduzierte CPU-Last beim Streaming und bei Spinner-Animationen; bessere Farbkontraste für Skill-Tags im Menü.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar weniger Reibung über Windows, macOS, WSL, Remote- und Enterprise-Szenarien — schnellere, ruhigere und vorhersehbarere Bedienung.
- **Version:** v2.1.169

---

### Plattform/API (Juni 2026)

---

### [Claude Fable 5 & Claude Mythos 5: neue Modellgeneration]
- **Was:** Anthropic hat Claude Fable 5 (`claude-fable-5`) als leistungsstärkstes breit verfügbares Modell veröffentlicht, dazu Claude Mythos 5 (`claude-mythos-5`) für Project-Glasswing-Teilnehmer. Beide bieten standardmäßig 1M-Token-Kontextfenster, 128k max. Output-Tokens und durchgehend aktives Adaptive Thinking. Sie nutzen den mit Opus 4.7 eingeführten Tokenizer — derselbe Text ergibt ~30 % mehr Tokens (per Token-Counting-API mit `model: "claude-fable-5"` messbar). Adaptive Thinking ist der einzige Thinking-Modus: `thinking: {"type": "disabled"}`, manuelle Budgets und Assistant-Prefill werden nicht unterstützt (400). `thinking.display` ist standardmäßig `"omitted"`; `summarized` liefert lesbare Zusammenfassungen. Fable 5 erfordert 30-Tage-Datenaufbewahrung (kein Zero-Data-Retention).
- **Einsatz:** API-Modell `claude-fable-5` setzen; in Claude Code per `/model` bzw. `claude update`
- **Mehrwert:** Deutlich stärkere Modellbasis für komplexe Aufgaben — bei Migration sind Tokenizer-bedingt höhere Token-Zahlen und das reine Adaptive-Thinking-Verhalten einzuplanen.
- **Version:** Platform Release Notes (9. Juni 2026)

### [Refusal-Handling: neue Kategorie `reasoning_extraction` & `fallbacks`-Parameter]
- **Was:** Auf Fable 5 laufen Safety-Klassifikatoren auf den Request und während der Generierung; abgelehnte Requests liefern `stop_reason: "refusal"` — ohne Abrechnung, wenn vor jeglichem Output abgelehnt. Neu in `stop_details.category`: `"reasoning_extraction"` (blockiert bei ToS-Verstößen zum Reverse-Engineering/Duplizieren von Modell-Outputs); `"cyber"`/`"bio"` bleiben unverändert. Ein optionaler `fallbacks`-Parameter (Beta auf Claude API & Claude Platform on AWS; nicht bei der Message-Batches-API) lässt abgelehnte Requests auf einem anderen Modell neu laufen, abgerechnet zu dessen Tarif.
- **Einsatz:** Refusals über `stop_reason`/`stop_details.category` behandeln; optional `fallbacks` in der Request-Definition setzen
- **Mehrwert:** Granulareres, kostenneutrales Refusal-Handling plus automatischer Ausweichpfad — robustere Pipelines bei Safety-sensitiven Workloads.
- **Version:** Platform Release Notes (9. Juni 2026)

### [Managed Agents: Geplante Deployments (Cron) & Env-Variablen-Credentials in Vaults]
- **Was:** Claude Managed Agents unterstützen jetzt geplante Deployments (`scheduled-deployments`) — Sessions laufen nach einem Cron-Zeitplan, ohne dass man einen eigenen Scheduler betreiben muss. Zusätzlich akzeptieren Managed-Agents-Vaults nun Environment-Variablen-Credentials: Secrets lassen sich sicher in die Agent-Sandbox injizieren, für CLIs, SDKs und andere Dienste, die per Umgebungsvariable authentifizieren.
- **Einsatz:** Scheduled Deployment in der Console/API konfigurieren (Cron-Ausdruck); Vault-Credential vom Typ Environment-Variable hinterlegen (`vaults#add-a-credential`)
- **Mehrwert:** Wiederkehrende Agent-Läufe (nächtliche Reports, periodische Checks) ohne eigene Infrastruktur, plus eine saubere, sichere Secret-Übergabe an Tools in der Sandbox — kein Secret mehr im Klartext im Prompt.
- **Version:** Platform Release Notes (9. Juni 2026)

### [Webhook-Event-Feld `session_thread_id` für Multi-Agent-Threads]
- **Was:** Die `session.thread_*`-Webhook-Events enthalten jetzt ein Feld `session_thread_id`, das den Multi-Agent-Thread identifiziert, der das Event ausgelöst hat.
- **Einsatz:** Automatisch aktiv — `session_thread_id` im Webhook-Payload auswerten
- **Mehrwert:** Webhook-Konsumenten können Events eindeutig dem auslösenden Multi-Agent-Thread zuordnen — bessere Korrelation und Nachverfolgung in Event-getriebenen Orchestrierungen.
- **Version:** Platform Release Notes (9. Juni 2026)

### [Claude in Apples Foundation Models Framework]
- **Was:** Anthropic hat beschrieben, wie sich intelligente Apps für Apple-Plattformen mit Claude über Apples Foundation Models Framework bauen lassen — Integration von Claude in native iOS-/macOS-Anwendungen.
- **Einsatz:** Claude über das Foundation Models Framework in Swift-/Apple-Apps einbinden (siehe Announcement-Post)
- **Mehrwert:** Native Apple-Entwickler bekommen einen klaren Weg, Claude-Fähigkeiten direkt in ihre Apps zu integrieren, statt eigene API-Anbindungen von Grund auf zu bauen.
- **Version:** Blog-Announcement (8. Juni 2026)

### [Observability für Connector-Entwickler]
- **Was:** Neue Observability-Funktionen für Entwickler, die Connectors bauen — erweitertes Monitoring und Debugging für das Connector-Tooling.
- **Einsatz:** Observability-/Monitoring-Features im Connector-Dashboard nutzen (siehe Announcement-Post)
- **Mehrwert:** Connector-Entwickler sehen besser, was in ihren Integrationen passiert, und können Fehler schneller eingrenzen — robustere MCP-/Connector-Anbindungen.
- **Version:** Blog-Announcement (8. Juni 2026)

### [Model Deprecation: Opus 4.1 wird am 5. August 2026 retired]
- **Was:** Anthropic hat die Deprecation des Modells Claude Opus 4.1 (`claude-opus-4-1-20250805`) angekündigt; das Retirement auf der Claude API ist für den 5. August 2026 geplant. Empfohlene Migration: Claude Opus 4.8.
- **Einsatz:** API-Aufrufe von `claude-opus-4-1-20250805` rechtzeitig auf `claude-opus-4-8` umstellen (siehe Migration Guide)
- **Mehrwert:** Frühzeitige Planungssicherheit — wer noch auf Opus 4.1 baut, kann die Umstellung kontrolliert vor dem Stichtag durchführen, statt von einem plötzlichen Ausfall überrascht zu werden.
- **Version:** Platform Release Notes (5. Juni 2026)

### [Advisor Tool: `max_tokens` zum Deckeln der Advisor-Ausgabe]
- **Was:** Das Advisor Tool unterstützt jetzt einen `max_tokens`-Parameter, der die Ausgabe des Advisor-Modells pro Aufruf begrenzt — das senkt Latenz und Output-Token-Kosten für Workloads, die keine vollständigen Advisor-Antworten brauchen.
- **Einsatz:** `tools[].max_tokens` in der Advisor-Tool-Definition setzen
- **Mehrwert:** Feinere Kostenkontrolle: Advisor-Hinweise lassen sich knapp halten, wo lange strategische Ausführungen unnötig sind — günstiger und schneller bei gleichbleibendem Nutzen.
- **Version:** Platform Release Notes (2. Juni 2026)

### [Keine Abrechnung mehr für Refusals ohne Output]
- **Was:** Auf der Claude API wird ein Request nicht mehr berechnet, wenn er mit `stop_reason: "refusal"` zurückkommt, ohne dass Claude Output generiert hat.
- **Einsatz:** Automatisch aktiv (Refusals über `stop_reason: "refusal"` erkennen und behandeln)
- **Mehrwert:** Faire Abrechnung — abgelehnte Anfragen ohne erzeugten Inhalt verursachen keine Token-Kosten mehr, was Safety-sensitive Workloads mit häufigen Refusals entlastet.
- **Version:** Platform Release Notes (2. Juni 2026)

---

### Woche 23 (6. Juni 2026) — v2.1.168

---

### [v2.1.168 — Bugfix- & Stabilitäts-Release]
- **Was:** Wartungs-Release mit Bugfixes und Zuverlässigkeitsverbesserungen, ohne neue benutzersichtbare Features. Setzt die v2.1.165/167-Stabilisierungsreihe nach der großen v2.1.166-Welle fort.
- **Einsatz:** Automatisch aktiv (`claude update`)
- **Mehrwert:** Weitere Fehlerbereinigung im Alltag; hält die 2.1.16x-Serie stabil.
- **Version:** v2.1.168

---

### Woche 23 (6. Juni 2026) — v2.1.167

---

### [v2.1.167 — Bugfix- & Stabilitäts-Release]
- **Was:** Wartungs-Release mit Bugfixes und Zuverlässigkeitsverbesserungen, ohne neue benutzersichtbare Features.
- **Einsatz:** Automatisch aktiv (`claude update`)
- **Mehrwert:** Schließt die umfangreiche v2.1.166-Welle ab; weniger Fehler im Alltag.
- **Version:** v2.1.167

---

### Woche 23 (6. Juni 2026) — v2.1.166

---

### [`fallbackModel`: bis zu drei Ausweichmodelle]
- **Was:** Neue Einstellung `fallbackModel`, mit der sich bis zu drei Fallback-Modelle festlegen lassen, die der Reihe nach probiert werden, wenn das Primärmodell überlastet oder nicht verfügbar ist. `--fallback-model` greift jetzt auch in interaktiven Sessions.
- **Einsatz:** In den Settings `fallbackModel` setzen oder `claude --fallback-model <modell>`
- **Mehrwert:** Sessions laufen bei Überlastung des bevorzugten Modells nahtlos weiter, statt abzubrechen — höhere Verfügbarkeit ohne manuelles Umschalten.
- **Version:** v2.1.166

### [Glob-Muster in Deny-Regeln (`"*"` blockt alle Tools)]
- **Was:** Deny-Regeln unterstützen jetzt Glob-Muster an der Tool-Namen-Position — `"*"` verweigert alle Tools. Allow-Regeln lehnen Nicht-MCP-Globs ab, und unbekannte Tool-Namen in Deny-Regeln warnen beim Start.
- **Einsatz:** In `permissions.deny` z. B. `"*"` oder ein Glob-Muster eintragen
- **Mehrwert:** Restriktive Sicherheitsprofile lassen sich kompakt formulieren („alles verbieten, einzelnes erlauben") statt jedes Tool einzeln aufzulisten.
- **Version:** v2.1.166

### [Gehärtetes Cross-Session-Messaging (`SendMessage` ohne Nutzerautorität)]
- **Was:** Nachrichten, die per `SendMessage` von anderen Claude-Sessions weitergereicht werden, tragen keine Nutzerautorität mehr — Empfänger lehnen weitergeleitete Permission-Anfragen ab, und der Auto-Modus blockiert sie.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verhindert, dass eine Session über eine andere unbemerkt Berechtigungen erschleicht — wichtige Absicherung in Multi-Agent-Setups.
- **Version:** v2.1.166

### [`MAX_THINKING_TOKENS=0` schaltet Thinking wirklich ab]
- **Was:** `MAX_THINKING_TOKENS=0`, `--thinking disabled` und der Pro-Modell-Thinking-Toggle deaktivieren jetzt das Thinking auch bei Modellen, die per Claude API standardmäßig denken (Drittanbieter unverändert).
- **Einsatz:** `MAX_THINKING_TOKENS=0` oder `claude --thinking disabled`
- **Mehrwert:** Volle Kontrolle über Latenz und Token-Verbrauch — Thinking lässt sich auch bei „Thinking-by-default"-Modellen verlässlich ausschalten.
- **Version:** v2.1.166

### [Automatischer Retry auf dem Fallback-Modell]
- **Was:** Bei einem unerwarteten, nicht-wiederholbaren API-Fehler wiederholt Claude Code den Turn einmal auf dem Fallback-Modell. Auth-, Rate-Limit-, Request-Size- und Transport-Fehler werden weiterhin sofort gemeldet.
- **Einsatz:** Automatisch aktiv (in Kombination mit `fallbackModel`)
- **Mehrwert:** Vereinzelte API-Aussetzer kosten keinen ganzen Turn mehr — robustere Läufe ohne manuellen Neustart.
- **Version:** v2.1.166

### [`claude update` nennt die Zielversion vor dem Download]
- **Was:** `claude update` kündigt jetzt die Zielversion an, bevor der Download startet, statt stumm zu bleiben.
- **Einsatz:** `claude update`
- **Mehrwert:** Man sieht sofort, auf welche Version aktualisiert wird — bessere Nachvollziehbarkeit bei automatisierten Updates.
- **Version:** v2.1.166

### [`claude agents`: URL-Eingabe filtert die passende Session]
- **Was:** In der `claude agents`-Liste filtert die Eingabe einer URL jetzt auf die Session, deren erster Prompt diese URL enthielt.
- **Einsatz:** In der `claude agents`-Liste eine URL tippen
- **Mehrwert:** Schnelles Wiederfinden der Session zu einer bestimmten PR/Issue/Datei — kein manuelles Durchsuchen der Liste.
- **Version:** v2.1.166

### [Sammel-Bugfixes: Bilder, Remote, IDEs, Eingabe (v2.1.166)]
- **Was:** Zahlreiche Fixes: wiederkehrender „image could not be processed"-Fehler samt Extra-Token-Verbrauch behoben; festhängende Remote-Sessions nach kurzer Backend-Störung beim Worker-Start; Flackern in JetBrains-Terminals (IntelliJ/PyCharm/WebStorm 2026.1+) via Synchronized Output; verschluckte „Shift+Nicht-ASCII"-Zeichen (z. B. Shift+ä→Ä) unter dem Kitty-Keyboard-Protokoll (WezTerm/Ghostty/kitty); hängende PowerShell-Befehlsvalidierung auf Windows; verwaiste `claude --bg-pty-host`-Prozesse mit 100 % CPU auf macOS; Voice-Mode-Auth-Hänger; managed-settings mit ungültigem Eintrag deaktivierten stillschweigend die restlichen Policies; `allowedMcpServers`/`deniedMcpServers` mit `${VAR}`-Referenzen; crash-loopende Background-Agent-Sessions in Worktrees; doppelter Thinking-Text in der Ctrl+O-Transcript-Ansicht; `/doctor`-Fehlanzeige in Remote-Sessions; klemmender Cursor bei mehrzeiligen Prompts; Leerzeilen in der Task-Liste ohne Unicode-Terminal.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar weniger Reibung in IDEs, auf Windows/macOS, in Remote- und Multi-Agent-Szenarien — stabilere Bedienung über viele Umgebungen hinweg.
- **Version:** v2.1.166

---

### Woche 23 (5. Juni 2026) — v2.1.165

---

### [v2.1.165 — Stabilitäts- & Zuverlässigkeits-Release]
- **Was:** Wartungs-Release mit Bugfixes und Zuverlässigkeitsverbesserungen, ohne neue benutzersichtbare Features.
- **Einsatz:** Automatisch aktiv (`claude update`)
- **Mehrwert:** Rundet die umfangreiche v2.1.163-Welle ab; weniger Abstürze und Hänger im Alltag.
- **Version:** v2.1.165

---

### Woche 23 (4. Juni 2026) — v2.1.163

---

### [`requiredMinimumVersion` / `requiredMaximumVersion` Managed Settings]
- **Was:** Zwei neue Managed-Settings, mit denen Organisationen eine erlaubte Claude-Code-Versionsspanne erzwingen können — zu alte oder zu neue Clients werden geblockt.
- **Einsatz:** In den Managed Settings `requiredMinimumVersion` / `requiredMaximumVersion` setzen
- **Mehrwert:** Flotten lassen sich auf einer geprüften Versionsspanne halten — keine ungetesteten oder veralteten Clients in regulierten Umgebungen.
- **Version:** v2.1.163

### [`/plugin list` mit `--enabled`/`--disabled`-Filter]
- **Was:** Neuer Befehl `/plugin list` listet installierte Plugins auf und kann per `--enabled`/`--disabled` gefiltert werden.
- **Einsatz:** `/plugin list --enabled`
- **Mehrwert:** Schneller Überblick, welche Plugins aktiv sind — ohne durch das interaktive `/plugin`-Menü zu klicken.
- **Version:** v2.1.163

### [`/btw`: „c to copy" für rohes Markdown]
- **Was:** Im `/btw`-Panel kopiert die neue Tastenkürzel-Aktion „c" den rohen Markdown-Inhalt in die Zwischenablage.
- **Einsatz:** `/btw` öffnen → `c` drücken
- **Mehrwert:** Antworten lassen sich verlustfrei als Markdown weiterverwenden (z. B. in Notizen oder Tickets), statt gerenderten Text mühsam abzutippen.
- **Version:** v2.1.163

### [Stop-/SubagentStop-Hooks können Kontext nachreichen]
- **Was:** `Stop`- und `SubagentStop`-Hooks können jetzt `hookSpecificOutput.additionalContext` zurückgeben und so zusätzlichen Kontext in die Session einspeisen.
- **Einsatz:** Im Hook JSON mit `hookSpecificOutput.additionalContext` ausgeben
- **Mehrwert:** Hooks am Ende eines Turns/Subagents können Claude gezielt Folgeinformationen mitgeben (z. B. Lint-Ergebnisse, nächste Schritte) — engere Automatisierung.
- **Version:** v2.1.163

### [Skills: `\$`-Escape für literales `$` vor Ziffern]
- **Was:** In Skills lässt sich mit `\$` ein literales Dollarzeichen vor Ziffern schreiben, ohne dass es als Variablen-/Argument-Referenz interpretiert wird.
- **Einsatz:** Im Skill-Text `\$5` statt `$5` schreiben
- **Mehrwert:** Preisangaben, Regex und Shell-ähnliche Syntax in Skills funktionieren jetzt zuverlässig ohne ungewollte Ersetzung.
- **Version:** v2.1.163

### [stdio-MCP-Server erhalten `CLAUDE_CODE_SESSION_ID` bei `--resume`]
- **Was:** stdio-MCP-Server bekommen die `CLAUDE_CODE_SESSION_ID` jetzt auch beim Fortsetzen einer Session mit `--resume` übergeben.
- **Einsatz:** Automatisch aktiv (`claude --resume`)
- **Mehrwert:** MCP-Server können fortgesetzte Sessions korrekt derselben Session-ID zuordnen — konsistentes State-/Logging-Verhalten über Resumes hinweg.
- **Version:** v2.1.163

### [`claude -p` Headless-Fixes: Hänger, Bedrock/Vertex/Foundry-Auth]
- **Was:** Mehrere Headless-Bugs behoben: `claude -p` hing nach dem finalen Ergebnis, wenn Befehle im Hintergrund liefen; und es scheiterte mit „ANTHROPIC_API_KEY required" auf Bedrock/Vertex/Foundry, wenn `CI=true` gesetzt war.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Zuverlässige Skript- und CI-Läufe mit `claude -p` — auch auf Cloud-Providern ohne expliziten API-Key.
- **Version:** v2.1.163

### [Bash-Fixes: bazel, EDR, Windows „EEXIST"]
- **Was:** Bash-Befehle scheiterten zuvor unter bazel und in EDR-geschützten (Endpoint-Detection) Workflows sowie auf Windows mit „EEXIST" am Session-Env-Verzeichnis — alle drei sind behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Befehlsausführung funktioniert auch in restriktiven Unternehmens- und Windows-Umgebungen zuverlässig.
- **Version:** v2.1.163

### [Org-Permission-Regeln greifen jetzt beim Start]
- **Was:** Behoben: Von der Organisation verwaltete Permission-Regeln wurden beim Startup nicht angewendet. Zusätzlich greifen Deny-Regeln auf Home-Verzeichnis-Pfade mit `$HOME`-Referenzen jetzt korrekt, und Hook-`if: "Bash(...)"`-Bedingungen feuern nicht mehr fälschlich bei Subshells/Backticks.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verwaltete Sicherheitsrichtlinien sind ab dem ersten Moment der Session wirksam — keine kurze Lücke beim Start mehr.
- **Version:** v2.1.163

### [Background-Sessions: laufende Tasks bleiben beim Reattach erhalten]
- **Was:** Behoben: Hintergrund-Sessions verloren nach einem Update laufende Tasks beim Wiederanhängen. Hintergrund-Agent-Sessions aktualisieren sich nun auch im Hintergrund weiter.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lang laufende Hintergrundarbeit übersteht Updates und Reattach ohne Verlust — verlässlicheres Multi-Session-Arbeiten.
- **Version:** v2.1.163

### [Terminal- & Eingabe-Fixes: Agent-View-Exit, Paste-Hänger, Stop-Chip]
- **Was:** Mehrere UI-Fixes: Terminal-Fehlausrichtung und Hänger beim Verlassen der Agent-Ansicht behoben; Tastatureingabe wurde nach Paste-Operationen unresponsiv; Klick auf „Stop" am Hintergrund-Task-Chip funktioniert wieder; störende „(no content)"-Zeile nach dem Schließen von Panel-Dialogen entfernt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Flüssigere, vorhersehbarere Bedienung — keine eingefrorene Eingabe oder verrutschten Layouts mehr.
- **Version:** v2.1.163

### [Klarere Built-in-Beschreibungen & Dispatch aus gruppierter Ansicht]
- **Was:** Verständlichere Beschreibungen für eingebaute Commands und Skills; ein Abo-Wechsel-Vorschlag erscheint im Startup-Ankündigungs-Slot; und `claude agents`-Dispatch aus der nach Status gruppierten Ansicht startet jetzt im korrekten Verzeichnis.
- **Einsatz:** `claude agents`
- **Mehrwert:** Bessere Orientierung über verfügbare Befehle und korrektes Arbeitsverzeichnis beim Starten neuer Agents aus der Übersicht.
- **Version:** v2.1.163

---

### Woche 23 (4. Juni 2026) — v2.1.162

---

### [`claude agents --json` zeigt `waitingFor`]
- **Was:** `claude agents --json` enthält jetzt ein `waitingFor`-Feld, das anzeigt, worauf eine wartende Session blockiert ist (z. B. ein Permission-Prompt).
- **Einsatz:** `claude agents --json`
- **Mehrwert:** Programmatische Überwachung erkennt jetzt eindeutig, warum eine Session hängt — ideal für Dashboards und Automatisierung über mehrere Agents.
- **Version:** v2.1.162

### [`--tools` mit Grep/Glob aktiviert dedizierte Suche]
- **Was:** Wird Grep/Glob explizit über `--tools` aufgeführt, stehen auf Native-Builds mit eingebetteter Suche jetzt dedizierte Such-Tools bereit.
- **Einsatz:** `claude --tools Grep,Glob …`
- **Mehrwert:** Schnellere, native Datei- und Inhaltssuche in eingeschränkten Tool-Konfigurationen statt Fallback auf Bash.
- **Version:** v2.1.162

### [Slash-Command-Autocomplete füllt statt sofort auszuführen]
- **Was:** Die Slash-Command-Autovervollständigung trägt den Befehl jetzt in den Prompt ein, statt ihn sofort auszuführen — mit Enter wird er gestartet. Zusätzlich bestätigt `/effort`, wenn das gewählte Level als Standard für neue Sessions übernommen wird.
- **Einsatz:** Slash-Command tippen → Auswahl füllt den Prompt → Enter
- **Mehrwert:** Kein versehentliches Sofort-Ausführen mehr; man kann den Befehl vor dem Absenden noch ergänzen oder korrigieren.
- **Version:** v2.1.162

### [Remote Control als persistente Footer-Pille]
- **Was:** Remote Control erscheint jetzt als dauerhafte Footer-Pille mit Session-Link statt nur als Startmeldung.
- **Einsatz:** Automatisch aktiv (bei aktivem Remote Control)
- **Mehrwert:** Der Session-Link bleibt jederzeit sichtbar und greifbar, statt im Scrollback zu verschwinden.
- **Version:** v2.1.162

### [Windsurf → Devin Desktop umbenannt]
- **Was:** „Windsurf" heißt im `/ide`-Menü, in `/terminal-setup` und `/scroll-speed` jetzt „Devin Desktop".
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Konsistente, aktuelle Bezeichnung der IDE-Integration nach dem Rebranding.
- **Version:** v2.1.162

### [Robusterer Startup bei read-only Config & ruhigere Meldungen]
- **Was:** Ein stiller Startup-Hang bei schreibgeschütztem Config-Verzeichnis ist behoben — Claude Code startet mit In-Memory-Config und zeigt die Fehler an. Zusätzlich: ruhigerer Start (Hinweise nach Schweregrad gruppiert, Session-Info + Ankündigungen in einer Zeile), klarer formulierte Startup-Warnungen mit konkreten Fixes, Launch-Prompt-Warnungen bleiben unter dem Input angepinnt, fehlgeschlagene Turns zeigen eine kompakte Warnzeile statt eines mehrzeiligen roten Fehlerblocks. „Claude in Chrome enabled"- und „marketplace installed"-Startmeldungen entfernt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verlässlicher Start auch in eingeschränkten Umgebungen und ein deutlich aufgeräumterer, verständlicherer Startbildschirm.
- **Version:** v2.1.162

### [Permission-Rule-Fixes: WebFetch & Windows-Pfade]
- **Was:** WebFetch-Permission-Regeln greifen jetzt auch für eingebaute vorab genehmigte Domains; Windows-Permission-Regeln mit Backslashes oder abweichender Groß-/Kleinschreibung matchen jetzt korrekt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Berechtigungsregeln verhalten sich plattformübergreifend zuverlässig — weniger fälschlich durchgelassene oder blockierte Aktionen.
- **Version:** v2.1.162

### [Stabilere `claude agents`-Ansicht]
- **Was:** Mehrere Fixes für die Agent-Ansicht: Statustext wird bei 60–120 Spalten nicht mehr abgeschnitten (nutzt volle Terminalbreite), lange Session-Namen werden nicht mehr bei 40 Spalten gekappt, das Attachen springt nach einem Neustart nicht mehr gelegentlich zur Session-Liste zurück, und Strg+V-Bildeinfügen im Dispatch-Input funktioniert wieder.
- **Einsatz:** `claude agents`
- **Mehrwert:** Aufgeräumtere, verlässlichere Übersicht über alle Sessions — keine abgeschnittenen Infos oder verlorenen Eingaben mehr.
- **Version:** v2.1.162

### [Zuverlässigere Background-Sessions & Messaging]
- **Was:** Backgrounding einer Session mit ← verliert die Konversation nicht mehr, wenn der Background-Service fehlschlägt; nicht zustellbare Antworten gehen nicht mehr verloren, sondern werden für die nächste Session-Zustellung in eine Queue gelegt; Cross-Session-Messaging (`SendMessage`) bricht nicht mehr bei tiefem `CLAUDE_CODE_TMPDIR`/`$TMPDIR`; das Öffnen einer laufenden Background-Session stockt nicht mehr 5 Sekunden vor dem Attachen. Spawn-Fehler melden bei fehlendem errno den Fehlerklassennamen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Hintergrund-Sessions und die Kommunikation zwischen Sessions sind spürbar robuster — kein verlorener Verlauf, keine verschluckten Nachrichten, schnelleres Attachen.
- **Version:** v2.1.162

### [Weitere Fixes (v2.1.162)]
- **Was:** Esc/Interrupt am Turn-Anfang wird in stream-json-/SDK-Sessions nicht mehr stillschweigend verworfen; API-400-Fehler („no low surrogate in string") bei Klassifikator-Queries und MCP-Beschreibungen mit Emoji an der Truncation-Grenze behoben; MCP-`timeout`-Werte unter 1000 ms werden nicht mehr auf den 1-Sekunden-Watchdog hochgesetzt (Sub-1000-ms-Werte werden ignoriert); das LSP-Tool liefert für `workspaceSymbol` wieder Ergebnisse (akzeptiert `query`-Parameter); Background-Service-Start und `claude update`-Verifikation warten Endpoint-Security-Scans ab.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Behebt eine Reihe von Reibungspunkten bei Headless-/SDK-Nutzung, MCP-Timeouts, Code-Navigation (LSP) und Update-Zuverlässigkeit.
- **Version:** v2.1.162

---

### Woche 23 (3. Juni 2026) — v2.1.161

---

### [Fehlgeschlagene Bash-Befehle brechen parallele Tool-Calls nicht mehr ab]
- **Was:** Wenn in einem Batch mehrere Tools parallel laufen und ein Bash-Befehl fehlschlägt, werden die anderen parallelen Tool-Calls desselben Batches nicht länger mit abgebrochen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Ein einzelner fehlschlagender Befehl verwirft nicht mehr die Arbeit paralleler Tools — weniger Wiederholungen und stabilere Mehrfach-Tool-Schritte.
- **Version:** v2.1.161

### [`claude agents` zeigt `done/total` bei aufgefächerter Arbeit]
- **Was:** In der Agent-Ansicht zeigen Zeilen jetzt `done/total` vor dem Detail an, wenn Arbeit auf mehrere Subagents aufgefächert wurde. Zusätzlich klappt `/mcp` ungenutzte claude.ai-Connectors hinter eine „Show unused connectors"-Zeile ein.
- **Einsatz:** `claude agents` / `/mcp`
- **Mehrwert:** Schnellerer Überblick über den Fortschritt fanned-out Arbeit und eine aufgeräumtere MCP-Connector-Liste.
- **Version:** v2.1.161

### [Linux-Fullscreen-Clipboard nutzt `wl-copy`/`xclip`/`xsel`]
- **Was:** Im Fullscreen-Modus nutzt die Zwischenablage auf Linux jetzt `wl-copy`, `xclip` oder `xsel`, sofern verfügbar.
- **Einsatz:** Automatisch aktiv (Linux)
- **Mehrwert:** Zuverlässigeres Kopieren auf Linux-Desktops (Wayland/X11) ohne OSC-52-Einschränkungen.
- **Version:** v2.1.161

### [Secrets nicht mehr in `claude mcp`-Ausgaben]
- **Was:** `claude mcp`-Befehle geben keine Secrets mehr aus; `${VAR}`-Referenzen werden nicht länger expandiert. Ergänzend: managed-settings-Policies blockieren keine Drittanbieter-Provider-Sessions mehr neben einem Org-Pin.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Geringeres Risiko, dass Zugangsdaten versehentlich in Logs/Terminals landen — sicherere MCP-Verwaltung.
- **Version:** v2.1.161

### [Reduce-Motion respektiert & Telemetrie-Fixes]
- **Was:** `/effort`-Dialog, Workflow-Animationen und das Prompt-Keyword-Schimmern honorieren jetzt die „Reduce motion"-Einstellung. OpenTelemetry-Fixes: `OTEL_RESOURCE_ATTRIBUTES`-Werte erscheinen als Labels auf Metrik-Datenpunkten; Log-Events vor der Telemetrie-Initialisierung gehen nicht mehr verloren.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Bessere Barrierefreiheit (weniger Bewegung) und verlässlichere, vollständigere Telemetrie-Daten.
- **Version:** v2.1.161

### [Worktree-, Resume- & Hintergrund-Session-Fixes]
- **Was:** `/autofix-pr` meldet in Git-Worktrees nicht mehr fälschlich „cannot run on default branch"; der `--resume`-Picker zeigt Sessions aus dem aktuellen Verzeichnis auch in Nicht-Git-Worktrees; Workflow-Agents mit `isolation: "worktree"` können ihre Worktree-Dateien wieder editieren; Hintergrund-Sessions booten nicht mehr ein veraltetes Modell aus der Daemon-Umgebung.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Worktree- und Resume-Flows funktionieren zuverlässig — kein verlorener Kontext, keine falschen Branch-Fehler.
- **Version:** v2.1.161

### [Weitere Fixes & Performance (v2.1.161)]
- **Was:** Hintergrund-Subagent-Ausgaben verfälschen die `claude -p`-stdout bei `text`/`json`-Output-Formaten nicht mehr; `/usage-credits` startet kein Re-Login mehr, sondern verweist auf die Org-Nutzungseinstellungen; Windows-Hooks mit explizitem `bash` scheitern nicht mehr mit „command not found"; behoben: Crash beim Rendern von Write-Ergebnissen nach Session-Resume, abgeschlossene Subagents fälschlich als „running", `EADDRINUSE` bei Unix-Sockets unter tiefem `$CLAUDE_CODE_TMPDIR`. Performance: schnelleres Terminal-Rendering (Layout-Engine-JIT), schnelleres Schreiben großer Dateien; VSCode-Tipp gegen verzerrte Glyphen (GPU-Beschleunigung deaktivieren).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Viele Stabilitäts- und Performance-Verbesserungen für Headless-Nutzung, Windows, Resume und große Dateien.
- **Version:** v2.1.161

---

### Woche 23 (2. Juni 2026) — v2.1.160

---

### [Workflow-Trigger-Keyword umbenannt: `workflow` → `ultracode`]
- **Was:** Das Keyword, das einen Dynamic Workflow auslöst, heißt jetzt `ultracode` statt `workflow`. Das Wort „workflow" startet keinen Run mehr; in eigenen Worten nach einem Workflow zu fragen, funktioniert weiterhin. Das Trigger-Keyword wird im Prompt-Input violett hervorgehoben.
- **Einsatz:** `ultracode` im Prompt schreiben, um Dynamic Workflows / xhigh-Orchestrierung auszulösen
- **Mehrwert:** Das alltägliche Wort „workflow" löst nicht mehr versehentlich eine teure Multi-Agent-Orchestrierung aus — der Trigger ist jetzt ein bewusstes, eindeutiges Schlüsselwort.
- **Version:** v2.1.160

### [Schutz beim Schreiben in Shell-Startup- & Git-Config-Dateien]
- **Was:** Claude fragt jetzt nach, bevor in Shell-Startup-Dateien (`.zshenv`, `.zlogin`, `.bash_login`) oder `~/.config/git/` geschrieben wird — Dateien, die sonst zu ungewollter Befehlsausführung führen könnten.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Eine Klasse subtiler Sicherheitsrisiken (Code-Ausführung über manipulierte Startup-Dateien) wird durch eine explizite Rückfrage abgefangen.
- **Version:** v2.1.160

### [`acceptEdits` fragt bei Build-Tool-Config-Dateien nach]
- **Was:** Im `acceptEdits`-Modus fragt Claude jetzt nach, bevor Build-Tool-Konfigurationsdateien geschrieben werden, die Code-Ausführung erlauben (`.npmrc`, `.yarnrc*`, `bunfig.toml`, `.bazelrc`, `.pre-commit-config.yaml`, `.devcontainer/` u. a.).
- **Einsatz:** Automatisch aktiv (im `acceptEdits`-Modus)
- **Mehrwert:** Auch bei automatisch akzeptierten Edits bleibt der gefährliche Spezialfall „Config-Datei mit Ausführungssemantik" eine bewusste Entscheidung.
- **Version:** v2.1.160

### [Edit nach `grep` ohne separates Read]
- **Was:** Ein Edit benötigt nach dem Betrachten einer Datei via `grep` kein separates Read mehr — Single-File-`grep`/`egrep`/`fgrep`-Befehle erfüllen jetzt den Read-before-Edit-Check.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger redundante Tool-Schritte: Wer eine Stelle per grep findet, kann sie direkt editieren — schnellere, kürzere Edit-Flows.
- **Version:** v2.1.160

### [Schnellerer Auto-Mode-Klassifikator]
- **Was:** Die Latenz des Auto-Mode-Klassifikators wurde reduziert (weniger Reasoning bei Routine-Aktionen), was auch die Wahrscheinlichkeit von „could not evaluate this action"-Blocks senkt. Zudem verweist die Unverfügbarkeits-Meldung auf Drittanbietern (Bedrock/Vertex/Foundry) jetzt korrekt auf das `CLAUDE_CODE_ENABLE_AUTO_MODE`-Opt-in statt das Modell zu beschuldigen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Reibungsärmerer Auto-Mode: schnellere Permission-Entscheidungen und weniger fälschliche Blockaden.
- **Version:** v2.1.160

### [`ultracode`-Effort nur auf unterstützten Modellen]
- **Was:** `/effort ultracode` wird nicht mehr auf Modellen angeboten, die kein xhigh ausführen können, und beschuldigt nicht länger fälschlich die Dynamic-Workflows-Einstellung.
- **Einsatz:** `/effort ultracode` (nur auf unterstützten Modellen sichtbar)
- **Mehrwert:** Klarere UX — der Effort-Modus erscheint nur dort, wo er tatsächlich funktioniert.
- **Version:** v2.1.160

### [Aufräumarbeiten: Env-Var & Startup-Hinweis entfernt]
- **Was:** Die Umgebungsvariable `CLAUDE_CODE_OPUS_4_6_FAST_MODE_OVERRIDE` ist jetzt ein No-Op (entfernt). Der JetBrains-Plugin-Installationsvorschlag wurde aus dem Startup entfernt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Altlasten und ein ruhigerer Startbildschirm ohne überflüssige Installationshinweise.
- **Version:** v2.1.160

### [Robustere Background-Sessions & `claude agents`]
- **Was:** Zahlreiche Fixes rund um Hintergrund-Sessions und die Agent-Ansicht: Wiederherstellen einer abgeschlossenen Session aus `claude agents` verwirft nicht mehr den Chatverlauf und führt nicht den ursprünglichen Prompt erneut aus (gilt auch für nach Übernachtung reattachte Sessions); `claude --bg` scheitert nicht mehr sporadisch mit „socket missing" beim Kaltstart; resumte Background-Agents werden nicht mehr fälschlich unter „Completed" gelistet; das Öffnen länger inaktiver Background-Sessions ist schneller; das Teardown sendet vor SIGKILL ein SIGTERM an Shell-Subprozesse, damit Cleanup-Handler laufen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Hintergrund-Sessions verlieren keinen Kontext mehr und räumen sauber auf — verlässlicheres Arbeiten mit `claude agents` und `--bg`.
- **Version:** v2.1.160

### [Windows-, WSL- & IDE-Terminal-Fixes]
- **Was:** Copy-on-Select schreibt auf WSL jetzt korrekt in die Windows-Zwischenablage (PowerShell-Interop statt OSC 52, das z. B. MobaXterm nicht unterstützt); `file:///C:/...`-Links werden auf Windows nicht mehr zu kaputten Pfaden umgeschrieben; Esc/Pfeiltasten/Tippen bleiben unter hoher CPU-Last responsiv; CJK-IME-Komposition erscheint am Eingabe-Caret statt unten links; Render-Artefakte durch Terminal-Sync-Marker (Apple Terminal, tmux) wurden behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich saubereres Verhalten auf Windows/WSL und in IDE-/Spezial-Terminals.
- **Version:** v2.1.160

### [Weitere Fixes (v2.1.160)]
- **Was:** Voice Mode verbindet sich auch bei Nicht-ASCII-/Sonderzeichen im Projektpfad oder Branch-Namen; Vim-Mode `p` fügt am Cursor ein (statt in der Zeile darunter) nach `v$`-Yank; resumte Brief-Mode-Sessions verlieren Claudes frühere Antworten nicht mehr aus dem Scrollback; Mausrad scrollt direkt nach dem Öffnen einer Session das Transkript statt der Prompt-History; Model-not-found-Fehler schlagen kein `--model` mehr vor, wenn via SDK/anderem Host ausgeführt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Viele kleine Reibungspunkte im Alltag — Voice Mode, Vim, Scrollback und Fehlermeldungen — verschwinden.
- **Version:** v2.1.160

---

### Woche 22 (30. Mai 2026) — v2.1.158

---

### [Auto Mode auf Bedrock, Vertex & Foundry]
- **Was:** Der Auto Mode (Klassifikator entscheidet automatisch über Permission-Prompts — sichere Aktionen laufen durch, riskante werden blockiert) ist jetzt auch auf Amazon Bedrock, Google Vertex und Microsoft Foundry verfügbar, für Opus 4.7 und Opus 4.8.
- **Einsatz:** `CLAUDE_CODE_ENABLE_AUTO_MODE=1` setzen
- **Mehrwert:** Enterprise-/Cloud-Provider-Nutzer bekommen denselben reibungsarmen Permission-Flow wie API-Direktnutzer — weniger Unterbrechungen bei sicheren Aktionen, ohne auf `--dangerously-skip-permissions` ausweichen zu müssen.
- **Version:** v2.1.158

---

### Woche 22 (29. Mai 2026) — v2.1.157

---

### [Plugins aus `.claude/skills` werden automatisch geladen]
- **Was:** Plugins in `.claude/skills`-Verzeichnissen werden jetzt automatisch geladen — ohne Marketplace. Neu ist auch `claude plugin init <name>`, das ein neues Plugin in `.claude/skills` scaffolded.
- **Einsatz:** Plugin in `.claude/skills/<name>/` ablegen; neues Gerüst mit `claude plugin init <name>`
- **Mehrwert:** Schnellster Weg, projektlokale Plugins/Skills zu entwickeln und zu nutzen — kein Marketplace-Eintrag und kein Install-Schritt mehr nötig.
- **Version:** v2.1.157

### [Autocomplete für `/plugin`-Argumente]
- **Was:** `/plugin` bietet jetzt Autocomplete für Subcommands, installierte Plugin-Namen und Plugins aus bekannten Marketplaces. In `claude agents` matcht die Slash-Command-Autocomplete im Dispatch-Input jetzt auch Substrings.
- **Einsatz:** `/plugin <Tab>`
- **Mehrwert:** Schnellere, fehlerfreie Bedienung der Plugin-Verwaltung ohne Namen auswendig zu kennen.
- **Version:** v2.1.157

### [`agent`-Feld aus `settings.json` für dispatched Sessions]
- **Was:** Das `agent`-Feld in `settings.json` wird jetzt für dispatched Sessions in `claude agents` berücksichtigt; mit `--agent <name>` lässt es sich überschreiben.
- **Einsatz:** `"agent": "<name>"` in `settings.json` setzen oder `claude agents --agent <name>`
- **Mehrwert:** Ein fester Default-Agent für dispatchte Sessions, projektweit konfigurierbar und pro Aufruf übersteuerbar.
- **Version:** v2.1.157

### [`EnterWorktree`: Wechsel zwischen Worktrees mitten in der Session]
- **Was:** `EnterWorktree` kann jetzt mitten in einer Session zwischen Claude-verwalteten Worktrees wechseln. Zusätzlich werden Claude-verwaltete Worktrees nach Abschluss entsperrt zurückgelassen, sodass `git worktree remove`/`prune` sie aufräumen können.
- **Einsatz:** `EnterWorktree` während der Session aufrufen
- **Mehrwert:** Flexibleres Arbeiten über mehrere isolierte Arbeitskopien hinweg, ohne die Session neu zu starten — und kein manuelles Entsperren beim Aufräumen verwaister Worktrees.
- **Version:** v2.1.157

### [Workflow-Keyword-Trigger abschaltbar]
- **Was:** Eine neue Einstellung „Workflow keyword trigger" in `/config` verhindert, dass das Wort „workflow" in einem Prompt einen Dynamic Workflow auslöst. Außerdem verwirft Backspace direkt nach einem Workflow-Trigger-Keyword die Workflow-Anfrage (wie `alt+w`), statt ein Zeichen zu löschen.
- **Einsatz:** `/config` → „Workflow keyword trigger" deaktivieren; oder Backspace/`alt+w` zum Verwerfen
- **Mehrwert:** Wer oft das Wort „workflow" beiläufig schreibt, wird nicht mehr ungewollt in die Workflow-Orchestrierung gezwungen.
- **Version:** v2.1.157

### [Tool-Telemetrie mit Tool-Parametern]
- **Was:** `tool_decision`-Telemetrie-Events enthalten jetzt `tool_parameters` (Bash-Befehle, MCP-/Skill-Namen), wenn `OTEL_LOG_TOOL_DETAILS=1` gesetzt ist.
- **Einsatz:** `OTEL_LOG_TOOL_DETAILS=1` setzen
- **Mehrwert:** Detailliertere Observability für Teams, die nachvollziehen wollen, welche konkreten Tools/Befehle in Sessions ausgeführt werden.
- **Version:** v2.1.157

### [`/terminal-setup`: GPU-Acceleration in IDE-Terminals aus]
- **Was:** `/terminal-setup` deaktiviert jetzt die GPU-Beschleunigung in den integrierten Terminals von VS Code, Cursor und Windsurf, um verstümmelten Text-Rendering vorzubeugen.
- **Einsatz:** `/terminal-setup` ausführen
- **Mehrwert:** Saubere Darstellung in IDE-Terminals — kein Garbled-Text mehr durch GPU-Rendering-Probleme.
- **Version:** v2.1.157

### [Performance: schnellere lange & wiederaufgenommene Konversationen]
- **Was:** Redundante Message-Rendering-Neuberechnungen wurden eliminiert; lange und per `--resume` fortgesetzte Konversationen laufen dadurch flüssiger.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar reaktionsschnellere UI bei großen oder fortgesetzten Sessions.
- **Version:** v2.1.157

### [Aufgeräumte Startup-UI: Banner & Hints entfernt]
- **Was:** Das „bash commands will be sandboxed"-Startup-Banner und der „/ide for …"-Hint-Toast wurden entfernt (Sandbox-Status bleibt in `/status` und bei blockierten Befehlen sichtbar). Der Feature-of-the-Week-Credit-Status erscheint jetzt als Notification im Status-Bereich statt als Zeile über dem Prompt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Ruhigerer, weniger überladener Startbildschirm — relevante Infos bleiben, Rauschen verschwindet.
- **Version:** v2.1.157

### [Diverse Stabilitäts-Fixes (v2.1.157)]
- **Was:** Zahlreiche Bugfixes, u. a.: korrupte/Null-Byte-Bilder (Paste/MCP/Dialog) crashen den Request nicht mehr, sondern werden zum Text-Platzhalter; Sandbox-Netzwerk-Prompts erscheinen nicht mehr fälschlich im Auto-/Bypass-Mode (Desktop/IDE/SDK); `claude agents`-Sessions retiren korrekt trotz geparkter Subagents; Esc bricht ein langsames „opening…" ab; Background-Agent-Worktrees werden nicht mehr verwaist; reattachte Background-Sessions kennen wieder das korrekte Datum; `--resume` meldet laufende Background-Subagents; `--worktree` kehrt zum richtigen Linked-Worktree zurück; `/model`-Picker zeigt keinen falschen „Newer version available"-Hinweis mehr; Rechtsklick-Paste dupliziert nicht mehr in VS Code/Cursor/Windsurf; WSL-Bild-Paste (`alt+v`), Screenshot-Paste (Win 11) und Drag-aus-Explorer funktionieren; IDE-Stop stoppt laufende Background-Subagents wirklich; Fast-Mode-Indikator erscheint in VS Code auf Opus 4.8.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich robustere Sessions über Worktrees, Background-Agents, IDE-Integration und WSL hinweg — viele alltägliche Reibungspunkte und Regressionen sind beseitigt.
- **Version:** v2.1.157

---

### Woche 22 (29. Mai 2026) — Plattform: Managed Agents auf Claude Platform on AWS

---

### [Managed Agents auf AWS: Webhooks, Multiagent-Orchestrierung & Self-Hosted Sandboxes]
- **Was:** Claude Managed Agents bekommen auf der Claude Platform on AWS jetzt Webhooks, Multiagent-Orchestrierung und Self-Hosted Sandboxes — Features, die zuvor nur auf der First-Party-API verfügbar waren. Für die AWS-Integration gibt es neue IAM-Actions und eine Managed Policy `AnthropicSelfHostedEnvironmentAccess`.
- **Einsatz:** In der AWS-Umgebung die IAM-Actions für Claude Platform on AWS einrichten bzw. die Managed Policy `AnthropicSelfHostedEnvironmentAccess` anhängen; Managed-Agents-Sessions dann über die nativen AWS-Endpoints nutzen
- **Mehrwert:** AWS-Kunden bekommen Feature-Parität bei Managed Agents über AWS-Billing und IAM-Auth — Event-getriebene Workflows (Webhooks), parallele Agent-Teams (Multiagent) und Tool-Execution in eigener Infrastruktur (Self-Hosted Sandboxes) laufen jetzt auch innerhalb des AWS-Governance-Rahmens.
- **Version:** Plattform 2026-05-29

---

### Woche 22 (29. Mai 2026) — v2.1.156

---

### [Fix: Opus 4.8 — modifizierte Thinking-Blöcke führten zu API-Fehlern]
- **Was:** Auf Opus 4.8 wurden Thinking-Blöcke unter bestimmten Umständen verändert, was zu API-Fehlern führte. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabilere Sessions auf dem neuen Default-Modell — keine abgebrochenen Requests mehr durch inkonsistente Thinking-Blöcke.
- **Version:** v2.1.156

---

### Woche 22 (28. Mai 2026) — v2.1.154 (Claude-Code-Release zum Opus-4.8-Launch)

> Hinweis: Die modellseitigen Punkte (Opus 4.8 als Default, Dynamic Workflows, Fast Mode auf 4.8) sind im Abschnitt „Plattform-Launch" weiter unten beschrieben. Hier stehen die Claude-Code-spezifischen Neuerungen aus v2.1.154.

---

### [`/effort xhigh` & umbenannte Slider-Labels]
- **Was:** Opus 4.8 läuft per Default auf `high` Effort; für die schwersten Aufgaben gibt es `/effort xhigh`. Die `/effort`-Slider-Labels heißen jetzt „Faster"/„Smarter" statt „Speed"/„Intelligence".
- **Einsatz:** `/effort xhigh` für maximale Reasoning-Tiefe; `/effort` öffnet den Slider
- **Mehrwert:** Feinkontrolle über den Reasoning-Aufwand mit klareren Bezeichnungen — `xhigh` für harte Probleme, Default `high` für den Alltag.
- **Version:** v2.1.154

### [Lean System Prompt als Default]
- **Was:** Der schlanke („lean") System-Prompt ist jetzt Default für alle Modelle außer Haiku, Sonnet sowie Opus 4.7 und älter.
- **Einsatz:** Automatisch aktiv (auf Opus 4.8 und neueren Modellen)
- **Mehrwert:** Weniger Prompt-Overhead bedeutet mehr nutzbaren Kontext und potenziell günstigere/schnellere Turns auf den aktuellen Modellen.
- **Version:** v2.1.154

### [Claude fragt seltener per Multiple-Choice nach]
- **Was:** Claude reserviert den Multiple-Choice-Frage-Prompt (`AskUserQuestion`) jetzt für Entscheidungen, die es wirklich nicht selbst treffen kann — statt nachzufragen, wenn der Kontext für ein Weitermachen schon reicht.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger unnötige Rückfragen-Unterbrechungen; agentische Läufe kommen flüssiger durch.
- **Version:** v2.1.154

### [`/simplify` ist jetzt ein reiner Cleanup-Review]
- **Was:** `/simplify` führt nun einen reinen Aufräum-Review durch (Reuse, Vereinfachung, Effizienz, Altitude) und wendet die Fixes an — statt wie zuvor den vollen Bug-Hunting-Review von `/code-review --fix` zu starten.
- **Einsatz:** `/simplify` für Qualitäts-Cleanup; `/code-review` für Bug-Suche
- **Mehrwert:** Klare Trennung: `/simplify` poliert Code, `/code-review` jagt Bugs — keine Vermischung der beiden Anliegen mehr.
- **Version:** v2.1.154

### [`claude agents`: Shell-Befehl als Hintergrund-Session (`! <command>`)]
- **Was:** Im `claude agents`-Dispatch-Input startet `! <command>` einen Shell-Befehl als Hintergrund-Session, an die man sich an- und abkoppeln kann. Auch verfügbar als `claude --bg --exec '<command>'`.
- **Einsatz:** `! npm run build` in der Agents-View oder `claude --bg --exec 'npm test'`
- **Mehrwert:** Lange Shell-Tasks (Builds, Tests, Watcher) laufen als verwaltete Hintergrund-Session — attach/detach statt blockiertem Terminal.
- **Version:** v2.1.154

### [`claude agents`: `/logout` meldet wirklich ab]
- **Was:** `/logout` in der Agents-View meldet jetzt ab, statt fälschlich in eine Hintergrund-Session zu wechseln.
- **Einsatz:** `/logout` in `claude agents`
- **Mehrwert:** Erwartetes Verhalten beim Abmelden — keine versehentliche Background-Session mehr.
- **Version:** v2.1.154

### [Agents-View (`←←`) auf Bedrock, Vertex, Foundry & ohne Telemetrie]
- **Was:** Das Öffnen der Agents-View per `←←` funktioniert nun auch auf Amazon Bedrock, Google Vertex, Microsoft Foundry und bei deaktivierter Telemetrie.
- **Einsatz:** `←←` (Doppel-Links) zum Öffnen der Agents-View
- **Mehrwert:** Enterprise-/Cloud-Provider-Nutzer bekommen denselben Multi-Session-Überblick wie API-Direktnutzer.
- **Version:** v2.1.154

### [Claude in Chrome: Browser-Auswahl via `/chrome`]
- **Was:** Bei mehreren verbundenen Browsern lässt sich der zu nutzende Browser über `/chrome` → „Select browser…" wählen — oder direkt im Chat, wenn eine Browser-Aktion mit mehreren verbundenen Browsern läuft.
- **Einsatz:** `/chrome` → „Select browser…"
- **Mehrwert:** Klare Steuerung, welcher Browser für Automatisierung genutzt wird, wenn mehrere Sessions verbunden sind.
- **Version:** v2.1.154

### [Plugins: `defaultEnabled: false`]
- **Was:** Plugins können in `plugin.json` oder einem Marketplace-Eintrag `defaultEnabled: false` deklarieren; aktiviert werden sie dann per `/plugin` oder `claude plugin enable`. Abhängigkeiten aktivierter Plugins werden weiterhin automatisch mitaktiviert.
- **Einsatz:** `"defaultEnabled": false` in `plugin.json` setzen; aktivieren mit `claude plugin enable <name>`
- **Mehrwert:** Plugin-Autoren können optionale/schwere Plugins ausliefern, ohne sie allen sofort aufzuzwingen — Opt-in statt Opt-out.
- **Version:** v2.1.154

### [`/plugin` Discover: „suggested for this directory"]
- **Was:** Der Discover-Tab in `/plugin` pinnt jetzt Plugins, deren Relevanz-Signale zum aktuellen Verzeichnis passen, mit einer „suggested for this directory"-Markierung.
- **Einsatz:** `/plugin` → Discover-Tab
- **Mehrwert:** Schnellere Entdeckung passender Plugins für das aktuelle Projekt, ohne manuell zu suchen.
- **Version:** v2.1.154

### [Streaming Tool Execution immer aktiv]
- **Was:** Streaming-Tool-Execution ist jetzt immer aktiviert — auch bei deaktivierter Telemetrie und auf Bedrock/Vertex/Foundry (vorher hinter einem Feature-Flag).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Tool-Ausgaben erscheinen live während der Ausführung, unabhängig vom Provider oder Telemetrie-Setting.
- **Version:** v2.1.154

### [Stdio-MCP-Server erhalten Session-Env-Variablen]
- **Was:** Stdio-MCP-Server-Subprozesse bekommen jetzt `CLAUDE_CODE_SESSION_ID` und `CLAUDECODE=1` in ihrer Umgebung.
- **Einsatz:** Automatisch aktiv — in MCP-Server-Code via `process.env.CLAUDE_CODE_SESSION_ID` auslesbar
- **Mehrwert:** MCP-Server können session-spezifisches Verhalten/Logging implementieren und erkennen, dass sie unter Claude Code laufen.
- **Version:** v2.1.154

### [`claude mcp list`/`get`: „Pending approval" statt Auto-Approve]
- **Was:** `claude mcp list`/`get` zeigen nicht-genehmigte `.mcp.json`-Server bei gepipter Ausgabe jetzt als `⏸ Pending approval` an, statt sie automatisch zu genehmigen und zu verbinden.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sicherheitsgewinn: ein `claude mcp list | …` verbindet nicht mehr stillschweigend ungeprüfte MCP-Server.
- **Version:** v2.1.154

### [`/claude-api`-Skill: Opus-4.8-Support & Migrationshilfe]
- **Was:** Das `/claude-api`-Skill kennt jetzt Claude Opus 4.8 und bietet 4.7 → 4.8 Migrations-Guidance.
- **Einsatz:** `/claude-api` beim Bauen/Migrieren von Anthropic-SDK-Code aufrufen
- **Mehrwert:** Direkte Unterstützung beim Umstellen bestehender API-Apps auf das neue Default-Modell.
- **Version:** v2.1.154

### [Auto-Mode: bessere Erkennung von Daten-Exfiltration]
- **Was:** Der Auto-Mode-Classifier erkennt Daten-Exfiltration jetzt besser — insbesondere Bulk-Transfers von Repository-Inhalten.
- **Einsatz:** Automatisch aktiv (im Auto Mode)
- **Mehrwert:** Lange autonome Läufe sind sicherer; massenhaftes Abfließen von Repo-Inhalten wird eher blockiert.
- **Version:** v2.1.154

### [Deprecation: `CLAUDE_CODE_OPUS_4_6_FAST_MODE_OVERRIDE`]
- **Was:** Die Env-Variable `CLAUDE_CODE_OPUS_4_6_FAST_MODE_OVERRIDE` ist deprecated (Entfernung am 01.06.2026). Für Fast Mode auf Opus 4.6 stattdessen mit `/model claude-opus-4-6[1m]` wechseln und dann `/fast on`.
- **Einsatz:** `/model claude-opus-4-6[1m]` → `/fast on` statt der Env-Variable
- **Mehrwert:** Frühzeitige Warnung verhindert Brüche in Setups, die noch auf das alte Override-Flag setzen.
- **Version:** v2.1.154

### [Weitere Verbesserungen in v2.1.154]
- **Was:** Diverse kleinere Verbesserungen: `/remote-control`-Autocomplete zeigt „Disconnect Remote Control", wenn Remote Control aktiv ist; das stale „& for background"-Hint wurde aus der Shortcuts-Hilfe entfernt; VSCode-Auto-Mode benötigt nicht mehr das Bypass-Permissions-Setting im Mode-Picker (mit Erklär-Hinweis beim ersten Aktivieren).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Aufgeräumte UI und stimmigeres Verhalten in Remote-Control- und VSCode-Szenarien.
- **Version:** v2.1.154

### [Fixes in v2.1.154]
- **Was:** Umfangreiche Bugfixes, u. a.: `rm -rf $HOME` wird auch bei `HOME` mit Trailing-Slash als gefährlich blockiert; `$TMPDIR` löst in sandboxed/unsandboxed Bash innerhalb derselben Session konsistent auf; Subagents in Hintergrund-Sessions umgehen nicht mehr den Worktree-Isolation-Guard; `worktree.baseRef: "head"` löst korrekt auf den HEAD des aktuellen Worktrees auf; Background-Agent-Completion-Notifications lösen kein verfrühtes „out of context"-Verhalten auf 1M-Modellen mehr aus; gepinnte Background-Sessions respawnen nicht mehr jede Minute nach Updates; verwaiste `claude --bg-pty-host`-Prozesse drehen nicht mehr bei 100 % CPU; Zahlen-Shortcuts funktionieren auch für Optionen unter dem Divider; ein einzelner ungültiger `allowedMcpServers`-Eintrag verwirft nicht mehr die gesamte Managed-Settings-Policy (wird mit `claude doctor`-Warnung verworfen); API-400-Fehler bei Modellen ohne Effort-Parameter trotz `CLAUDE_CODE_ALWAYS_ENABLE_EFFORT` behoben; diverse Rendering-Fixes (VS-Code-Farbkorruption, Wrapped-Lines, Thinking-Spinner, Task-Panel mit Stray-„main"-Zeile, `/model`-Picker-Fast-Mode-Pricing); Auto Mode blockiert nicht mehr mit „could not evaluate this action", wenn dem Safety-Classifier die Output-Token ausgingen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Mehr Sicherheit (Pfad-Blocking, Worktree-Isolation, Exfiltration), stabilere Background-/Worktree-Workflows und sauberere Darstellung.
- **Version:** v2.1.154

---

### Woche 22 (28. Mai 2026) — Plattform-Launch: Claude Opus 4.8 & Dynamic Workflows

---

### [Claude Opus 4.8 ist das neue Default-Modell]
- **Was:** Anthropic launcht Claude Opus 4.8 (`claude-opus-4-8`) als neues, leistungsfähigstes GA-Modell. Default-Context: 1M Token auf Claude API, Amazon Bedrock und Vertex AI (200k auf Microsoft Foundry), 128k Max-Output. Pricing unverändert zu 4.7 ($5/$25 pro MTok Input/Output). Effort-Parameter steht jetzt überall — inkl. Claude Code und Messages API — per Default auf `high`. Cacheable-Prompt-Mindestlänge sinkt auf 1.024 Token. Adaptive-Thinking triggert Reasoning gezielter und reduziert verschwendete Thinking-Token. Laut Anthropic ist 4.8 ca. 4× seltener bereit, Fehler in selbst geschriebenem Code unkommentiert durchgehen zu lassen.
- **Einsatz:** Modell-ID `claude-opus-4-8` in API-Requests oder im Claude-Code-Model-Picker auswählen
- **Mehrwert:** Höhere Code-Honesty, stärkere agentische Zuverlässigkeit, mehr Default-Context (1M) und bessere Effizienz beim Thinking — bei unverändertem Preis.
- **Version:** Plattform 2026-05-28

### [Dynamic Workflows in Claude Code — Research Preview]
- **Was:** Workflows landen in Claude Code als Research Preview. Sie erlauben deterministisches Orchestrieren mehrstufiger agentischer Pläne — inkl. Planung von Großprojekten und paralleler Ausführung über hunderte Subagenten (z. B. Codebase-Migrationen über hunderttausende Zeilen). Workflows können andere Workflows als Sub-Step inline aufrufen (ein Verschachtelungslevel), teilen Concurrency-Cap und Token-Budget, und ihre Tokens zählen ins Session-Budget.
- **Einsatz:** Workflow-Tool aus Claude Code aufrufen oder ein gespeichertes Workflow-Script per Name starten. Skripte beginnen mit `export const meta = { name, description, phases }` und nutzen `agent()`, `parallel()`, `pipeline()`, `phase()`.
- **Mehrwert:** Komplexe Multi-Agenten-Arbeit wird wiederholbar und nachvollziehbar — keine Ein-Schritt-Heuristiken mehr für Migrationen, breite Audits oder strukturierte Fan-Outs.
- **Version:** Plattform 2026-05-28

### [Mid-Conversation System Messages]
- **Was:** Auf Opus 4.8 lassen sich `role: "system"`-Messages nach einem User-Turn in den `messages`-Array einfügen. Prompt-Cache-Hits bleiben erhalten, wenn sich Instruktionen während einer lang laufenden Session ändern. Kein Beta-Header nötig.
- **Einsatz:** In API-Requests `{"role": "system", "content": "…"}` an erlaubten Positionen im Messages-Array senden (siehe Placement-Regeln in der Doku)
- **Mehrwert:** Lange Agent-Sessions können System-Instruktionen mitten im Verlauf aktualisieren, ohne den Prompt-Cache neu aufzubauen — spart Latenz und Kosten bei dynamischen Workflows.
- **Version:** Plattform 2026-05-28

### [`stop_details` für Refusal-Responses öffentlich dokumentiert]
- **Was:** Das `stop_details`-Feld auf Refusal-Responses ist nun offiziell dokumentiert. Es enthält eine `category` (`cyber`, `bio` oder `null`) und eine menschenlesbare `explanation`, damit Anwendungen verschiedene Refusal-Klassen unterschiedlich routen können. Kein Beta-Header nötig.
- **Einsatz:** Bei `stop_reason: "refusal"` das `stop_details`-Objekt aus der API-Response auslesen
- **Mehrwert:** Refusal-Handling lässt sich strukturiert in Produkt-Flows abbilden (z. B. Safety-Logging vs. User-Hinweis vs. Re-Routing), statt nur einen generischen Refusal-String zu sehen.
- **Version:** Plattform 2026-05-28

### [Fast Mode auf Opus 4.8 — drastisch günstiger]
- **Was:** Fast Mode für Claude Opus 4.8 startet auf der Claude API als Research Preview. Pricing: $10/$50 pro MTok Input/Output — laut Anthropic ca. 3× günstiger als bisherige Fast-Modes. In Claude Code laufen Max-Plan-User auf Opus 4.8 jetzt per Default in Fast Mode.
- **Einsatz:** `speed: "fast"` mit `model: "claude-opus-4-8"` auf der API; in Claude Code automatisch für Max-Plan-User auf 4.8 aktiv, ansonsten `/fast` toggeln
- **Mehrwert:** Spürbar schnelleres Token-Generation für interaktive Sessions zu deutlich niedrigeren Fast-Mode-Aufschlägen — Fast Mode wird damit alltagstauglich, nicht nur für Notfälle.
- **Version:** Plattform 2026-05-28

### [Auto Mode in Claude Code für mehr User]
- **Was:** Anthropic rollt Auto Mode (der Permission-Classifier, der sichere Aktionen ohne Prompt durchlässt und riskante blockiert) in Claude Code für lang laufende Tasks auf weitere User aus. Ergänzend hatte v2.1.152 bereits den Consent-Opt-in entfernt.
- **Einsatz:** In Settings / Permissions Auto Mode aktivieren; nach Rollout in der Account-Eligibility verfügbar
- **Mehrwert:** Lange agentische Läufe (Migrations, Audits, Bulk-Edits) brauchen weniger manuelle Permission-Klicks, ohne dass `--dangerously-skip-permissions` nötig wird.
- **Version:** Plattform 2026-05-28

### [Plattform-Erweiterungen für Opus 4.8: Task Budgets, Advisor, Computer Use, High-Res-Vision]
- **Was:** Task Budgets, Advisor Tool und Computer Use unterstützen jetzt Opus 4.8. High-Resolution-Image-Input (bis 2576 px Long Edge) bleibt wie auf 4.7 unterstützt. Sampling-Parameter (`temperature`, `top_p`, `top_k`) müssen auf Default bleiben — abweichende Werte liefern HTTP 400 (gleich wie 4.7).
- **Einsatz:** `model: "claude-opus-4-8"` in entsprechenden Tool-Calls / Vision-Requests setzen
- **Mehrwert:** 4.8 ist drop-in-kompatibel zu den 4.7-Tool-Ökosystemen — Migration ist ein Modell-ID-Wechsel, kein Refactor.
- **Version:** Plattform 2026-05-28

### [Fast Mode für Opus 4.6 wird deprecated]
- **Was:** Fast Mode für Claude Opus 4.6 ist als deprecated markiert; Entfernung ca. 30 Tage nach Launch (also ca. Ende Juni 2026). Migration: Fast Mode auf Opus 4.8 oder 4.7.
- **Einsatz:** API-Requests mit `model: "claude-opus-4-6"` + `speed: "fast"` rechtzeitig auf `claude-opus-4-8` umstellen
- **Mehrwert:** Frühzeitige Warnung vermeidet 4xx-Fehler in produktiven Fast-Mode-Pipelines nach der 30-Tage-Frist.
- **Version:** Plattform 2026-05-28

---

### Woche 22 (28. Mai 2026) — v2.1.153

---

### [`skipLfs` für github/git Plugin-Marketplaces]
- **Was:** `github`- und `git`-Plugin-Marketplace-Quellen akzeptieren jetzt eine `skipLfs`-Option, die Git-LFS-Downloads bei Clone und Update überspringt.
- **Einsatz:** `skipLfs: true` in der Marketplace-Source-Konfiguration setzen
- **Mehrwert:** Plugins mit großen LFS-Assets installieren schneller und sparen Bandbreite, wenn die LFS-Inhalte gar nicht benötigt werden.
- **Version:** v2.1.153

### [`/model` speichert Auswahl als neuen Default]
- **Was:** `/model` speichert die getroffene Auswahl jetzt als Default für neue Sessions. Mit `s` lässt sich das Modell nur für die aktuelle Session umstellen.
- **Einsatz:** `/model` öffnen → Modell auswählen (default) bzw. `s` drücken (nur diese Session)
- **Mehrwert:** Modellwechsel persistieren ohne Konfig-Edit — und temporäre Wechsel ohne Default-Verlust sind weiterhin möglich.
- **Version:** v2.1.153
- **Breaking:** Wer das Keybinding `modelPicker:setAsDefault` angepasst hat, muss es in `keybindings.json` zu `modelPicker:thisSessionOnly` umbenennen (`d`-Action wurde durch `s` ersetzt).

### [Einmal-Hinweis bei blockiertem npm-Auto-Update]
- **Was:** Wenn der globale npm-Install nicht auto-updaten kann, zeigt Claude Code einmalig einen Hinweis; `/doctor` listet die nötigen Fixes auf.
- **Einsatz:** Automatisch aktiv; bei Bedarf `/doctor` aufrufen
- **Mehrwert:** Hängengebliebene Versionen fallen sofort auf, statt unbemerkt zu veralten.
- **Version:** v2.1.153

### [Status-Line-Commands kennen `COLUMNS`/`LINES`]
- **Was:** Status-Line-Befehle erhalten jetzt die Umgebungsvariablen `COLUMNS` und `LINES` für terminal-bewusste Ausgabengrößen.
- **Einsatz:** Im Status-Line-Skript `$COLUMNS` / `$LINES` lesen
- **Mehrwert:** Status-Line-Skripte können ihre Ausgabe an die aktuelle Terminalbreite anpassen — kein Abschneiden oder Umbrechen mehr.
- **Version:** v2.1.153

### [`claude agents`: Autocomplete für Slash-Commands & Skills]
- **Was:** Im Dispatch-Input von `claude agents` schlägt der Autocomplete jetzt native Slash-Commands und gebündelte Skills vor. Die PR-Spalte zeigt `PR #N` bei einer PR bzw. `N PRs` bei mehreren.
- **Einsatz:** `claude agents` öffnen und im Dispatch-Input tippen
- **Mehrwert:** Schnellerer Zugriff auf Commands/Skills aus der Agent-View und übersichtlichere Mehrfach-PR-Anzeige.
- **Version:** v2.1.153

### [`claude doctor` zeigt letztes Update-Ergebnis]
- **Was:** `claude doctor` zeigt jetzt das Ergebnis des letzten Update-Versuchs an.
- **Einsatz:** `claude doctor` aufrufen
- **Mehrwert:** Beim Troubleshooting sofort sichtbar, ob das letzte Auto-Update funktioniert hat oder gescheitert ist — ohne in Logs zu graben.
- **Version:** v2.1.153

### [Zusammengeführte „needs authentication"-Notifications]
- **Was:** Separate „needs authentication"-Benachrichtigungen für MCP-Server und Connectoren werden zu einer einzigen Meldung zusammengeführt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Notification-Lärm, klarerer Re-Auth-Hinweis.
- **Version:** v2.1.153

### [macOS: Background-Agents als „Claude Code" in Privacy & Security]
- **Was:** Background-Agents erscheinen auf macOS jetzt unter dem Namen „Claude Code" in den Privacy-&-Security-Settings — mit persistenten Permission-Grants über Sessions hinweg.
- **Einsatz:** Automatisch aktiv (macOS)
- **Mehrwert:** Permissions (z. B. Files, Accessibility) müssen nicht bei jeder Session neu erteilt werden und bleiben einem klar benannten Eintrag zugeordnet.
- **Version:** v2.1.153

### [Fixes in v2.1.153]
- **Was:** Breite Fix-Welle: stateful MCP-Server ohne optionalen GET-SSE-Stream loopen nicht mehr auf `tools/list` (Regression aus v2.1.147); Custom-API-Gateway erhält wieder das Gateway-Token statt der User-OAuth-Credential; Subagent-Frontmatter-MCP-Server respektieren `--strict-mcp-config`, `--bare`, Remote-Mode und Managed-Settings-Policies; `--strict-mcp-config` strippt inline `mcpServers` aus explizit übergebenen Agent-Definitionen nicht mehr; Windows-PowerShell-Installer meldet keinen falschen Erfolg mehr; `claude update` installiert wieder die für den konfigurierten Release-Channel passende Version statt der neuesten; Speicherverbrauch beim Resume per Transcript-File auf Maschinen mit vielen Sessions stark reduziert; CLI exited sauber, wenn stdin im `stream-json`-Mode ohne EOF schließt; malformed `file://`-Links werden im Terminal wieder klickbar; `claude --help` rendert auf schmalen Terminals korrekt umbrochen; MCP-Tool-Progress-Notifications erscheinen im kollabierten Tool-View; `Agent`-Tool mit `subagent_type: 'claude'` verwirft keine gitignored Outputs mehr stillschweigend; `/bg` verliert keine Antworten mehr während Claude antwortet; `/btw`-Keyboard-Shortcuts bleiben in Background-Sessions reagibel; Temp-Files lösen keine „sensitive file"-Permission-Prompts mehr aus; Stack-Traces für gelöschte Working-Directories nicht mehr abgeschnitten; `EnterWorktree`-Verfügbarkeit in Background-Sessions korrekt getimt; `cmd+k` repaintet wieder attached Background-Sessions in iTerm2/Terminal.app; IME-Candidate-Window-Position auf Windows korrigiert; Background-Color-Bleed in 256-Color-Terminals nach File-Diffs behoben; `/copy` aktualisiert die Clipboard auch in Background-Sessions in tmux; Remote-Control-Zombie-Sessions entfernt; `/rename` aktualisiert das Session-Banner sofort; Windows-Update-Rollback-Wiederherstellung repariert; VS-Code-Prozess-Cleanup auf Windows.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabilere MCP-Verbindungen, sauberere Auth-/Gateway-Trennung, geringerer Speicherverbrauch und zahlreiche Terminal-/Windows-/Background-Session-Korrekturen.
- **Version:** v2.1.153

---

### Woche 22 (27. Mai 2026) — v2.1.152

---

### [`/code-review --fix` schreibt Funde direkt in den Working Tree]
- **Was:** `/code-review --fix` wendet die Review-Funde nach dem Review direkt im Arbeitsbaum an und zeigt dabei Vorschläge zu Wiederverwendung, Vereinfachung und Effizienz. `/simplify` ruft jetzt `/code-review --fix` auf.
- **Einsatz:** `/code-review --fix` (oder `/simplify`)
- **Mehrwert:** Aufräum- und Korrektur-Vorschläge landen ohne manuelles Nachtippen direkt im Code — ein Schritt von Review zu Fix.
- **Version:** v2.1.152

### [Skills/Slash-Commands können `disallowed-tools` setzen]
- **Was:** Skills und Slash-Commands können im Frontmatter `disallowed-tools` angeben, um dem Modell bestimmte Tools zu entziehen, solange der Skill aktiv ist.
- **Einsatz:** `disallowed-tools:` im Skill-/Command-Frontmatter
- **Mehrwert:** Skills lassen sich gezielt einschränken (z. B. kein Bash, kein Write) — sichereres, fokussierteres Verhalten pro Skill.
- **Version:** v2.1.152

### [`/reload-skills` & SessionStart-Hook-Reload]
- **Was:** Neuer Befehl `/reload-skills` scannt Skill-Verzeichnisse neu, ohne die Session neu zu starten. `SessionStart`-Hooks können `reloadSkills: true` zurückgeben, sodass per Hook installierte Skills sofort in derselben Session verfügbar sind.
- **Einsatz:** `/reload-skills` aufrufen, bzw. `reloadSkills: true` aus einem SessionStart-Hook zurückgeben
- **Mehrwert:** Neu hinzugefügte oder per Hook installierte Skills sind sofort nutzbar — kein Session-Neustart mehr nötig.
- **Version:** v2.1.152

### [SessionStart-Hook kann Session-Titel setzen]
- **Was:** `SessionStart`-Hooks können beim Start und beim Resume den Session-Titel über `hookSpecificOutput.sessionTitle` setzen.
- **Einsatz:** `sessionTitle` in `hookSpecificOutput` eines SessionStart-Hooks zurückgeben
- **Mehrwert:** Sessions bekommen automatisch aussagekräftige, eigene Titel — leichtere Wiederfindung in `/resume` und Agent-View.
- **Version:** v2.1.152

### [Neuer `MessageDisplay`-Hook-Event]
- **Was:** Ein neuer `MessageDisplay`-Hook-Event erlaubt Hooks, den angezeigten Assistant-Text zu transformieren oder auszublenden, während er dargestellt wird.
- **Einsatz:** Hook auf den `MessageDisplay`-Event registrieren
- **Mehrwert:** Ausgaben lassen sich live filtern, umformatieren oder zensieren (z. B. Secrets ausblenden) — bevor sie der Nutzer sieht.
- **Version:** v2.1.152

### [Enterprise: `pluginSuggestionMarketplaces` Managed-Setting]
- **Was:** Neues Managed-Setting `pluginSuggestionMarketplaces`: Admins können Org-Marketplaces freigeben, deren Plugins über kontextbezogene Tipps vorgeschlagen werden dürfen.
- **Einsatz:** `pluginSuggestionMarketplaces` in den Managed-Settings setzen
- **Mehrwert:** Plugin-Empfehlungen lassen sich organisationsweit auf vertrauenswürdige Quellen begrenzen.
- **Version:** v2.1.152

### [`marketplace remove` mit `--scope`]
- **Was:** `claude plugin marketplace remove` akzeptiert jetzt `--scope user|project|local` — symmetrisch zu `marketplace add`, `install` und `uninstall`.
- **Einsatz:** `claude plugin marketplace remove <name> --scope project`
- **Mehrwert:** Marketplaces gezielt pro Scope entfernen statt global — konsistenteres Plugin-Management.
- **Version:** v2.1.152

### [Fallback-Modell bei unbekanntem Primärmodell]
- **Was:** Bei einem nicht gefundenen Primärmodell wechselt Claude Code für den Rest der Session auf das konfigurierte `--fallback-model`, statt jede Anfrage scheitern zu lassen.
- **Einsatz:** `--fallback-model <model>` setzen
- **Mehrwert:** Sessions laufen weiter, auch wenn das gewünschte Modell (z. B. nach Umbenennung/Abkündigung) nicht verfügbar ist.
- **Version:** v2.1.152

### [Auto-Mode ohne Opt-in-Zustimmung]
- **Was:** Der Auto-Mode erfordert keine vorherige Opt-in-Zustimmung mehr.
- **Einsatz:** Auto-Mode (Shift+Tab-Zyklus) direkt nutzen
- **Mehrwert:** Schnellerer Einstieg in den Auto-Mode ohne extra Bestätigungsdialog.
- **Version:** v2.1.152

### [Vim-Mode: `/` öffnet Reverse-History-Suche]
- **Was:** Im Vim-NORMAL-Mode öffnet `/` jetzt die Reverse-History-Suche (wie `Ctrl+R`) — passend zum vi-Mode von bash/zsh.
- **Einsatz:** Im Vim-NORMAL-Mode `/` drücken
- **Mehrwert:** Vertrautes vi-Verhalten für die Prompt-History-Suche.
- **Version:** v2.1.152

### [`/usage`-Aufschlüsselung inkl. großer Session-Dateien]
- **Was:** Die `/usage`-Aufschlüsselung umfasst jetzt auch große Session-Dateien; sie werden per Streaming-Read gescannt, sodass der Speicherverbrauch konstant bleibt.
- **Einsatz:** `/usage` aufrufen
- **Mehrwert:** Vollständigeres Bild der Limit-Treiber, ohne dass der Scan den Speicher belastet.
- **Version:** v2.1.152

### [Lesbarere Thinking-Summaries]
- **Was:** Thinking-Summaries in der eingeklappten Gruppe bleiben jetzt mindestens 3 Sekunden lesbar, rendern als Markdown und sind auf 10 Zeilen begrenzt (`Ctrl+O` zeigt das vollständige Thinking). Im Fullscreen-Mode zählt der „Thinking for Ns"-Indikator live hoch und behält seinen Wert bei einer Unterbrechung mitten im Denken.
- **Einsatz:** Automatisch aktiv (`Ctrl+O` für vollständiges Thinking)
- **Mehrwert:** Thinking-Verläufe sind besser lesbar und flackern nicht weg — nachvollziehbarer, ohne den Lesefluss zu stören.
- **Version:** v2.1.152

### [Workflow-Fortschritt & Hintergrund-Timer aufgeräumt]
- **Was:** Die Inline-Fortschrittsanzeige des Workflow-Tools wurde vereinfacht — Live-Agent-Zahlen erscheinen nur noch in der persistenten Workflow-Statuszeile unter dem Prompt. Der Post-Response-Timer zeigt jetzt „Waiting for N background agents/workflows to finish", solange Hintergrund-Agents/-Workflows laufen, und meldet die kumulierte Zeit, sobald deren Ergebnisse verarbeitet sind.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Übersichtlichere Fortschrittsanzeige und klare Rückmeldung, worauf die Session gerade wartet.
- **Version:** v2.1.152

### [OTEL: Session-Entrypoint als Metrik-Attribut]
- **Was:** Der Session-Entrypoint ist jetzt als OpenTelemetry-Metrik-Attribut verfügbar (`app.entrypoint`, opt-in via `OTEL_METRICS_INCLUDE_ENTRYPOINT=true`).
- **Einsatz:** `OTEL_METRICS_INCLUDE_ENTRYPOINT=true` setzen
- **Mehrwert:** Telemetrie kann Nutzung nach Einstiegspunkt aufschlüsseln — feinere Auswertung in Org-Dashboards.
- **Version:** v2.1.152

### [Weitere Fixes in v2.1.152]
- **Was:** Zahlreiche kleinere Fixes: Terminal-Styling degradierte in sehr langen Sessions nicht mehr (Style-Pool wird recycelt); Sandbox-Warnung erscheint jetzt in jedem Layout (auch im kondensierten Start); Spinner zeigt nicht mehr fälschlich „still thinking" während ein Tool läuft; Focus-Mode zeigt keinen falschen „N messages hidden"-Zähler mehr; Klick auf Links in aufgeklappten Tool-Results öffnet den Link statt die Sektion einzuklappen; mehrere Markdown-Tabellen-Rendering-Bugs behoben; Plugin-MCP-Server mit gleichem Command aber unterschiedlichen Env-Variablen werden nicht mehr fälschlich dedupliziert; `/doctor` meldet keine „marketplace/plugin not found" mehr für veraltete `enabledPlugins`-Einträge; branch-tracking-Plugins erhalten nach Registry-Rebuild wieder Updates; Remote-MCP-Server verbinden sich in Remote-Sessions auch bei aktivem Egress-Proxy; Effort-Change-Dialog erscheint nicht mehr ohne Messages oder bei gleichem Zielwert; Agent-Tool-Beschreibung referenziert keine nie gelieferte Agent-Liste mehr bei `--bare`; Worker-Crash in `claude agents` beim Annehmen veralteter Permission-Prompts nach Subagent-Abbruch behoben; `cache_creation_input_tokens` meldet Cache-Writes korrekt; PushNotification meldet in SDK-Sessions mit aktivem Remote-Control nicht mehr fälschlich „Mobile push not sent"; festhängende Sessions nach Modell-/Login-Wechsel durch veraltete Thinking-Block-Signaturen behoben (werden proaktiv entfernt, mit Retry-Sicherheitsnetz).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Breite Sammlung von Stabilitäts-, Telemetrie- und UI-Korrekturen für reibungsloseres Arbeiten in langen Sessions und Remote-/Background-Setups.
- **Version:** v2.1.152

---

### Woche 21 (23. Mai 2026) — v2.1.150

---

### [v2.1.150 — interne Infrastruktur-Verbesserungen]
- **Was:** Reines Wartungs-Release mit internen Infrastruktur-Verbesserungen, ohne nutzersichtbare Änderungen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabilitäts-/Wartungs-Update unter der Haube — keine Verhaltensänderung im Alltag.
- **Version:** v2.1.150

---

### Woche 21 (22. Mai 2026) — v2.1.149

---

### [`/usage` mit Kategorie-Aufschlüsselung]
- **Was:** `/usage` zeigt jetzt pro Kategorie, was die Limit-Nutzung treibt — Skills, Subagents, Plugins und Kosten pro einzelnem MCP-Server.
- **Einsatz:** `/usage` aufrufen
- **Mehrwert:** Du siehst auf einen Blick, welcher Skill, Subagent, Plugin oder MCP-Server dein Limit auffrisst — gezieltes Optimieren von teuren Setups.
- **Version:** v2.1.149

### [`/diff`-Detailansicht per Tastatur scrollbar]
- **Was:** Die `/diff`-Detailansicht lässt sich jetzt mit der Tastatur scrollen (Pfeiltasten, `j`/`k`, `PgUp`/`PgDn`, `Space`, `Home`/`End`).
- **Einsatz:** In der `/diff`-Detailansicht mit den genannten Tasten navigieren
- **Mehrwert:** Lange Diffs ohne Maus durchblättern — flüssigeres Review direkt im Terminal.
- **Version:** v2.1.149

### [Markdown rendert GFM-Task-Listen als Checkboxen]
- **Was:** Markdown-Ausgabe rendert GitHub-Flavored-Task-Listen (`- [ ] todo` / `- [x] done`) jetzt als echte Checkboxen statt als schlichte Aufzählungspunkte.
- **Einsatz:** Automatisch aktiv (Task-Listen-Syntax in Markdown)
- **Mehrwert:** To-do-Listen sind auf einen Blick als erledigt/offen erkennbar — bessere Lesbarkeit von Plänen und Checklisten.
- **Version:** v2.1.149

### [Enterprise: `allowAllClaudeAiMcps` Managed-Setting]
- **Was:** Neues Managed-Setting `allowAllClaudeAiMcps` lädt claude.ai-Cloud-MCP-Connectors zusätzlich zur `managed-mcp.json`.
- **Einsatz:** `allowAllClaudeAiMcps` in den Managed-Settings setzen
- **Mehrwert:** Admins können claude.ai-Cloud-Connectors organisationsweit freigeben, ohne sie einzeln in `managed-mcp.json` zu pflegen.
- **Version:** v2.1.149

### [Mehrere PowerShell-/Sandbox-Sicherheitslücken geschlossen]
- **Was:** Behoben: (1) PowerShell-Permission-Bypass durch eingebaute `cd`-Funktionen (`cd..`, `cd\`, `cd~`, `X:`), die das Arbeitsverzeichnis unbemerkt änderten und so spätere Befehle außerhalb des Workspace lesen ließen; (2) Sandbox-Write-Allowlist in Git-Worktrees deckte fälschlich das gesamte Haupt-Repo-Root statt nur das geteilte `.git`-Verzeichnis ab (mit `hooks/` und `config` verweigert); (3) PowerShell-Prefix-/Wildcard-Allow-Regeln (z. B. `PowerShell(dotnet.exe build *)`) genehmigten native Executables/Skripte nicht vorab; (4) Permission-Analyse vertraute veralteten Variablen-Tracking-Werten für `PWD`/`OLDPWD`/`DIRSTACK` über `cd`/`pushd`/`popd` hinweg.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Mehrere Wege, die Workspace-/Sandbox-Grenzen zu umgehen, sind dicht — Permission-Regeln greifen wieder zuverlässig, besonders unter Windows/PowerShell und in Worktrees.
- **Version:** v2.1.149

### [Fix: `find` brachte macOS-Host zum Absturz]
- **Was:** `find` im Bash-Tool erschöpfte bei großen Verzeichnisbäumen die macOS-System-Datei-/vnode-Tabelle und brachte den Host zum Absturz. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Große Verzeichnis-Scans crashen den Mac nicht mehr — sicheres Arbeiten in umfangreichen Repos.
- **Version:** v2.1.149

### [Fix: `/ultraplan` & Remote-Sessions ohne echte Änderungen]
- **Was:** `/ultraplan` und das Erstellen von Remote-Sessions scheiterten mit „Could not capture uncommitted changes", wenn der Working Tree keine echten Änderungen enthielt. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Ultraplan und Remote-Sessions starten auch aus einem sauberen Arbeitsverzeichnis heraus zuverlässig.
- **Version:** v2.1.149

### [`/feedback` enthält Konversation vor der Kompaktierung]
- **Was:** `/feedback`-Reports enthalten jetzt auch die Konversation, die vor der Context-Kompaktierung stattfand.
- **Einsatz:** `/feedback` aufrufen
- **Mehrwert:** Probleme aus früheren Phasen langer Sessions lassen sich leichter nachvollziehen und triagen — der Kontext geht im Report nicht verloren.
- **Version:** v2.1.149

### [Weitere Fixes in v2.1.149]
- **Was:** Zahlreiche kleinere Fixes: Managed-Settings-Genehmigungsdialog fror das Terminal nach Annahme beim Start nicht mehr ein; `otelHeadersHelper` scheiterte still bei Leerzeichen im Skript-Pfad (Fehler nun in `/doctor` und Debug-Log sichtbar); Thinking-Spinner blieb über Tool-Calls hinweg amber; eingeklappte Bash-Ausgabe meldete falsche Zahl versteckter Zeilen; Slash-Command-Argument-Hint schnitt getippte Zeichen ab bzw. erschien nicht nach Tab-Vervollständigung eines Skills mit abweichendem `name:`; Statusleiste zeigte Basis-`/effort` statt des per Skill/Agent-`effort:` angewandten Levels; `Ctrl+O`-Transcript fror beim Öffnen ein statt nachzuladen; editierter History-Prompt verlor die Änderung beim Weiterscrollen; `/config`-Exit-Summary meldete Phantom-Änderungen an Auto-Compact/Theme; `/insights` crashte bei fehlenden optionalen Feldern; verstümmelte PowerShell-/History-Tool-Calls wurden falsch als Reads klassifiziert; umbenannte Remote-Control-Session aktualisierte lokalen Namen für `claude --resume` nicht; Race, bei dem ein gerade abgeschickter Prompt doppelt in der History erschien; „Jump to bottom"-Pill im Fullscreen verschwand nicht sofort.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sammlung von Stabilitäts-, Sicherheits- und UI-Korrekturen, die Reibung im täglichen Arbeiten reduzieren.
- **Version:** v2.1.149

---

### Woche 21 (22. Mai 2026) — v2.1.148

---

### [Fix: Bash-Tool gab für manche User auf jeden Befehl Exit-Code 127 zurück]
- **Was:** Bei manchen Nutzern lieferte das Bash-Tool für jeden Befehl Exit-Code 127 (Regression aus v2.1.147). Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Das Shell-Tool funktioniert wieder zuverlässig — keine fälschlich als fehlgeschlagen markierten Befehle mehr.
- **Version:** v2.1.148

---

### Woche 21 (21. Mai 2026) — v2.1.147

---

### [Gepinnte Hintergrund-Sessions bleiben am Leben]
- **Was:** Mit `Ctrl+T` in `claude agents` gepinnte Hintergrund-Sessions bleiben jetzt auch im Idle aktiv, werden für Claude-Code-Updates an Ort und Stelle neu gestartet und erst nach allen ungepinnten Sessions unter Speicherdruck beendet.
- **Einsatz:** In `claude agents` eine Session mit `Ctrl+T` pinnen
- **Mehrwert:** Wichtige Langläufer-Sessions überleben Leerlauf, Updates und Speicherknappheit — sie verschwinden nicht mehr unerwartet.
- **Version:** v2.1.147

### [`/code-review` mit `--comment` für Inline-PR-Kommentare]
- **Was:** Der umbenannte Befehl `/code-review` meldet Korrektheits-Bugs auf einem wählbaren Effort-Level (z. B. `/code-review high`); mit `--comment` werden Funde direkt als Inline-Kommentare in den GitHub-PR gepostet. Das alte Aufräum-und-Fix-Verhalten von `/simplify` wurde entfernt.
- **Einsatz:** `/code-review high --comment`
- **Mehrwert:** Review-Funde landen direkt am Code im PR statt nur im Terminal — nahtloser Review-Workflow für Teams.
- **Version:** v2.1.147

### [Prompt-History ohne aufeinanderfolgende Duplikate]
- **Was:** Die Prompt-History speichert keine direkt aufeinanderfolgenden identischen Einträge mehr — einen Prompt per Pfeil-hoch zurückzuholen und erneut abzuschicken legt keine weitere Kopie an.
- **Einsatz:** Automatisch aktiv (Pfeil-hoch in der Eingabe)
- **Mehrwert:** Sauberere History-Navigation ohne Dubletten beim Wiederholen von Prompts.
- **Version:** v2.1.147

### [Fix: Hook-`if`-Bedingungen mit Argument-Muster griffen nie]
- **Was:** Hook-`if`-Bedingungen wie `PowerShell(git push*)` matchten nie — nur `PowerShell(*)` funktionierte. Behoben.
- **Einsatz:** Automatisch aktiv (Hook-Konfiguration)
- **Mehrwert:** Befehls-spezifische Hook-Regeln greifen jetzt wie dokumentiert — gezieltes Auslösen von Hooks pro Kommando.
- **Version:** v2.1.147

### [Fix: Eingefügter Text kam als Platzhalter statt Inhalt an]
- **Was:** An Agents übergebener eingefügter Text wurde als unlesbarer Platzhalter `[Pasted text #N]` zugestellt statt mit dem tatsächlichen Inhalt. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Agents erhalten den echten eingefügten Inhalt — kein Verlust von kopiertem Code oder Text mehr.
- **Version:** v2.1.147

### [Fix: Unbekannte Slash-Commands im Headless-/SDK-Modus zeigen jetzt Fehler]
- **Was:** Unbekannte Slash-Commands taten im Headless-/SDK-Modus stillschweigend nichts; sie zeigen jetzt eine Fehlermeldung. Außerdem werden Slash-Commands gefolgt von Tab/Newline nicht mehr fälschlich als unbekannt behandelt.
- **Einsatz:** Automatisch aktiv (Headless/SDK)
- **Mehrwert:** Tippfehler in Commands fallen sofort auf statt unbemerkt ins Leere zu laufen — weniger stille Fehlläufe in Automatisierungen.
- **Version:** v2.1.147

### [Weitere Fixes in v2.1.147]
- **Was:** Diverse Korrekturen: `&` in `!`-Befehls-Output wurde als `&amp;` angezeigt (brach URL-Copy-Paste, z. B. bei `gcloud auth login` auf Headless-Maschinen); `/help` zeigte auf kleinen Terminals einen kaputten Tab-Header und nur einen Befehl pro Seite; Shell-Snapshots verloren User-Funktionen, deren Name mit einem führenden Unterstrich beginnt; Plugin-Agents mit mehreren `Agent(...)`-Typen im `tools:`-Frontmatter verloren alle bis auf den letzten Eintrag; PowerShell-Tool verlor Output bei Befehlen, die auf den Default-Formatter angewiesen sind; Windows-„Yes, and don't ask again" für PowerShell-Skript-Aufrufe schreibt jetzt eine wirklich matchende Regel; PowerShell scheiterte unter Windows mit Exit-Code 1 bei winget-/Store-`pwsh`; `/effort`-Slider startete auf dem falschen Level; seltener Hang beim Warten aufs Scroll-Settle unter Windows; veraltete/doppelte Zeilen in der Agent-Ansicht bei CJK-Zeichen unter Windows; doppelte Plugin-Component-Counts in `claude plugin details` und `/plugin`; Spacing-/Layout-Glitches in `/plugin`, `/status`, `/mobile`, `/sandbox`, `/permissions`; gestrippte Bilder ließen das Modell nicht mehr vorhandene Medien wiederholt neu laden.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar rundere Bedienung quer durch Windows, PowerShell, Plugins, Menüs und Headless-Betrieb.
- **Version:** v2.1.147

---

### Woche 21 (21. Mai 2026) — v2.1.146

---

### [`/simplify` umbenannt zu `/code-review` mit Effort-Level]
- **Was:** Der Slash-Command `/simplify` heißt jetzt `/code-review` und akzeptiert ein optionales Effort-Level (z. B. `/code-review high`).
- **Einsatz:** `/code-review` bzw. `/code-review high`
- **Mehrwert:** Klarerer Name für das, was der Befehl tut, plus steuerbare Gründlichkeit des Reviews — schneller Überblick oder tiefe Analyse je nach Bedarf.
- **Version:** v2.1.146

### [Auto-Modus unterdrückt `AskUserQuestion` nicht mehr]
- **Was:** Der Auto-Modus blockiert `AskUserQuestion` nicht mehr, wenn der User oder ein Skill sich explizit darauf verlässt.
- **Einsatz:** Automatisch aktiv (Auto-Modus)
- **Mehrwert:** Skills und Workflows, die gezielt Rückfragen stellen, funktionieren auch im Auto-Modus zuverlässig — keine still verschluckten Entscheidungspunkte mehr.
- **Version:** v2.1.146

### [Fix: Windows-PowerShell „command line is invalid" mit winget/Store-pwsh]
- **Was:** Das PowerShell-Tool scheiterte unter Windows mit „command line is invalid", wenn `pwsh` via winget oder Microsoft Store installiert war (Regression in v2.1.124). Behoben.
- **Einsatz:** Automatisch aktiv (Windows)
- **Mehrwert:** Windows-Nutzer mit Store-/winget-PowerShell können das Shell-Tool wieder normal verwenden.
- **Version:** v2.1.146

### [Fix: MCP-Listen verloren Einträge ab Seite 2]
- **Was:** `resources/list`, `resources/templates/list` und `prompts/list` ließen bei paginierenden MCP-Servern Einträge ab der ersten Seite fallen. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Vollständige Ressourcen-, Template- und Prompt-Listen von MCP-Servern mit vielen Einträgen — keine still fehlenden Items mehr.
- **Version:** v2.1.146

### [Fix: Hintergrund-Sessions fragten erneut nach bereits erteilten Permissions]
- **Was:** Backgrounded Sessions fragten erneut nach Tool-Permissions, die bereits mit „don't ask again" erteilt waren. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Einmal erteilte Dauer-Freigaben gelten auch in Hintergrund-Sessions — weniger redundante Prompts in parallelen Jobs.
- **Version:** v2.1.146

### [Fix: `/background` lehnte reine Skill-/Slash-Command-Eingaben ab]
- **Was:** `/background` verweigerte Sessions, deren einzige getippte Eingabe ein Skill oder ein eigener Slash-Command war. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Auch Skill- oder Command-getriebene Aufgaben lassen sich direkt in den Hintergrund schicken.
- **Version:** v2.1.146

### [Fix: `forceLoginOrgUUID`/`forceLoginMethod` jetzt auch gegen 3P-/API-Key-Sessions]
- **Was:** Die Managed-Settings-Policies `forceLoginOrgUUID` und `forceLoginMethod` wurden bei Third-Party-Provider- und API-Key-Sessions nicht durchgesetzt. Behoben.
- **Einsatz:** Automatisch aktiv (Managed Settings)
- **Mehrwert:** Login-Policies greifen nun konsistent über alle Auth-Wege — relevant für Org-Compliance und Zugriffskontrolle.
- **Version:** v2.1.146

### [Fix: `CLAUDE_CODE_SUBAGENT_MODEL` an Kindprozesse weitergegeben]
- **Was:** `CLAUDE_CODE_SUBAGENT_MODEL` wurde in Multi-Agent-Sessions nicht an Kindprozesse weitergereicht. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Das gewünschte Subagent-Modell gilt jetzt durchgängig in verschachtelten Agent-Hierarchien.
- **Version:** v2.1.146

### [Verbesserter Auto-Updater & schnelleres Diff-Rendering]
- **Was:** Der Auto-Updater wiederholt jetzt transiente Netzwerkfehler bei Versions-Checks und Downloads statt sofort zu scheitern; die Statuszeile zeigt bei fehlgeschlagenem Update wieder die aktuelle Version. Zusätzlich wurde das Diff-Rendering für große Datei-Edits beschleunigt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Zuverlässigere Updates in instabilen Netzen und flüssigere Anzeige bei umfangreichen Änderungen.
- **Version:** v2.1.146

### [Weitere Fixes in v2.1.146]
- **Was:** Diverse Korrekturen: Fullscreen-Strobing in attached Hintergrund-Sessions auf Windows Terminal während des Streamings; Entfernen eines Hintergrund-Job-Worktrees folgte unter Windows nicht mehr NTFS-Junctions ins Haupt-Repo; `/theme`-Farbeditor und „New custom theme"-Dialoge reagierten nicht auf Esc; uncaught Exception am Ende von Streaming-Sessions über das Agent SDK; GNOME-Terminal-Rechts-/Mittelklick-Paste fügte keinen Text ein.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabileres Verhalten quer durch Windows-Terminal, Worktree-Cleanup, Theme-Dialoge, Agent SDK und GNOME-Terminal.
- **Version:** v2.1.146

---

### Woche 21 (19. Mai 2026) — v2.1.145

---

### [`claude agents --json` — Live-Sessions als JSON]
- **Was:** Der neue Flag `claude agents --json` listet alle laufenden Claude-Code-Sessions in maschinenlesbarem JSON statt im interaktiven Agent-View.
- **Einsatz:** `claude agents --json` (z. B. in Skripten oder Dashboards weiterverarbeiten)
- **Mehrwert:** Ermöglicht eigene Monitoring-Tools, Statuszeilen oder CI-Checks über alle parallelen Sessions — ohne Screen-Scraping des TUI.
- **Version:** v2.1.145

### [`agent_id` & `parent_agent_id` in OTEL-Spans]
- **Was:** OTEL-Telemetrie-Spans enthalten jetzt `agent_id` und `parent_agent_id`, und das Trace-Parenting wurde korrigiert, sodass Subagents sauber unter ihrem Eltern-Agent hängen.
- **Einsatz:** Automatisch aktiv (bei aktiviertem OTel-Export)
- **Mehrwert:** Verschachtelte Agent-Hierarchien lassen sich in Observability-Tools (Honeycomb, Grafana Tempo etc.) korrekt nachvollziehen — wichtig zum Debuggen von Multi-Agent-Workflows.
- **Version:** v2.1.145

### [Statuszeile-JSON enthält GitHub-Repo & PR-Infos]
- **Was:** Das JSON, das an Statuszeilen-Skripte übergeben wird, enthält jetzt zusätzlich Informationen über das GitHub-Repo und den zugehörigen PR.
- **Einsatz:** Automatisch im Statuszeilen-JSON verfügbar
- **Mehrwert:** Eigene Statuszeilen können den aktuellen PR-Kontext anzeigen (z. B. PR-Nummer, Branch) — direkt im Blickfeld, ohne Kontextwechsel zu GitHub.
- **Version:** v2.1.145

### [`/plugin`-Screens zeigen vollständiges Komponenten-Inventar]
- **Was:** Die `/plugin`-Screens listen jetzt Commands, Agents, Skills, Hooks sowie MCP- und LSP-Server eines Plugins auf.
- **Einsatz:** Automatisch aktiv in den `/plugin`-Detailansichten
- **Mehrwert:** Vor der Installation komplett transparent, was ein Plugin alles mitbringt und welche Hooks/Server es startet — bessere Bewertung von Funktionsumfang und Sicherheitsfläche.
- **Version:** v2.1.145

### [`claude agents`-Tab zeigt Awaiting-Input-Count]
- **Was:** Der Tab-Titel im Agent-View zeigt jetzt, wie viele Sessions auf eine Eingabe von dir warten.
- **Einsatz:** Automatisch aktiv im `claude agents`-View
- **Mehrwert:** Auf einen Blick sichtbar, wie viele parallele Jobs gerade auf dich warten — kein Durchklicken nötig, um blockierte Sessions zu finden.
- **Version:** v2.1.145

### [Slash-Command-Vorschläge per Maus im Fullscreen]
- **Was:** Slash-Command-Vorschläge lassen sich im Fullscreen-Modus jetzt per Maus-Hover und -Klick auswählen.
- **Einsatz:** Automatisch aktiv (Fullscreen-TUI)
- **Mehrwert:** Maus-Nutzer können Befehle direkt anklicken statt mit Pfeiltasten zu navigieren — niedrigere Einstiegshürde für gelegentliche CLI-Nutzer.
- **Version:** v2.1.145

### [Stop/SubagentStop-Hooks: `background_tasks` & `session_crons`]
- **Was:** Die JSON-Payload an Stop- und SubagentStop-Hooks enthält jetzt die Felder `background_tasks` und `session_crons`.
- **Einsatz:** Automatisch im Hook-JSON verfügbar
- **Mehrwert:** Hooks können beim Beenden prüfen, ob noch Background-Tasks oder geplante Crons offen sind — z. B. um eine Session nicht vorzeitig zu schließen oder offene Jobs zu melden.
- **Version:** v2.1.145

### [Read-Tool zeigt „PARTIAL view" bei großen Dateien]
- **Was:** Das Read-Tool zeigt bei sehr großen Dateien jetzt eine gekürzte erste Seite mit einem expliziten „PARTIAL view"-Hinweis, statt zu scheitern oder still abzuschneiden.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Claude erkennt klar, dass nur ein Ausschnitt einer Datei vorliegt, und kann gezielt mit Offset/Limit nachladen — weniger Halluzinationen über Dateiinhalte.
- **Version:** v2.1.145

### [Fix: Permission-Prompt-Bypass bei reinen Variablen-Zuweisungen]
- **Was:** Bare Variablen-Zuweisungen in Bash (z. B. `FOO=bar`) konnten den Permission-Prompt umgehen. Das wurde korrigiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schließt eine Lücke, über die potenziell ungeprüfte Shell-Statements durchrutschen konnten — relevant für die Sicherheit von Auto- und Permission-Modi.
- **Version:** v2.1.145

### [Fix: `context: fork`-Skills lösten Endlosschleife aus]
- **Was:** Skills mit `context: fork` konnten unter Umständen in eine Endlosschleife laufen. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Forking-Skills sind wieder zuverlässig nutzbar, ohne die Session aufzuhängen.
- **Version:** v2.1.145

### [Weitere Fixes in v2.1.145]
- **Was:** Diverse Korrekturen: MCP-Prompt-Slash-Commands zeigten rohe Validierungsfehler; Spinner/Elapsed-Time fror nach Terminal-Resize ein; Cross-Project-Resume-Hint in Windows PowerShell 5.1; Voice-Push-to-Talk im Agent-View-Reply-Pane; Task-Listen rendern nicht mehr in zufälliger Reihenfolge; stale „Failed to install marketplace"-Banner; PR-Badge aktualisierte sich nicht nach `gh pr create`; Agent-Teams-Teammates mit Nicht-ASCII-Namen scheiterten bei API-Calls; `/review` nutzte eine veraltete GraphQL-Query; `claude plugin validate` flaggte Skill-Dateipfade nicht.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabileres Verhalten quer durch Agent-View, MCP, Windows-Terminal, Plugin-Validierung und PR-Workflows.
- **Version:** v2.1.145

---

### Woche 21 (19. Mai 2026) — v2.1.144

---

### [`/resume`-Support für Background-Sessions]
- **Was:** Sessions, die via `claude --bg` oder aus dem Agent-View gestartet wurden, tauchen jetzt im `/resume`-Picker neben den interaktiven Sessions auf — markiert mit einem `bg`-Tag.
- **Einsatz:** `/resume` im normalen TUI listet auch Background-Sessions auf
- **Mehrwert:** Kein mentaler Bruch mehr zwischen Vorder- und Hintergrund-Workflows — eine in den Background geschickte Session lässt sich später wie jede andere wieder aufnehmen, ohne im Agent-View den passenden Eintrag suchen zu müssen.
- **Version:** v2.1.144

### [Elapsed Duration in Background-Subagent-Completion-Notifications]
- **Was:** Wenn ein Background-Subagent fertig wird, enthält die Notification jetzt zusätzlich die verstrichene Laufzeit (z. B. „Agent completed · 3h 2m 5s") — bisher nur „done".
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Auf einen Blick erkennbar, ob ein Job 3 Minuten oder 3 Stunden gebraucht hat — wichtige Info beim Babysitten mehrerer paralleler Background-Jobs, ohne den Agent-View öffnen zu müssen.
- **Version:** v2.1.144

### [`/plugin` zeigt Last-Updated-Timestamp]
- **Was:** Die Browse- und Discover-Panes von `/plugin` zeigen jetzt zusätzlich, wann ein Plugin zuletzt aktualisiert wurde.
- **Einsatz:** Automatisch aktiv im `/plugin`-Browser
- **Mehrwert:** Sofort sichtbar, ob ein Plugin aktiv gepflegt wird oder seit Monaten brachliegt — ein zentraler Filter für die Plugin-Auswahl in einem stark wachsenden Ökosystem.
- **Version:** v2.1.144

### [`/model` ändert standardmäßig nur die aktuelle Session — `d` für Default]
- **Was:** `/model` setzt das Modell jetzt ausschließlich für die laufende Session; im Model-Picker kann man `d` drücken, um die Wahl zugleich als Default für neue Sessions zu speichern. Bisher änderte `/model` global den Default.
- **Einsatz:** `/model` → Modell wählen (nur diese Session); im Picker `d` drücken → Default für neue Sessions
- **Mehrwert:** Sauber getrennte Semantik zwischen „einmaliger Modellwechsel für einen Task" und „neuer permanenter Default" — kein versehentliches Umstellen globaler Defaults mehr, wenn man nur kurz ein Sonnet-Experiment laufen lassen wollte.
- **Version:** v2.1.144

### [Rename: „extra usage" → „usage credits"; `/extra-usage` → `/usage-credits`]
- **Was:** Die CLI-Copy für zusätzliches gekauftes Kontingent heißt jetzt überall „usage credits" statt „extra usage"; der Befehl `/extra-usage` heißt jetzt `/usage-credits`. Der alte Name funktioniert als Alias weiter.
- **Einsatz:** `/usage-credits` (alt `/extra-usage` bleibt gültig)
- **Mehrwert:** Konsistente Terminologie mit der Anthropic-Billing-Console — User stoßen nicht mehr auf zwei verschiedene Begriffe für denselben Topf.
- **Version:** v2.1.144

### [Fix: Startup-Hang bis zu 75s bei nicht erreichbarem `api.anthropic.com`]
- **Was:** Bei Captive Portals, blockierenden Firewalls oder VPN-Problemen konnte der Claude-Startup bis zu 75 Sekunden hängen, weil Side-Channel-API-Calls auf das Default-Timeout warteten. Diese Calls haben jetzt ein hartes 15s-Timeout.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Claude startet auch in schlechten Netz-Bedingungen schnell durch — wichtig für Coffee-Shop-Networking, restriktive Corporate-VPNs und Edge-Cases wie Reise-WLANs hinter Captive Portals.
- **Version:** v2.1.144

### [Fix: Garbled Terminal-Output nach verpasster Window-Resize-Event]
- **Was:** Wenn ein Resize-Event durchrutschte (etwa beim Verschieben eines VS Code Split-Pane-Dividers), wurde der Terminal-Output unleserlich verzerrt und musste mit Ctrl+L manuell repariert werden. Die Anzeige heilt sich jetzt beim nächsten Frame selbst.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schluss mit dem reflexartigen Ctrl+L nach jedem Resize — Claude-TUI bleibt in dynamischen IDE-Layouts (VS Code, tmux mit Splits) konstant lesbar.
- **Version:** v2.1.144

### [Fix: Progressive Terminal-Display-Korruption in langen Sessions]
- **Was:** In sehr langen Sessions konnte das Terminal über Stunden hinweg stale oder garbled Glyphen ansammeln, die nur durch Terminal-Resize oder Restart wegzubekommen waren. Die Ursache wurde behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange Marathon-Sessions mit Claude (mehrere Stunden, viele Tool-Calls) bleiben sauber lesbar — wichtig für Workflows, in denen man die Session über einen ganzen Tag offen hält.
- **Version:** v2.1.144

### [Fix: Reduzierte Terminal-Glitches in VS Code (Spinner-Farb-Reduktion)]
- **Was:** Die Spinner-Animation generierte mit ihrer hohen Farbtiefe Rendering-Glitches in der VS Code Integrated Terminal. Die Anzahl der Animations-Farben wurde reduziert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Wer in VS Code arbeitet, sieht weniger Flicker und Farb-Artefakte rund um den Spinner — kleines, aber im Alltag spürbares Polish.
- **Version:** v2.1.144

### [Fix: macOS-Background-Sessions crashten mit „exit 1 before init" in FDA-geschützten Ordnern]
- **Was:** Regression in 2.1.143: Background-Sessions, deren Projekt unter einem Full-Disk-Access-geschützten Ordner (`~/Documents`, `~/Desktop`, `~/Downloads`) lag, crashten mit „exit 1 before init". Behoben.
- **Einsatz:** Automatisch aktiv (Voraussetzung: FDA für Claude-Binary gewährt)
- **Mehrwert:** Wer Projekte unterhalb der Standard-User-Verzeichnisse hat, kann Background-Sessions wieder zuverlässig starten — der TCC-Permission-Fix aus 2.1.143 wurde damit komplettiert.
- **Version:** v2.1.144
- **Plattform:** macOS

### [Fix: Read-Tool — File mit nicht passender Image-Extension fällt auf Text zurück]
- **Was:** Eine Datei mit Image-Endung (z. B. `.png`), deren tatsächlicher Inhalt aber Text war (z. B. ein als `.png` abgespeichertes HTML), versetzte die Conversation in einen nicht wiederherstellbaren Zustand. Read fällt jetzt sauber auf Text-Read zurück.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verwirrend benannte Files reißen Claude nicht mehr aus dem Konzept — wichtig in Repos mit testen-Files, gerippten Webseiten oder migrierten Mime-Daten.
- **Version:** v2.1.144

### [Fix: Weniger spurious Tool-Errors bei Search-Befehlen]
- **Was:** `head`/`tail`-Aufrufe erfüllen jetzt den Read-before-Edit-Check (vorher zwang Claude dazu, die Datei erst voll zu lesen). „No matches"-Ergebnisse (Exit-Code 1) von `egrep`, `fgrep`, `git grep` und `git diff` werden nicht mehr als Command-Failure gemeldet.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Search- und Read-Workflows werden flüssiger — kein „command failed"-False-Positive mehr bei legitimen No-Match-Suchen, und große Files lassen sich mit `head`/`tail` skannen, ohne den Read-Tool-Cache vollzuspielen.
- **Version:** v2.1.144

### [Fix: `/branch` mit „No conversation to branch" nach Worktree/Background]
- **Was:** Nach einem `EnterWorktree` oder in manchen Background-Sessions schlug `/branch` mit „No conversation to branch" fehl, obwohl die Session aktiv war. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Konversations-Branching funktioniert jetzt verlässlich auch in den isolierten Setups, in denen es am meisten gebraucht wird — parallele Was-wäre-wenn-Pfade aus laufenden Background-Jobs.
- **Version:** v2.1.144

### [Fix: Escape im AskUserQuestion-Notes-Field bricht nicht mehr den Turn ab]
- **Was:** Wer im Notes-Field eines AskUserQuestion-Popups Escape drückte, brach den ganzen Turn ab — statt nur zur Option-Auswahl zurückzukehren. Escape verhält sich jetzt erwartungskonform.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein versehentlicher Turn-Abbruch mehr beim Schreiben optionaler Notes — wichtig, weil AskUserQuestion oft am Ende eines langen Tool-Call-Sturms erscheint und ein versehentlicher Abbruch teuer ist.
- **Version:** v2.1.144

### [Fix: Modell-Auswahl greift via IDE-Picker und `applyFlagSettings` nach Startup]
- **Was:** Wenn die Modell-Auswahl nach dem Startup via IDE-Model-Picker oder `applyFlagSettings` geändert wurde, griff der Wechsel nicht — die Session blieb beim alten Modell. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** IDE-Integration und scripted Setting-Anwendung verhalten sich konsistent — User können ihr Modell mid-session umstellen, ohne die Session neu starten zu müssen.
- **Version:** v2.1.144

### [Fix: Resumed Sessions behalten ihr eigenes Modell]
- **Was:** Wer mit `/resume` eine alte Session aufnahm, bekam manchmal das Modell einer anderen aktuellen Session aufgezwungen — nicht das ursprüngliche der resumed Session. Resumed Sessions behalten jetzt ihr eigenes Modell.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Replay einer Opus-Session bleibt eine Opus-Session — keine stillschweigenden Qualitäts-Downgrades durch Modell-Vermischung zwischen mehreren aktiven Sessions.
- **Version:** v2.1.144

### [Fix: Bedrock/Vertex — „Opus (1M context)" wieder im `/model`-Picker wählbar]
- **Was:** Regression in v2.1.129: Bedrock- und Vertex-User konnten „Opus (1M context)" nicht mehr aus dem `/model`-Picker auswählen. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Enterprise-User auf Cloud-Provider-Backends bekommen ihren 1M-Context-Opus wieder per Picker — bisher blieb nur der Workaround via Environment-Variable.
- **Version:** v2.1.144

### [Fix: Remote-Session-Login mit `forceLoginMethod`/`forceLoginOrgUUID`]
- **Was:** User mit gesetztem `forceLoginMethod` und `forceLoginOrgUUID` bekamen beim Remote-Session-Login ein „Can't access this organization" — obwohl die Org-UUID korrekt war. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Enterprise-SSO-Setups mit forced Org-Binding funktionieren wieder für Remote-Sessions — wichtig für Teams mit mehreren Orgs unter demselben Login.
- **Version:** v2.1.144

### [Fix: MCP-Server mit paginated `tools/list` — alle Pages werden gelesen]
- **Was:** Bei MCP-Servern, die ihre Tool-Liste in Pages ausliefern (große Tool-Sammlungen), las Claude bisher nur die erste Page und droppte den Rest stillschweigend. Jetzt wird die volle paginated Response zusammengezogen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Große MCP-Server (etwa Cloud-Provider-Tooling mit dutzenden Tools) liefern ihr volles Tool-Inventar — keine still verschluckten Tools mehr.
- **Version:** v2.1.144

### [Fix: MCP-Images mit unsupported MIME-Types brechen die Conversation nicht mehr]
- **Was:** MCP-Tools, die Images mit nicht unterstützten MIME-Types (z. B. SVG) zurückgaben, brachen die Conversation komplett. Solche Bilder werden jetzt auf Disk gespeichert und im Tool-Result als Pfad-Referenz übergeben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** MCP-Tools, die SVGs oder andere exotische Image-Formate liefern, sind sicher nutzbar — Claude bekommt die Datei als Pfad, statt die ganze Conversation an einem unbekannten Format zu zerreißen.
- **Version:** v2.1.144

### [Fix: File-Descriptor-Exhaustion bei Build im Skill-Verzeichnis]
- **Was:** Wenn ein Build innerhalb eines Skill-Verzeichnisses lief (Watch-Mode, viele temporäre Files), triggerten alle Nicht-`.md`-Files Skill-Reloads und der Prozess ging in File-Descriptor-Exhaustion. Reloads triggern jetzt nur noch bei `.md`-Files.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Plugin-Entwicklung mit lokalem Build-Loop im Skill-Dir funktioniert wieder ohne FD-Limit-Crashes — wichtig für TypeScript/Node-basierte Skill-Tooling.
- **Version:** v2.1.144

### [Fix: Session-Title basiert wieder auf erstem User-Prompt, nicht Plugin-Monitor-Output]
- **Was:** Wenn ein Plugin früh in der Session Monitor-Output produzierte, übernahm Claude diesen Text als Session-Title — statt des ersten User-Prompts. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Session-Titles bleiben wieder semantisch sinnvoll im `/resume`-Picker — keine kryptischen „[plugin] starting watcher"-Titles mehr für Sessions, die eigentlich „Bug XYZ debuggen" hießen.
- **Version:** v2.1.144

### [Fix: Skill-Tool — Permission-Error im Headless-Mode]
- **Was:** Regression in v2.1.141: Das Skill-Tool failte im Headless-Mode (`-p`/SDK) mit Permission-Error, weil die Default-Skill-Permission nicht propagiert wurde. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Skills sind im Headless-/SDK-Mode wieder nutzbar — wichtig für Scripts, die Skills programmatisch invocen, und für CI-Workflows mit `claude -p`.
- **Version:** v2.1.144

### [Fix: Plugin-Cache — „not cached"-Fehler und Project-Plugin-Install-Hinweis]
- **Was:** Plugins, die in den eigenen User-Settings aktiviert waren, zeigten auf frischen Maschinen nach dem ersten Load „not cached"-Errors. Plugins, die nur über ein Projekt-`.claude/settings.json` aktiviert sind, zeigen jetzt einen actionable Hint mit dem benötigten `claude plugin install`-Befehl.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Cross-Machine-Sync-Workflows funktionieren erwartungskonform; und Project-Plugins lassen sich von neuen Teammates mit dem angebotenen Befehl mit einem Klick installieren — schließt die Onboarding-Lücke bei `.claude/`-versionierten Plugin-Listen.
- **Version:** v2.1.144

### [Fix: `claude mcp list` zeigt Parse-Fehler bei `.mcp.json` an]
- **Was:** Wenn `.mcp.json` unparsbar war (etwa weil VS Codes `"servers"`-Key statt `"mcpServers"` verwendet wurde), meldete `claude mcp list` einfach „no servers" — ohne Fehler-Hinweis. Jetzt werden Config-Errors explizit gezeigt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** „Mein MCP-Server taucht nicht auf"-Debugging wird trivial — der Fehler ist sofort sichtbar, statt sich hinter einer leeren Liste zu verstecken.
- **Version:** v2.1.144

### [Fix: Background-Side-Queries auf custom `ANTHROPIC_BASE_URL` und Bedrock Mantle nutzen Haiku-Fallback]
- **Was:** Background-Side-Queries (kleine Klassifikations-Calls) liefen auf custom `ANTHROPIC_BASE_URL`-Setups und Bedrock-Mantle nicht über Haiku, sondern eskalierten an das primäre Modell. Der Haiku-Fallback greift jetzt, wenn ein first-party API-Key konfiguriert ist oder kein Haiku-Model gesetzt ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Side-Query-Kosten bleiben niedrig auch in Gateway-/Mantle-Setups — wichtig in Enterprise-Setups, in denen jede Token-Klasse separat gebucht wird.
- **Version:** v2.1.144

### [Fix: Scrolling in attachten Background-Sessions auf Windows]
- **Was:** PgUp/PgDn, Mouse-Wheel und Ctrl+O (Transcript-Navigation) funktionierten in attachten Background-Sessions auf Windows nicht. Jetzt voll funktional.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Windows-User können in Background-Session-Transkripten wieder normal nach oben scrollen — vorher musste man die Session in einen anderen Terminal-Tab kopieren, um die Historie zu prüfen.
- **Version:** v2.1.144
- **Plattform:** Windows

### [Fix: Crash beim Terminal-Close während attachter Background-Session]
- **Was:** Wer das Terminal-Window schloss, während eine Background-Session attached war, triggerte einen harten Crash. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sauberes Detach-Verhalten beim Schließen — die Background-Session läuft weiter, das Terminal beendet sich ohne Crash.
- **Version:** v2.1.144

### [Fix: `! <cmd>`-Exec-Sessions reagieren auf Ctrl+C beim Attach]
- **Was:** `! <cmd>`-Exec-Sessions ignorierten Ctrl+C, wenn sie attached waren — ein laufender langsamer Command ließ sich nicht abbrechen. Jetzt unterbricht Ctrl+C den Command.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Hängende Shell-Commands in Exec-Sessions sind wieder kontrollierbar — kein `kill -9` mehr für vergessene `tail -f`-Prozesse.
- **Version:** v2.1.144

### [Fix: Agent-View — Shell-Command-Rows räumen sauber auf]
- **Was:** Shell-Command-Rows im Agent-View blieben unter „Working" hängen, auch nachdem das Kommando fertig war. Drücken von Enter auf einer fertigen Row spielte das Kommando erneut, wenn der Output bereits abgelaufen war. Beide Fehler behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Agent-View zeigt korrekten Status; und Enter auf einer beendeten Row triggert keine ungewollten Re-Executions mehr — vermeidet Daten-Korruption durch versehentlich wiederholte Commands.
- **Version:** v2.1.144

### [Fix: Pfeil-links in `claude agents` (Windows) macht Liste nicht mehr unresponsive]
- **Was:** Auf Windows ließ ein Druck auf ← in `claude agents` die Liste komplett unresponsive werden — Keyboard-Input wurde nicht mehr akzeptiert. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** `claude agents` ist auf Windows wieder zuverlässig navigierbar — keine Restart-Workarounds mehr nach versehentlichem ←.
- **Version:** v2.1.144
- **Plattform:** Windows

### [Fix: Ghost-Characters bei Pane-Switch in Agent View (Windows Terminal mit CJK)]
- **Was:** Beim Switchen zwischen Panes im Agent-View tauchten in Windows Terminal mit CJK-Content (chinesische/japanische/koreanische Zeichen) Ghost-Characters am linken Rand auf. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Internationale Windows-User sehen kein UI-Glitch mehr — wichtig für Teams in Asien-Pazifik.
- **Version:** v2.1.144
- **Plattform:** Windows

### [`/bg` und `←`-Detach preservieren jetzt auch `--add-dir`-Verzeichnisse]
- **Was:** Ergänzung zum 2.1.143-Fix: `/bg` und `←`-Detach verlieren jetzt auch nicht mehr die per `/add-dir` mid-session hinzugefügten Verzeichnisse — diese werden mitgenommen.
- **Einsatz:** Automatisch aktiv beim Backgrounding
- **Mehrwert:** Live hinzugefügte Working-Directories bleiben über den Detach hinweg erhalten — wichtig für explorative Multi-Repo-Sessions, in denen Verzeichnisse erst während der Arbeit angehängt werden.
- **Version:** v2.1.144

### [Fix: Edit/Write nach Detach mit „hasn't isolated its changes yet"]
- **Was:** Direkt nach dem Detach einer Session, die gerade noch in-place editierte, verweigerten Edit/Write mit „background session hasn't isolated its changes yet". Race-Condition behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Nahtloser Übergang vom Inplace-Editing zur Background-Isolation — Detach ist nicht mehr „eine Sekunde unbenutzbar".
- **Version:** v2.1.144

### [Fix: `claude respawn <id>` auf gestoppter Background-Session zeigt korrekten Status]
- **Was:** `claude respawn <id>` startete eine gestoppte Background-Session zwar wieder, zeigte sie aber weiterhin als „stopped" an. Status wird jetzt korrekt aktualisiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Status-Anzeige stimmt mit der Realität überein — kein Rätselraten mehr, ob der Respawn wirklich gegriffen hat.
- **Version:** v2.1.144

### [Fix: `/resume`-Picker zeigt Forks aus Background-Sessions]
- **Was:** Sessions, die aus einer Background-Session geforkt wurden, tauchten nicht im `/resume`-Picker auf. Jetzt sind sie sichtbar.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Fork-Workflows aus Background-Sessions sind nachvollziehbar — alle Ableitungen sind via `/resume` wieder auffindbar.
- **Version:** v2.1.144

### [Fix: Timeout für hängenden Background-Service bei `claude agents`/`claude logs`]
- **Was:** Wenn der Background-Service nicht reagierte, hängten `claude agents`-Session-Öffnen und `claude logs <id>` unbegrenzt. Jetzt Timeout nach 10s mit Recovery-Hint.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein endloses Warten mehr auf einen kranken Daemon — der User sieht sofort, dass etwas hakt, und bekommt einen Hinweis, wie er das Problem beheben kann.
- **Version:** v2.1.144

### [Fix: Background-Bash-Tasks aus Subagents räumen SDK-Task-Panel auf]
- **Was:** Background-Bash-Tasks, die von Subagents gespawnt wurden, blieben im SDK-Task-Panel als „Running" stehen, auch nachdem der Prozess sauber geendet hatte. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** SDK-Task-Panel zeigt verlässlichen Status — wichtig für SDK-User, die ihre Task-Pipeline observen.
- **Version:** v2.1.144

### [Fix: Wake-Failures markieren Sessions nicht mehr permanent als Crash]
- **Was:** Completed oder stopped Background-Sessions, die kurz beim Wake-Up fehlten, wurden permanent als Startup-Crash markiert — auch wenn ein zweiter Wake-Versuch durchgegangen wäre. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Resilienz beim Wiederbeleben kalter Background-Sessions — Sessions sind nicht mehr nach einem einzigen flaky Wake unwiederbringlich „crashed".
- **Version:** v2.1.144

### [Fix: Markdown-Links in attachten Background-Sessions klickbar]
- **Was:** Markdown-Links in `claude agents`-attachten Sessions wurden als plain text gerendert — statt als klickbare Hyperlinks. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verlinkte Doku, PR-URLs und Datei-Pfade aus Background-Sessions sind wieder per Klick erreichbar — kein lästiges Copy-Paste aus dem Background-Stream.
- **Version:** v2.1.144

### [Fix: Custom `spinnerVerbs` überschreiben nicht mehr die Past-Tense Post-Turn-Message]
- **Was:** Custom `spinnerVerbs` wirkten auch auf die Post-Turn-Duration-Message — wodurch „Worked for 5s" durch das Custom-Verb ersetzt wurde, was unidiomatisch klang. Built-in Past-Tense-Forms („Worked for 5s") sind dort wiederhergestellt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spinner-Personalisierung bleibt auf den Spinner beschränkt — Post-Turn-Messages bleiben grammatikalisch konsistent.
- **Version:** v2.1.144

### [Verbesserung: `claude agents`/`--bg`-Rejection-Messages nennen den blockierenden Gate]
- **Was:** Wenn `claude agents` oder `--bg` abgelehnt wurden, kam bisher eine generische Message. Jetzt wird konkret benannt: Non-TTY, Environment-Variable oder Setting — mit dem Namen des verantwortlichen Gates.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Debugging warum Background-Features nicht greifen wird trivial — kein Rätselraten mehr, ob die User-Settings, ein env var oder das Terminal-Setup der Blocker ist.
- **Version:** v2.1.144

### [`claude --bg --name <label>` echos den Namen nach dem Spawn]
- **Was:** Wer `claude --bg --name my-job` aufrief, bekam zwar einen Background-Spawn, aber keine Bestätigung mit dem gewählten Namen. Jetzt wird der Name in der Post-Spawn-Confirmation explizit echoed.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sofortige visuelle Bestätigung, dass der Name korrekt angekommen ist — wichtig für Scripted-Workflows mit deterministischen Job-Names.
- **Version:** v2.1.144

### [`claude agents`: Rename via Ctrl+R updated attachten Session-Banner sofort]
- **Was:** Wer eine Background-Session aus `claude agents` mit Ctrl+R umbenannte, sah den neuen Namen erst nach Re-Attach im Banner. Jetzt aktualisiert sich der Banner sofort live.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Konsistente UI-Synchronisation zwischen Agent-Liste und attachter Session — keine Verwirrung mehr, ob das Rename wirklich gegriffen hat.
- **Version:** v2.1.144

### [Background-Session-Worktree-Isolation greift für Non-Git-VCS-User mit `WorktreeCreate`-Hooks]
- **Was:** Der Worktree-Isolation-Guard, der Background-Sessions vor Inplace-Edits schützt, wirkte bisher nur für git-User. User mit anderem VCS (Mercurial, Jujutsu, etc.) und konfigurierten `WorktreeCreate`-Hooks sind jetzt ebenfalls abgedeckt.
- **Einsatz:** Automatisch aktiv bei konfiguriertem `WorktreeCreate`-Hook
- **Mehrwert:** Non-Git-User können Background-Isolation jetzt vollwertig nutzen — wichtig für Teams auf Jujutsu oder Mercurial mit eigener Worktree-Lifecycle-Logik.
- **Version:** v2.1.144

### [Plugin-Marketplace-Add/Update respektiert `CLAUDE_CODE_PLUGIN_PREFER_HTTPS`]
- **Was:** Die env-Variable `CLAUDE_CODE_PLUGIN_PREFER_HTTPS` (aus v2.1.142) wirkte beim ersten Install eines Plugins — aber nicht beim späteren Marketplace-Add oder -Update. Jetzt durchgängig.
- **Einsatz:** `export CLAUDE_CODE_PLUGIN_PREFER_HTTPS=1` gilt für Install, Add und Update
- **Mehrwert:** SSH-blockierte Corporate-Netze können Plugin-Marketplaces vollständig nutzen — kein Mix-Mode mehr, in dem nur ein Teil der Plugin-Operationen via HTTPS lief.
- **Version:** v2.1.144

### [`/plugin` springt nach Enable/Disable/Uninstall zurück in die Installed-Liste]
- **Was:** Nach einem Plugin-Enable, -Disable oder -Uninstall blieb `/plugin` auf der Detail-View hängen — User musste manuell zurücknavigieren. Jetzt automatischer Sprung zurück in die Installed-Liste.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Plugin-Management mit mehreren Aktionen hintereinander wird flüssiger — weniger Tastendrücke pro Plugin-Lifecycle-Operation.
- **Version:** v2.1.144

### [`/doctor` zeigt Exec-Form-Beispiel bei fehlendem `command`-Feld in Hook]
- **Was:** Wer einen Command-Hook ohne `command`-Feld konfigurierte, bekam einen Fehler — aber kein Beispiel der korrekten Exec-Form. `/doctor` zeigt jetzt ein konkretes Beispiel mit.
- **Einsatz:** Automatisch in `/doctor`
- **Mehrwert:** Hook-Config-Fehler sind sofort selbst-reparierbar — kein Doku-Lookup mehr nötig für die einfachste Fix-Action.
- **Version:** v2.1.144

### [Skill-Listing-Truncation nicht mehr als Startup-Notification]
- **Was:** Wenn die Skill-Liste auf Anzeige-Limit gekürzt wurde, zeigte Claude eine Startup-Notification — was beim ersten Visual-Eindruck nach dem Start ablenkte. Die Truncation-Info ist jetzt nur noch via `/doctor` abrufbar.
- **Einsatz:** Automatisch aktiv; Detail-Info: `/doctor`
- **Mehrwert:** Sauberer Startup-Screen ohne Noise — die Truncation-Info bleibt verfügbar, aber blockiert nicht mehr die wichtigeren Onboarding-Hinweise.
- **Version:** v2.1.144

### [Recovery: Pre-Response-Stream-Stalls werden retried statt downgegradet]
- **Was:** Wenn der Modell-Stream vor der ersten Response stalled, fiel Claude bisher auf einen langsameren non-streaming Request zurück. Jetzt wird der Stream einmal retried — was meist schneller ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Bessere Response-Latenz bei flaky Netz-Conditions — kein still verstecktes Performance-Downgrade mehr bei transienten Stream-Stalls.
- **Version:** v2.1.144

### [SDK/Headless-MCP-Startup: Pre-Wait overlapt mit Startup (bis zu 2s schneller)]
- **Was:** Der MCP-Pre-Wait im SDK/Headless-Mode blockierte bisher vor dem ersten Turn. Jetzt läuft er parallel zum Startup — Time-to-First-Turn ist bei langsamen MCP-Servern bis zu 2 Sekunden niedriger.
- **Einsatz:** Automatisch aktiv im SDK/Headless-Mode
- **Mehrwert:** SDK-basierte Pipelines mit MCP-Servern starten messbar schneller — bei tausenden Invocations pro Tag (CI, Batch-Jobs) summiert sich das deutlich.
- **Version:** v2.1.144

### [Post-Survey-Follow-Up-Hint bei jeder Non-Dismiss-Antwort]
- **Was:** Der Hint zum Detail-Feedback (`/feedback`) erscheint jetzt nach jeder Non-Dismiss-Survey-Antwort, mit Context-aware Copy — bisher nur sporadisch.
- **Einsatz:** Automatisch aktiv nach Survey-Antwort
- **Mehrwert:** User finden den Weg zum tiefen Feedback-Kanal verlässlicher — wichtig für das Anthropic-Team, um Survey-Signale mit Detail-Reports zu paaren.
- **Version:** v2.1.144

---

### Plattform-Ankündigungen (19. Mai 2026)

---

### [Claude Managed Agents: Self-Hosted Sandboxes (Public Beta)]
- **Was:** Managed Agents können Tool-Execution jetzt in der eigenen Infrastruktur oder bei verwalteten Sandbox-Anbietern (Cloudflare, Daytona, Modal, Vercel) laufen lassen — die Agent-Orchestrierung bleibt bei Anthropic, aber Code-Execution, File-Access und Network-Requests bleiben innerhalb der eigenen Netzwerk- und Security-Policies.
- **Einsatz:** In der Claude Console eine Self-Hosted-Sandbox konfigurieren (eigene Compute oder einer der unterstützten Provider); Managed Agents verwenden diese Sandbox dann statt der Anthropic-Default-Sandbox
- **Mehrwert:** Enterprises bekommen Managed Agents auch für Workloads, bei denen sensible Files/Services nicht in Anthropic-Sandboxes laufen dürfen — bestehende Netzwerk-Controls, IAM-Policies und Compliance-Frameworks gelten weiter. Plus volle Kontrolle über Ressourcen-Sizing und Runtime-Images für compute-intensive Tasks.
- **Version:** Ankündigung 2026-05-19 (Public Beta)

### [Claude Managed Agents: MCP Tunnels (Research Preview)]
- **Was:** Managed Agents können jetzt sicher mit privaten MCP-Servern reden, ohne diese ins öffentliche Internet zu exponieren. Ein leichtes Gateway in der eigenen Umgebung baut eine einzige ausgehende, End-to-End-verschlüsselte Verbindung auf — Agents können darüber auf interne Datenbanken, APIs und Knowledge-Bases zugreifen.
- **Einsatz:** Zugang via Access-Request anfragen; nach Freischaltung das MCP-Tunnel-Gateway in der Ziel-Umgebung deployen und MCP-Server in der Claude Console registrieren
- **Mehrwert:** Schließt die Lücke zwischen Managed Agents (in der Cloud) und Inhouse-Tooling (hinter der Firewall) — keine Public-Endpoints, keine VPN-Hacks, keine Reverse-Proxies. Admins verwalten Tunnels zentral über die Console.
- **Version:** Ankündigung 2026-05-19 (Research Preview)

### [Claude Managed Agents: MCP-/Tool-Config einer aktiven Session ändern]
- **Was:** Bei Claude Managed Agents lassen sich jetzt die mit einer laufenden Session verknüpften MCP-Server- und Tool-Konfigurationen aktualisieren — ohne die Session neu aufsetzen zu müssen.
- **Einsatz:** Über die Managed-Agents-API die MCP-/Tool-Config einer aktiven Session aktualisieren
- **Mehrwert:** Lang laufende Agent-Sessions können on-the-fly neue Tools oder MCP-Server bekommen (oder welche verlieren), statt für jede Config-Änderung von vorn zu starten — wichtig für dynamische, lang-horizont Workflows.
- **Version:** Plattform-Release 2026-05-19

### [Claude Managed Agents: Große Tool-Outputs werden in Datei ausgelagert]
- **Was:** Outputs aus `agent_toolset` und MCP-Tools, die 100K Tokens überschreiten, werden bei Managed Agents jetzt automatisch in eine Datei in der Sandbox ausgelagert. Das Modell erhält eine gekürzte Vorschau samt Dateipfad und kann den vollen Inhalt bei Bedarf nachlesen.
- **Einsatz:** Automatisch aktiv bei Managed Agents
- **Mehrwert:** Riesige Tool-Ergebnisse sprengen nicht mehr das Kontextfenster — der Agent behält den Überblick, kann aber gezielt in die ausgelagerte Datei greifen, wenn die Details gebraucht werden. Schützt vor Kontext-Overflow bei datenintensiven Tools.
- **Version:** Plattform-Release 2026-05-19

### [Web-Search-Tool: Reichere SEC-Filing-Daten (API)]
- **Was:** Das Web-Search-Tool der Claude-API liefert jetzt reichhaltigere SEC-Filing-Daten zurück — leichter, Finanzrecherche-Agents, Earnings-Analysen und Due-Diligence-Workflows mit Zitaten auf Primärquellen abzustützen.
- **Einsatz:** Web-Search-Tool in der Messages-API nutzen (`web_search`)
- **Mehrwert:** Finanz- und Research-Agents bekommen belastbarere, zitierfähige Primärquellen direkt aus SEC-Filings — weniger Halluzinationsrisiko bei zahlengetriebenen Analysen.
- **Version:** Plattform-Release 2026-05-18

### [Cache-Diagnostics (Public Beta): `cache_miss_reason` erklärt Cache-Misses]
- **Was:** Neue Cache-Diagnostics in der Messages-API: Wird `diagnostics.previous_message_id` mitgeschickt, meldet die API ein `cache_miss_reason`, das erklärt, an welcher Stelle der Prompt-Cache-Prefix vom vorherigen Turn abwich.
- **Einsatz:** `diagnostics.previous_message_id` im Request setzen und den Beta-Header `cache-diagnosis-2026-04-07` mitsenden
- **Mehrwert:** Prompt-Caching lässt sich endlich gezielt debuggen — statt rätselraten, warum die Cache-Hit-Rate einbricht, zeigt die API die konkrete Divergenz-Stelle. Direkter Hebel für Kosten- und Latenz-Optimierung bei API-Apps.
- **Version:** Plattform-Release 2026-05-13

---

### Woche 20 (15. Mai 2026) — v2.1.143

---

### [Plugin-Dependency-Enforcement bei `claude plugin disable/enable`]
- **Was:** `claude plugin disable` verweigert jetzt das Deaktivieren eines Plugins, wenn ein anderes aktiviertes Plugin davon abhängt — mit einem copy-paste-fähigen Disable-Chain-Hint, der die korrekte Reihenfolge ausgibt. Gegenstück: `claude plugin enable` aktiviert transitive Dependencies automatisch mit.
- **Einsatz:** `claude plugin disable <name>` zeigt im Konfliktfall die Disable-Reihenfolge; `claude plugin enable <name>` zieht abhängige Plugins automatisch hoch
- **Mehrwert:** Plugin-Lifecycle wird konsistent — User können keine Plugins mehr aus Versehen halb deaktivieren und ein Plugin mit Dependency-Baum lässt sich mit einem einzigen Enable hochfahren, statt jedes Dependency manuell anzuklicken.
- **Version:** v2.1.143

### [Projected Context Cost im `/plugin`-Marketplace-Browser]
- **Was:** Das Browse-Pane von `/plugin` zeigt jetzt zusätzlich zur Plugin-Beschreibung eine Schätzung der Kontextkosten pro Turn und pro Invocation in Tokens — also wie viel das Plugin den Kontext-Footprint einer typischen Konversation belastet.
- **Einsatz:** Automatisch aktiv im `/plugin`-Browser
- **Mehrwert:** Plugin-Auswahl wird kostenbewusst — User sehen vor dem Install, ob ein Plugin den Kontext mit Skill-Definitionen oder Tools spürbar aufbläht, und können bei Token-empfindlichen Workflows gezielt schlanke Plugins wählen.
- **Version:** v2.1.143

### [`worktree.bgIsolation: "none"` — Background-Sessions ohne Worktree]
- **Was:** Neue Setting-Option `worktree.bgIsolation: "none"` lässt Background-Sessions direkt im Working Copy arbeiten, ohne automatisches `EnterWorktree`. Für Repos, in denen Worktrees aus technischen Gründen (Submodule, große LFS-Stores, Monorepo-Tooling) nicht praktikabel sind.
- **Einsatz:** In `settings.json`: `"worktree": { "bgIsolation": "none" }`
- **Mehrwert:** Background-Agents werden in Repos einsetzbar, in denen Worktree-basierte Isolation entweder zu langsam oder schlicht inkompatibel ist — etwa Yarn-Berry-PnP-Setups oder Repos mit Hooks, die nur im Haupt-Working-Tree greifen.
- **Version:** v2.1.143

### [PowerShell-Tool: `-ExecutionPolicy Bypass` als Default]
- **Was:** Das PowerShell-Tool startet PowerShell-Prozesse jetzt mit `-ExecutionPolicy Bypass`, damit Script-Aufrufe nicht an restriktiven Default-Policies scheitern. Wer das alte Verhalten will, setzt `CLAUDE_CODE_POWERSHELL_RESPECT_EXECUTION_POLICY=1`.
- **Einsatz:** Automatisch aktiv; Opt-out per `export CLAUDE_CODE_POWERSHELL_RESPECT_EXECUTION_POLICY=1`
- **Mehrwert:** Windows-User mit Standard-PowerShell-Restricted-Policy bekommen keine „Execution of scripts is disabled"-Fehler mehr beim ersten PowerShell-Tool-Aufruf — Claude-PowerShell-Workflows funktionieren out-of-the-box, ohne dass User vorab die System-Policy ändern müssen.
- **Version:** v2.1.143

### [PowerShell-Tool standardmäßig aktiv auf Windows (Bedrock/Vertex/Foundry)]
- **Was:** Der PowerShell-Tool ist jetzt auf Windows automatisch aktiv, wenn Claude Code über Amazon Bedrock, Google Vertex oder Microsoft Foundry betrieben wird — bisher musste das Tool für diese Cloud-Provider explizit eingeschaltet werden. Opt-out per `CLAUDE_CODE_USE_POWERSHELL_TOOL=0`.
- **Einsatz:** Automatisch aktiv auf Windows mit Bedrock/Vertex/Foundry; Opt-out: `CLAUDE_CODE_USE_POWERSHELL_TOOL=0`
- **Mehrwert:** Enterprise-Windows-User auf Cloud-Provider-Backends sind sofort produktiv — die Lücke „Bash fehlt, PowerShell muss erst aktiviert werden" entfällt, was Onboarding-Reibung in Enterprise-Setups deutlich reduziert.
- **Version:** v2.1.143

### [Background-Sessions: Model + Effort-Level überdauern Idle/Wake]
- **Was:** Wenn eine Background-Session in den Idle-Zustand fällt und später wieder aufwacht, behält sie jetzt das vor dem Sleep gesetzte Modell (z. B. Opus 4.7) und Effort-Level (z. B. `xhigh`) bei — bisher fielen beide auf die Defaults zurück.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange laufende Background-Agents, die explizit auf hohes Effort und ein bestimmtes Modell konfiguriert wurden, liefern auch nach längeren Idle-Phasen konsistente Qualität — kein stilles Downgrade mehr auf Sonnet-Default.
- **Version:** v2.1.143

### [Shift+Tab in Agent-Sessions zykelt jetzt auch durch Auto-Mode]
- **Was:** Beim Drücken von Shift+Tab in einer attachten Background-Agent-Session wird jetzt auch der `auto`-Permission-Mode in den Zyklus aufgenommen — neben den bisherigen Default/Plan/Bypass-Modi.
- **Einsatz:** Shift+Tab in `claude agents`-attachter Session zykelt: default → auto → plan → bypass → …
- **Mehrwert:** Auto-Mode (Classifier entscheidet pro Aktion) ist jetzt in derselben einzigen-Keystroke-Distanz wie die anderen Modi — User können risikoarme Background-Jobs mit einem Tastendruck in den semi-autonomen Auto-Mode schalten.
- **Version:** v2.1.143

### [Stop-Hook-Block-Cap verhindert Endlos-Loops]
- **Was:** Wenn ein Stop-Hook eine Stop-Aktion blockiert, fährt Claude bisher endlos fort. Jetzt wird der Turn nach 8 aufeinanderfolgenden Blocks mit Warnung beendet. Override via `CLAUDE_CODE_STOP_HOOK_BLOCK_CAP`.
- **Einsatz:** Automatisch aktiv; Custom-Cap: `export CLAUDE_CODE_STOP_HOOK_BLOCK_CAP=20`
- **Mehrwert:** Buggy Stop-Hooks (z. B. eine endlose „erst wenn alle Tests grün sind"-Bedingung gegen einen flaky Test) können Sessions nicht mehr in eine Token-fressende Endlosschleife treiben — Safety-Net gegen versehentliche Cost-Bombs.
- **Version:** v2.1.143

### [Fix: Esc/Ctrl+C bricht pending `/loop`-Wakeups]
- **Was:** Während Claude zwischen `/loop`-Iterationen im Idle-Wait war, ließen sich pending Wakeups nicht mit Esc oder Ctrl+C abbrechen — die nächste Iteration feuerte unweigerlich. Jetzt cancelt Esc/Ctrl+C auch pending Wakeups.
- **Einsatz:** Automatisch aktiv im `/loop`-Modus
- **Mehrwert:** Long-running `/loop`-Jobs (Babysitting, periodische Checks) lassen sich endlich ohne `kill -9` sauber stoppen — wichtig, wenn man merkt, dass der Loop in die falsche Richtung läuft, bevor die nächste Iteration startet.
- **Version:** v2.1.143

### [Fix: `/goal`-Evaluator wartet auf Background-Tasks]
- **Was:** Der `/goal`-Evaluator (prüft, ob das Goal erfüllt ist) feuerte bisher auch dann, wenn noch Background-Shells oder delegierte Subagenten liefen — was zu vorzeitigem „goal not met"-Verdikt führte. Der Evaluator wartet jetzt, bis alle Background-Tasks fertig sind.
- **Einsatz:** Automatisch aktiv beim `/goal`-Tracking
- **Mehrwert:** Goal-Tracking ist endlich verlässlich für Workflows mit langen Builds oder Test-Runs im Hintergrund — keine False-Negative-Goal-Verdikte mehr durch Race-Conditions.
- **Version:** v2.1.143

### [Fix: `NO_COLOR`/`FORCE_COLOR` scopen jetzt nur Subprozesse]
- **Was:** Wenn User `NO_COLOR=1` oder `FORCE_COLOR=1` in `settings.json` unter `env` setzten, strippte das auch die UI-Farben von Claude Code selbst. Jetzt wirkt das Setting nur noch auf Subprozesse (Tool-Calls, Bash) und nicht auf das Claude-Code-TUI.
- **Einsatz:** `settings.json` mit `"env": { "NO_COLOR": "1" }` betrifft jetzt nur Bash-Ausgaben, nicht die Claude-UI
- **Mehrwert:** User können CI-freundlichen `NO_COLOR`-Output für Tool-Calls erzwingen, ohne die eigene Claude-UI unleserlich monochrom zu machen — saubere Trennung zwischen Tool-Env und UI-Rendering.
- **Version:** v2.1.143

### [Fix: macOS-Background-Sessions können `~/Documents`/`~/Desktop`/`~/Downloads` lesen]
- **Was:** Auf macOS bekamen Background-Sessions „Operation not permitted"-Fehler beim Zugriff auf Dateien in `~/Documents`, `~/Desktop` oder `~/Downloads` — auch dann, wenn Full-Disk-Access für Claude bereits gewährt war. Der Background-Daemon erbt jetzt die TCC-Permissions korrekt vom Vorder-Prozess.
- **Einsatz:** Automatisch aktiv (Voraussetzung: Full-Disk-Access für Claude-Binary)
- **Mehrwert:** Background-Agents können endlich auf Standard-User-Verzeichnisse zugreifen — wichtig für Workflows, die Drafts auf dem Desktop oder Downloads-Inputs verarbeiten, ohne den Code erst in ein „erlaubtes" Repo zu kopieren.
- **Version:** v2.1.143
- **Plattform:** macOS

### [Fix: `/bg` und Detach preservieren MCP-/Settings-/Dir-Flags]
- **Was:** `/bg` und das Detach via Pfeil-nach-links („←") schluckten bisher die ursprünglichen CLI-Flags `--mcp-config`, `--settings`, `--add-dir`, `--plugin-dir`, `--strict-mcp-config`, `--fallback-model` und `--allow-dangerously-skip-permissions` — die backgroundete Worker-Session verlor diese Konfiguration und fiel auf Defaults zurück. Jetzt werden alle Flags über Detach hinweg preserviert.
- **Einsatz:** Automatisch aktiv beim Backgrounding mit `/bg` oder ←
- **Mehrwert:** Detach-Workflows bewahren das volle Setup — Custom-MCP-Server, isolierte Settings-Files und zusätzliche Working-Directories bleiben erhalten, statt nach Background-Wechsel still wegzufallen. Speziell `--fallback-model` ist wichtig, damit backgroundete Jobs bei Overload nicht hart failen, sondern auf das konfigurierte Fallback-Modell degradieren.
- **Version:** v2.1.143

### [Fix: Background-Sessions aus `claude agents` respektieren `permissions.defaultMode`]
- **Was:** Background-Sessions, die aus der `claude agents`-View dispatcht wurden, wurden immer im Auto-Mode gestartet — auch wenn `permissions.defaultMode` in `settings.json` auf `default` oder `plan` stand. Das Setting wird jetzt korrekt respektiert.
- **Einsatz:** Automatisch aktiv beim Dispatch über `claude agents`
- **Mehrwert:** User-konfigurierte Permission-Defaults gelten jetzt einheitlich — keine Überraschungen mehr, dass ein per `agents`-View gestarteter Background-Agent plötzlich mehr darf als ein normal gestarteter.
- **Version:** v2.1.143

### [Fix: Worktree-Cleanup fällt nicht mehr auf `rm -rf` zurück]
- **Was:** Wenn `git worktree remove` fehlschlug (z. B. weil noch ungeitignored gespeicherte Änderungen im Worktree lagen), löschte Claude bisher als Fallback hart mit `rm -rf` — was gitignorierte und in-progress-Dateien stillschweigend mit wegnahm. Der Fallback wurde entfernt; Fehler werden jetzt zurückgemeldet.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein versehentlicher Datenverlust mehr durch zu aggressives Cleanup — Workflows mit lokalen `.env`-Files, Build-Caches oder unfertigen Debug-Outputs im Worktree sind sicher.
- **Version:** v2.1.143

### [Fix: 5xx-Fehlermeldungen nennen den konfigurierten Gateway]
- **Was:** Bei 5xx-Fehlern zeigte Claude immer einen Link auf `status.claude.com` — auch wenn der User über Bedrock, Vertex, Foundry oder einen eigenen Gateway lief. Die Meldung benennt jetzt den tatsächlich konfigurierten Provider.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Enterprise-User mit eigenem Gateway oder Cloud-Provider-Backend sehen sofort, welche Komponente potentiell down ist — kein Trugschluss mehr „Anthropic down" bei Bedrock-Outage.
- **Version:** v2.1.143

### [Fix: `--agent <name>` findet Plugin-Agenten ohne `plugin:`-Präfix]
- **Was:** `claude --agent <name>` fand bisher nur built-in Agenten direkt; Plugin-bereitgestellte Agenten mussten mit `plugin:<plugin-name>:<agent-name>` vollqualifiziert angegeben werden. Jetzt wird der bare Name auch in Plugin-Agenten aufgelöst.
- **Einsatz:** `claude --agent code-reviewer` findet auch Plugin-Agenten
- **Mehrwert:** Plugin-Agenten sind in Scripts und Aliases ohne Knowledge des Plugin-Names ansprechbar — Konsistenz mit Built-in-Agent-Aufrufen.
- **Version:** v2.1.143

### [Fix: `/bg` ohne Prompt wartet auf Input statt „continue" zu senden]
- **Was:** Wer `/bg` ohne explizites Prompt-Argument absetzte, bekam bisher einen Background-Fork, der sofort „continue" gesendet bekam — was die Session unvorhersehbar weiterlaufen ließ. Jetzt wartet die geforkte Session auf manuelles Input.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Predictable Detach-Verhalten — User können `/bg` als reine „in Background schicken, später dranhängen"-Aktion nutzen, ohne dass Claude im Hintergrund mit halben Annahmen weiterarbeitet.
- **Version:** v2.1.143

### [Fix: Diverse `claude agents`-Stabilität (Windows + Allgemein)]
- **Was:** Mehrere kleinere Bugs in `claude agents`: Right-Click-Paste funktionierte auf Windows Terminal und WSL nicht; die `agents`-Liste wurde unresponsive, wenn man ← drückte, während eine Response noch streamte; das Löschen einer Session aus der View entfernte das Transcript-File nicht; Scrolling in attachten Background-Sessions zeigte auf Windows Terminal stale Fragments; Agent-View spawnte wiederholt PowerShell-Prozesse beim Listen. Alles behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** `claude agents` wird auf Windows deutlich verlässlicher — speziell die Right-Click-Paste- und PowerShell-Process-Spam-Fixes machen das Dashboard für Windows-Heavy-Users alltagstauglich.
- **Version:** v2.1.143

### [Fix: False-Positive Worker-Stall-Detection nach Sleep/App Nap]
- **Was:** Nach Host-Sleep oder macOS-App-Nap erkannte die Worker-Stall-Detection einen ganzen Sturm von „Worker hängt"-False-Positives, weil die Idle-Detection das Sleep-Intervall fehlinterpretierte. Detection-Algorithmus wurde sleep-aware gemacht.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Background-Agents werden nach dem Aufwachen nicht mehr fälschlich als „gestallt" markiert und unnötig neu gespawned — Ressourcenverbrauch und Session-Churn sinken nach Sleep-Zyklen deutlich.
- **Version:** v2.1.143

### [Fix: Korrupte `.credentials.json` hängt CLI-Startup nicht mehr auf]
- **Was:** Eine korrupte `~/.claude/.credentials.json`, in der `scopes` kein Array war (z. B. nach Hand-Edits oder Migrationen), ließ den CLI-Startup hängen oder den OAuth-Refresh stillschweigend abbrechen. Es gibt jetzt einen sauberen Fehler, der zur Reparatur leitet.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Auth-bezogene Startup-Hänger sind diagnostizierbar — User sehen sofort, dass die Credentials-Datei das Problem ist, statt einem stummen Hang gegenüberzustehen.
- **Version:** v2.1.143

### [Fix: Daemon-Spawn fällt auf laufendes Binary zurück bei fehlendem Launcher]
- **Was:** Wenn `~/.local/bin/claude` als Launcher fehlte oder nicht executable war, scheiterte der Daemon-Spawn komplett. Jetzt fällt der Spawn auf das aktuell laufende Binary zurück.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Custom-Install-Layouts ohne `~/.local/bin`-Symlink (Nix, Homebrew, eigene PATH-Setups) bekommen funktionierende Background-Daemons — kein Setup-Bruch nach Install-Variante.
- **Version:** v2.1.143

### [Fix: `claude agents --allow-dangerously-skip-permissions` macht Bypass verfügbar statt Default]
- **Was:** `claude agents --allow-dangerously-skip-permissions` setzte dispatchte Sessions hart in den Bypass-Mode, statt Bypass nur als Option in den Shift+Tab-Cycle aufzunehmen. Die Flag macht Bypass jetzt verfügbar, ohne ihn als Default zu erzwingen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Das Flag verhält sich endlich wie in der Doku beschrieben — User können `--allow-dangerously-skip-permissions` setzen, um die Option freizuschalten, ohne dass alle dispatchten Sessions automatisch im Bypass landen.
- **Version:** v2.1.143

---

### Woche 20 (14. Mai 2026) — v2.1.142

---

### [`claude agents`: neue Dispatch-Flags für Background-Sessions]
- **Was:** Das `claude agents`-Kommando akzeptiert jetzt zusätzliche Flags, mit denen dispatchte Background-Sessions vorab konfiguriert werden können: `--add-dir`, `--settings`, `--mcp-config`, `--plugin-dir`, `--permission-mode`, `--model`, `--effort` und `--dangerously-skip-permissions`.
- **Einsatz:** `claude agents dispatch --model claude-opus-4-7 --effort xhigh --permission-mode auto --add-dir ~/proj/extra`
- **Mehrwert:** Background-Agents lassen sich jetzt scripted in genau der Konfiguration starten, die der Job braucht — etwa CI-Pipelines, die einen Agent mit eigenem MCP-Server, isoliertem Setting-File und hohem Effort-Level feuern, ohne nachträglich in die Session greifen zu müssen.
- **Version:** v2.1.142

### [Fast Mode nutzt jetzt Opus 4.7 als Default]
- **Was:** Der Fast-Mode (`/fast`) verwendet jetzt standardmäßig Opus 4.7 statt Opus 4.6 — die neueste Generation läuft also auch in der schnelleren Output-Variante. Wer beim alten Modell bleiben möchte, setzt `CLAUDE_CODE_OPUS_4_6_FAST_MODE_OVERRIDE=1`.
- **Einsatz:** Automatisch aktiv; Pin auf 4.6: `export CLAUDE_CODE_OPUS_4_6_FAST_MODE_OVERRIDE=1`
- **Mehrwert:** Fast-Mode-Nutzer profitieren ohne Konfigurationswechsel von Opus 4.7-Qualität (besseres Reasoning, neuer Trainings-Stand) bei gewohnter Output-Geschwindigkeit. Teams, die noch auf 4.6-Verhalten validiert sind, haben einen sauberen Fallback.
- **Version:** v2.1.142

### [Plugins mit Root-Level `SKILL.md` werden als Skill erkannt]
- **Was:** Plugins, die nur eine `SKILL.md` im Root liegen haben (kein `skills/`-Unterverzeichnis), werden jetzt automatisch als einzelne Skill-Quelle behandelt — die zusätzliche Verzeichnis-Ebene entfällt.
- **Einsatz:** Plugin-Repo direkt mit `SKILL.md` im Root anlegen; kein `skills/`-Wrapper nötig
- **Mehrwert:** Single-Skill-Plugins (sehr verbreitet bei Community-Plugins) brauchen keine künstliche Verzeichnis-Hierarchie mehr — das Plugin-Layout wird kürzer und der Skill-Generator (`skill-creator`) kann Output direkt in ein installierbares Plugin schreiben.
- **Version:** v2.1.142

### [`/plugin` und `claude plugin details` zeigen jetzt LSP-Server]
- **Was:** Das Detail-Pane in `/plugin` sowie `claude plugin details` listen jetzt auch die LSP-Server, die ein Plugin bereitstellt — analog zur bisherigen Anzeige von Skills, Hooks, Commands und MCP-Servern.
- **Einsatz:** Automatisch aktiv beim Browsen oder Installieren eines Plugins mit LSP-Komponente
- **Mehrwert:** Vor dem Install ist transparent, ob ein Plugin einen LSP-Server installieren würde — wichtig für Plugin-Hygiene, weil LSP-Server eigene Prozesse spawnen und CPU-/Speicher-Footprint haben.
- **Version:** v2.1.142

### [`/web-setup` warnt vor Überschreiben einer bestehenden GitHub App-Verbindung]
- **Was:** `/web-setup` zeigt jetzt eine Warnung, bevor eine bestehende GitHub App-Connection ersetzt wird — vorher wurde stillschweigend überschrieben, was bei mehreren Setups zu „warum bin ich auf einmal disconnected"-Effekten führen konnte.
- **Einsatz:** Automatisch aktiv in `/web-setup` mit existierender Connection
- **Mehrwert:** Teams, die Claude Code on the Web in mehreren Repos/Orgs nutzen, können nicht mehr versehentlich eine produktive Verbindung kappen — der Setup-Flow ist idempotent geworden.
- **Version:** v2.1.142

### [Fix: `MCP_TOOL_TIMEOUT` greift jetzt auch für Remote HTTP/SSE MCP-Server]
- **Was:** Die Umgebungsvariable `MCP_TOOL_TIMEOUT` hob bisher nur das Timeout für lokale STDIO-MCP-Server an — Remote HTTP- und SSE-Server hingen weiterhin am Default-Fetch-Timeout fest. Jetzt wirkt der Override auch für Remote-Server.
- **Einsatz:** `export MCP_TOOL_TIMEOUT=120000` wirkt jetzt auf alle MCP-Transports
- **Mehrwert:** Tools auf langsamen Remote-MCP-Servern (z.B. Cloud-Scraper, große LLM-Querys) liefen bisher unweigerlich in Timeouts, obwohl der User den Wert hochgesetzt hatte — das Setting verhält sich endlich erwartungskonform.
- **Version:** v2.1.142

### [Fix: Background-Sessions erkennen pre-existierende Worktrees]
- **Was:** Wenn vor dem Start einer Background-Session bereits ein git-Worktree für das Zielverzeichnis bestand, ignorierte die Session diesen und versuchte einen neuen anzulegen — was scheiterte oder den falschen Branch nutzte. Pre-existierende Worktrees werden jetzt korrekt erkannt und wiederverwendet.
- **Einsatz:** Automatisch aktiv beim Dispatch in ein Verzeichnis mit existierendem Worktree
- **Mehrwert:** Workflows, in denen User manuell einen Worktree für einen Feature-Branch angelegt hat und anschließend einen Background-Agent darauf ansetzen will, funktionieren wieder ohne Setup-Tanz.
- **Version:** v2.1.142

### [Fix: Background-Sessions überleben macOS Sleep/Wake]
- **Was:** Auf macOS verschwanden Background-Sessions aus der Agent-View, wenn der Rechner zwischenzeitlich in den Sleep ging und wieder aufwachte — die Sessions liefen zwar im Hintergrund weiter, waren aber nicht mehr ansprechbar. Verbindung wird jetzt nach Wake sauber wiederhergestellt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Laptop-User, die Background-Agents über Nacht oder über die Mittagspause laufen lassen, finden ihre Sessions nach dem Aufklappen wieder — Lost-Session-Fälle nach Sleep gehören der Vergangenheit an.
- **Version:** v2.1.142
- **Plattform:** macOS

### [Fix: Daemon beendet sich sauber nach Binary-Upgrade]
- **Was:** Nach einem Binary-Upgrade (`claude upgrade`) blieb der alte Daemon-Prozess teilweise zombiehaft am Leben und blockierte den neuen Daemon-Start. Der alte Daemon terminiert jetzt korrekt, sobald das neue Binary übernimmt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Upgrades sind seamless statt mit „daemon already running"-Fehlern — keine manuellen `pkill claude-daemon`-Aufrufe nach jedem Update mehr nötig.
- **Version:** v2.1.142

### [Fix: Background-Agents crashen nicht mehr bei verbundener Claude-in-Chrome-Extension]
- **Was:** Wenn die Claude-in-Chrome-Browser-Extension mit der Session verbunden war, gerieten Background-Agents in eine Crash-Loop — die Extension-Reconnect-Logik beschoss den Agent mit Events, mit denen er nicht umgehen konnte. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Chrome-Extension-Nutzer können Background-Agents wieder ohne Workarounds (Extension trennen, Session starten, Extension verbinden) verwenden — der Standard-Setup funktioniert.
- **Version:** v2.1.142

### [Fix: Diverse `claude agents`-Polish]
- **Was:** Mehrere kleinere Bugs im `claude agents`-UI behoben: Links in einer attachten Session waren nicht klickbar; die „v to open in editor"-Aktion öffnete den falschen Editor (ignorierte `$EDITOR`); Sessions mit Working-Directory auf Windows-Netzwerklaufwerken brachten den Agent in einen Deadlock; das `claude --bg --dangerously-skip-permissions`-Flag wurde beim Backgrounding nicht persistiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Die Agent-Dashboard-Erfahrung wird durchgängig zuverlässiger — speziell die Windows-Netzlaufwerk-Fixes betreffen Enterprise-Setups mit zentralen File-Servern.
- **Version:** v2.1.142

### [Fix: 256-Color-Terminals — Hintergrund-Bleed in Edit-Diffs behoben]
- **Was:** Auf Terminals, die nur 256 Farben (statt Truecolor) unterstützten, „blutete" der Hintergrund der Diff-Highlights über die Zeilenränder hinaus in nachfolgende Output-Blöcke. Color-Reset wird jetzt korrekt emittiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** SSH-Sessions auf Servern, tmux/screen-Setups und ältere Terminal-Emulatoren zeigen Diffs jetzt sauber begrenzt — keine grünlich/rötlichen Streifen über den ganzen Bildschirm.
- **Version:** v2.1.142

### [Fix: Session-Titel aus URLs werden nicht mehr blind übernommen]
- **Was:** Wenn die erste Nachricht einer Session ausschließlich eine URL war, wurde diese URL als Session-Titel übernommen — was zu unleserlichen Einträgen in der Agent-View führte. Es wird jetzt ein deskriptiver Titel generiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Die Session-Liste in `claude agents` zeigt sinnvolle Titel auch für Sessions, die mit „check this: https://…" starten — bessere Auffindbarkeit alter Sessions.
- **Version:** v2.1.142

### [Fix: Plugin-Cache löscht keine aktive Plugin-Version mehr]
- **Was:** Der periodische Plugin-Cache-Cleanup konnte unter Umständen die aktuell installierte (aktive) Plugin-Version löschen, was den nächsten Plugin-Aufruf brechen ließ. Cleanup-Logik schützt jetzt aktive Versionen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Plugins bleiben über lange Sessions zuverlässig — kein „command not found" mehr aus dem Nichts bei vorher funktionierenden Plugin-Commands.
- **Version:** v2.1.142

### [Fix: Plugin-Browser zeigt korrekte Install-Counts]
- **Was:** Im `/plugin`-Browse-Pane wurden die Install-Counts pro Plugin falsch aggregiert (mehrfach gezählt, wenn ein Plugin in mehreren Marketplaces gelistet war). Counts werden jetzt korrekt dedupliziert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Popularitäts-Signale beim Plugin-Discovery sind wieder vertrauenswürdig — User können Plugin-Auswahlentscheidungen wieder anhand der Verbreitung treffen.
- **Version:** v2.1.142

### [Fix: Plugin-Advisories listen alle shadowed Keys]
- **Was:** Wenn ein Plugin einen Hotkey, Hook oder Command überschrieb, der bereits von einem anderen Plugin oder Built-in belegt war, listete das Advisory nur den ersten Konflikt. Jetzt werden alle shadowed Keys ausgewiesen.
- **Einsatz:** Automatisch aktiv beim Plugin-Install
- **Mehrwert:** Plugin-Konflikt-Diagnose ist vollständig — User entdecken alle Überschreibungen sofort statt iterativ.
- **Version:** v2.1.142

### [Verbesserung: Reactive Compaction Seeding optimiert]
- **Was:** Die reaktive Kontext-Compaction (ausgelöst, wenn das Limit erreicht wird) startet jetzt mit besseren Seeds — der Initialzustand der Summarization wird intelligenter aus den letzten Nachrichten abgeleitet.
- **Einsatz:** Automatisch aktiv bei Auto-Compaction
- **Mehrwert:** Auto-Compaction behält mehr aktuell-relevanten Kontext und wirft weniger versehentlich noch benötigte frühere Diskussion weg — die Session „erinnert sich" nach Compaction besser an die laufende Arbeit.
- **Version:** v2.1.142

### [Verbesserung: Hook-Config-Fehler präziser]
- **Was:** Fehlermeldungen bei kaputten Hook-Konfigurationen (z.B. ungültige Trigger, falsche JSON-Schemas, fehlende Felder) sind jetzt deutlich spezifischer und nennen die exakte Stelle in der Config.
- **Einsatz:** Automatisch aktiv beim Settings-Reload
- **Mehrwert:** Hook-Debugging — vor allem bei verschachtelten Hooks aus mehreren Plugins — wird radikal schneller, weil die Meldung zeigt, welcher Key in welcher Datei das Problem ist.
- **Version:** v2.1.142

### [Verbesserung: Usage-Policy-Refusal-Messages ohne stale Model-Vorschlag]
- **Was:** Wenn ein Request wegen Usage-Policy abgelehnt wurde, enthielt die Fehlermeldung bisher manchmal einen Vorschlag, auf ein älteres Modell (Sonnet 3.5 etc.) auszuweichen — dieses Modell war aber ggf. längst zurückgezogen. Vorschlag wird entfernt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** User folgen keinem irreführenden Vorschlag, der zu „unknown model"-Fehlern führt — Refusal-Messages werden hilfreich statt verwirrend.
- **Version:** v2.1.142

---

### Woche 19 (13. Mai 2026) — v2.1.141

---

### [Hooks: `terminalSequence`-Feld für Desktop-Notifications, Window-Titel und Bells]
- **Was:** Hook-JSON-Output unterstützt jetzt ein `terminalSequence`-Feld — Hooks können Desktop-Benachrichtigungen, Fenster-Titel und Terminal-Bells auslösen, auch wenn kein steuerndes Terminal verfügbar ist (z.B. in Headless-/Background-Sessions).
- **Einsatz:** In Hook-Response-JSON: `{"terminalSequence": "]0;Build done"}` oder ähnliche OSC/ANSI-Sequenzen
- **Mehrwert:** Long-Running-Hooks (Test-Suiten, Deploys) können dem User aktiv Signal geben, ohne dass der Hook eigene TTY-Logik braucht — funktioniert auch bei Hooks, die per Background-Agent laufen.
- **Version:** v2.1.141

### [Env: `CLAUDE_CODE_PLUGIN_PREFER_HTTPS` — GitHub-Plugins per HTTPS klonen]
- **Was:** Neue Umgebungsvariable `CLAUDE_CODE_PLUGIN_PREFER_HTTPS=1` zwingt Claude Code, GitHub-Plugin-Quellen über HTTPS statt SSH zu klonen. Ideal für Umgebungen ohne konfigurierten GitHub-SSH-Key.
- **Einsatz:** `export CLAUDE_CODE_PLUGIN_PREFER_HTTPS=1` vor `claude plugin install <github-source>`
- **Mehrwert:** Corporate-Maschinen, Container und CI-Runner ohne SSH-Auth-Setup können trotzdem GitHub-Plugins beziehen — keine `Permission denied (publickey)`-Fehler beim Plugin-Install.
- **Version:** v2.1.141

### [Env: `ANTHROPIC_WORKSPACE_ID` für Workload Identity Federation]
- **Was:** Neue Umgebungsvariable `ANTHROPIC_WORKSPACE_ID` scoped den gemünzten Token bei Workload Identity Federation auf einen bestimmten Workspace, falls die Federation-Rule mehrere Workspaces abdeckt.
- **Einsatz:** `export ANTHROPIC_WORKSPACE_ID=<workspace-id>` in CI/CD-Pipelines mit Multi-Workspace-Federation-Setup
- **Mehrwert:** Enterprises mit mehreren Workspaces unter einer Federation-Rule können sauber pro Pipeline isolieren, ohne dedicated Service-Accounts pro Workspace zu betreiben — geringere Audit-Komplexität.
- **Version:** v2.1.141

### [`claude agents --cwd <path>` — Session-Liste auf Verzeichnis eingrenzen]
- **Was:** Das `claude agents`-Kommando akzeptiert jetzt `--cwd <path>`, um die Session-Übersicht auf Sessions zu beschränken, die im angegebenen Verzeichnis (oder darunter) gestartet wurden.
- **Einsatz:** `claude agents --cwd ~/proj/myrepo`
- **Mehrwert:** Bei vielen parallel laufenden Claude-Code-Sessions über verschiedene Projekte zeigt die Agent-View nur noch die für den aktuellen Kontext relevanten Agents — schluss mit Scrollen durch Dutzende fremder Sessions.
- **Version:** v2.1.141

### [`/feedback` — Recent Sessions (24h, 7d) einbeziehen]
- **Was:** Beim Absenden von `/feedback` kann jetzt optional ein Zeitfenster (letzte 24 Stunden oder 7 Tage) ausgewählt werden, um mehrere Sessions in den Feedback-Bundle einzuschließen. Vorher war Feedback strikt auf die aktuelle Session beschränkt.
- **Einsatz:** `/feedback` → Auswahl-Dialog zwischen „current session", „last 24h" oder „last 7 days"
- **Mehrwert:** Bei Bugs, die über mehrere Sessions hinweg auftreten (z.B. „Subagent-Routing schlägt sporadisch fehl"), enthält der Bug-Report jetzt den vollen Kontext — Anthropic-Support kann Root-Causes über Session-Grenzen hinweg sehen.
- **Version:** v2.1.141

### [Rewind-Menü: „Summarize up to here" zum Kontext-Komprimieren]
- **Was:** Das `/rewind`-Menü enthält jetzt einen Eintrag „Summarize up to here", der den Conversation-Kontext bis zum gewählten Punkt komprimiert, während die jüngsten Turns intakt bleiben.
- **Einsatz:** `/rewind` → einen früheren Punkt auswählen → „Summarize up to here"
- **Mehrwert:** Bei langen Sessions, bei denen frühe Exploration nicht mehr nötig ist, lässt sich der Kontext gezielt verschlanken, ohne aktive Arbeitsspur zu verlieren — bessere Token-Ökonomie ohne Komplett-Restart.
- **Version:** v2.1.141

### [Auto-Mode Permission-Dialog erklärt `permissions.ask`-Regeln]
- **Was:** Wenn Auto-Mode einen Permission-Prompt zeigt, weil eine `permissions.ask`-Regel matched, wird in der Dialog-Begründung jetzt explizit ausgewiesen, welche Regel den Prompt ausgelöst hat.
- **Einsatz:** Automatisch aktiv im Auto-Mode mit konfigurierten `permissions.ask`-Regeln
- **Mehrwert:** User verstehen sofort, warum Auto-Mode bei einer eigentlich „safe" wirkenden Action plötzlich nachfragt — Debugging von `permissions.ask`-Konfigurationen wird trivial.
- **Version:** v2.1.141

### [„View diff in your IDE" bei File-Edit-Permission-Prompts wiederhergestellt]
- **Was:** Bei aktiver IDE-Connection ist die Option „view diff in your IDE" wieder im File-Edit-Permission-Prompt verfügbar — sie war in einer früheren Version versehentlich entfernt worden.
- **Einsatz:** Automatisch aktiv mit verbundener IDE-Extension (VSCode, JetBrains)
- **Mehrwert:** Diffs werden im vollen Editor-Comfort gereviewt (Syntax-Highlighting, Side-by-Side, Inline-Kommentare) statt im engen Terminal — schnellere und gründlichere Edit-Reviews.
- **Version:** v2.1.141

### [Background Agents behalten aktuellen Permission-Mode bei]
- **Was:** Background-Agents (gestartet via `/bg` oder `←←`) übernehmen jetzt den Permission-Mode der aktuellen Session, statt auf Default zurückzuspringen — vorher konnte ein im Auto-Mode laufender Agent beim Backgrounding plötzlich Permission-Prompts zeigen.
- **Einsatz:** Automatisch aktiv beim Backgrounding
- **Mehrwert:** Lange Background-Jobs behalten den vom User bewusst gewählten Permission-Mode bei — keine unbeabsichtigten Mode-Resets, die Background-Agents zum Stillstand bringen.
- **Version:** v2.1.141

### [`claude agents`: Sessions mit Background-Shell zählen als „Completed"]
- **Was:** Agents, die ihre Arbeit fertig haben, aber noch eine Background-Shell laufen lassen (z.B. ein dauerhafter Dev-Server), werden in `claude agents` jetzt unter „Completed" statt unter „Working" geführt.
- **Einsatz:** Automatisch aktiv in der Agent-View
- **Mehrwert:** Klare visuelle Trennung zwischen Agents, die noch aktiv arbeiten, und solchen, die fertig sind aber Hintergrund-Prozesse halten — User wissen, wo sie ihre Aufmerksamkeit hinlenken müssen.
- **Version:** v2.1.141

### [Spinner: amber-Warmung nach 10 Sekunden Thinking]
- **Was:** Während langer Thinking-Perioden wechselt der Spinner nach 10 Sekunden auf einen Amber-Farbton — Signal, dass Claude weiterhin aktiv arbeitet, nicht hängt.
- **Einsatz:** Automatisch aktiv bei Thinking-Phasen >10s
- **Mehrwert:** Bei Extended-Thinking-Sessions (xhigh-Effort, komplexe Probleme) erkennt man auf einen Blick, dass das Modell noch denkt — keine voreilige Ctrl+C-Aktion mehr aus Sorge, der Prozess sei eingefroren.
- **Version:** v2.1.141

### [Plugin-Menü Navigation verbessert]
- **Was:** Im Plugin-Menü wechseln jetzt `→`/Tab zwischen den Tabs, `↑` springt von der Liste hoch zur Tab-Leiste, und im Fullscreen-Modus sind Tab-Headers und Suchbox klickbar.
- **Einsatz:** Automatisch aktiv im Plugin-Menü
- **Mehrwert:** Tastatur- und Maus-Nutzer kommen schneller durch das Plugin-Discovery — die Navigation fühlt sich vergleichbar mit modernen TUI-File-Managern an.
- **Version:** v2.1.141

### [Fix: Background-Side-Queries bei Bedrock/Vertex/Foundry — Haiku-Fallback]
- **Was:** Side-Queries (z.B. Auto-Naming von Background-Jobs) sendeten auf Bedrock/Vertex/Foundry-Gateways eine unverfügbare Haiku-Model-ID, wenn kein `ANTHROPIC_SMALL_FAST_MODEL`-Override gesetzt war. Fällt jetzt auf das Main-Loop-Model zurück.
- **Einsatz:** Automatisch aktiv auf Drittanbieter-Gateways ohne explizites Haiku-Override
- **Mehrwert:** Background-Jobs bekommen wieder Auto-Names auf Enterprise-Gateways — keine generischen `bg-2026-…`-IDs mehr in der Agent-View, weil das Haiku-Modell beim Provider nicht freigeschaltet ist.
- **Version:** v2.1.141

### [Fix: `claude daemon status` und `/doctor` auf Windows — bessere Fehlermeldungen]
- **Was:** Wenn die Daemon-Pipe-Key-Datei gelockt oder unlesbar war, warfen `claude daemon status` und `/doctor` auf Windows eine opake Exception. Jetzt wird der zugrundeliegende Fehler ausgegeben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Windows-User mit Antivirus-/EDR-Tools, die die Pipe-Key-Datei zwischenzeitlich blockieren, sehen jetzt eine handlungs­bare Meldung statt einer Stack-Trace — schnellere IT-Tickets.
- **Version:** v2.1.141
- **Plattform:** Windows

### [Fix: `/model` ändert nicht mehr Autocompact-Threshold in anderen Sessions]
- **Was:** Wenn in einer Session via `/model` das Modell gewechselt wurde, änderte sich auch in parallel laufenden Sessions stillschweigend der Autocompact-Threshold — die Sessions teilten denselben Settings-Cache. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Parallele Sessions sind wieder vollständig voneinander isoliert in Bezug auf Modell-/Compaction-Settings — kein unerwartetes Verhalten in Session B, weil in Session A der Modus gewechselt wurde.
- **Version:** v2.1.141

### [Fix: Permission-Mode-Switch schließt offene Permission-Prompts]
- **Was:** Wenn ein Tool-Permission-Prompt offen ist und der User parallel den Permission-Mode wechselt (sodass das Tool jetzt auto-allowed wäre), wird der Prompt nun automatisch geschlossen statt offen zu bleiben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Glatter Workflow beim Wechseln in Auto-Mode oder `bypassPermissions` — kein „Geist-Dialog" mehr, der eigentlich obsolet ist.
- **Version:** v2.1.141

### [Fix: Enter im Permission-Dialog submitted nicht mehr versehentlich Text]
- **Was:** Wenn ein Permission- oder Dialog-Prompt geöffnet ist und der User Enter drückt, wurde teilweise auch der Text im Input-Eingabefeld submitted. Jetzt fängt der Dialog Enter exklusiv ab.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine „Oops, ich wollte nur Permissions bestätigen, aber jetzt habe ich aus Versehen meinen halb-getippten Prompt abgeschickt"-Momente mehr.
- **Version:** v2.1.141

### [Fix: Hooks bekommen korrekten `transcript_path` nach `EnterWorktree`]
- **Was:** Nach einem `EnterWorktree`-Wechsel des Arbeitsverzeichnisses bekamen nachfolgende Hooks einen veralteten `transcript_path`, der nicht mehr existierte. Wird jetzt sauber auf den neuen Worktree-Path umgehoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Worktree-basierte Workflows mit Hooks, die das Transcript lesen (Audit-Logger, Code-Review-Bots), funktionieren wieder zuverlässig — keine „File not found"-Fehler in Hook-Logs.
- **Version:** v2.1.141

### [Fix: Markdown-Tabellen mit Cell-Wrapping wieder als Grid gerendert]
- **Was:** Markdown-Tabellen mit Zell-Inhalt, der über die Spaltenbreite hinausging, fielen seit v2.1.136 auf ein vertikales Key-Value-Layout zurück statt als bordered Grid gerendert zu werden. Regression behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Tabellen-lastige Antworten (Vergleichstabellen, Spec-Übersichten) sind wieder sofort lesbar — kein Wechsel mehr zu unleserlichen Key-Value-Wänden bei langen Werten.
- **Version:** v2.1.141

### [Fix: Cancelled Prompts in Up-Arrow-History bewahrt]
- **Was:** Mit Ctrl+C/Esc abgebrochene Prompts wurden aus der Up-Arrow-History entfernt (vor jeder Antwort) bzw. doppelt eingetragen (nach Auto-Restore in die Eingabe). Beide Fälle behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Wer einen Prompt abbricht und ihn später noch einmal ähnlich starten will, findet ihn zuverlässig per Pfeil-oben — keine verlorenen Tippvorgänge mehr.
- **Version:** v2.1.141

### [Fix: Ctrl+C unterbricht laufenden Turn auch im Vim INSERT/VISUAL-Mode]
- **Was:** Mit aktivem Vim-Mode (INSERT oder VISUAL) wurde Ctrl+C als Vim-Mode-Wechsel interpretiert und unterbrach den laufenden Turn nicht. Wird jetzt korrekt zum Turn-Cancel weitergeleitet.
- **Einsatz:** Automatisch aktiv mit Vim-Mode
- **Mehrwert:** Vim-User können laufende Claude-Antworten abbrechen, ohne erst zum Normal-Mode wechseln zu müssen — vertraute Ctrl+C-Reflexe funktionieren wieder.
- **Version:** v2.1.141

### [Fix: Alternative `chat:submit`-Keybindings funktionieren bei umgemapptem Enter]
- **Was:** Wenn `enter` auf `chat:newline` umgebunden war (Multi-Line-Mode), funktionierten alternative `chat:submit`-Bindings wie `meta+enter` oder `ctrl+enter` nicht mehr. Konflikt aufgelöst.
- **Einsatz:** Automatisch aktiv für User mit custom Keybindings
- **Mehrwert:** Multi-Line-Workflow funktioniert wieder durchgängig — Enter macht Newline, Meta+Enter submittet, wie im Mental-Model erwartet.
- **Version:** v2.1.141

### [Fix: Prompt-Suggestions nicht mehr stillschweigend bei Output-Styles deaktiviert]
- **Was:** Wenn ein Output-Style konfiguriert war, wurden Prompt-Suggestions ohne Hinweis komplett deaktiviert. Sie sind jetzt unabhängig vom Output-Style verfügbar.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** User mit eigenem Output-Style (z.B. „Always respond in German") verlieren nicht mehr die Suggestion-Vorschläge — beide Features ko-existieren.
- **Version:** v2.1.141

### [Fix: AskUserQuestion-Popup verdeckt nicht mehr letzte Chat-Zeile]
- **Was:** Der AskUserQuestion-Popup hat in der vorherigen Implementierung die letzte Zeile des darunterliegenden Chat-Inhalts überlagert. Layout-Padding angepasst.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** User sehen den vollen Kontext, der zur Frage führte — keine Sucherei nach „was hat Claude gerade gesagt, bevor die Frage kam?".
- **Version:** v2.1.141

### [Fix: WebSearch zeigt korrekten Error-Status statt „Did 0 searches"]
- **Was:** Wenn alle Web-Search-Calls in einem Turn Errors zurückgaben, zeigte der Status-Bereich „Did 0 searches" statt einer Error-Anzeige — irreführend, weil die Searches gemacht, aber fehlgeschlagen waren.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Beim Debugging von WebSearch-Issues (Rate-Limits, Network-Problemen) sieht der User sofort, dass etwas schief ging, statt zu denken, Claude hätte gar nicht gesucht.
- **Version:** v2.1.141

### [Fix: Multi-Line-Statusline rendert sauber auch bei Terminal-Width-Overflow]
- **Was:** Wenn eine Statusline-Zeile breiter war als das Terminal, wurden andere Zeilen korrupt gerendert oder verschwanden ganz. Truncation/Wrapping ist jetzt sauber pro Zeile.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Custom-Statusline-Skripte (Git-Branch, Token-Counter, Modell-Anzeige) zeigen alle Zeilen stabil, auch in schmalen Splits — keine zufälligen leeren Slots mehr.
- **Version:** v2.1.141

### [Fix: light-ansi Theme — Diff-Context-Lines lesbar auf hellem Hintergrund]
- **Was:** Das `light-ansi`-Theme nutzte für Diff-Context-Zeilen einen unsichtbar-weißen Vordergrund auf hellem Terminal-Hintergrund. Jetzt auf schwarz gesetzt.
- **Einsatz:** Automatisch aktiv mit `light-ansi`-Theme
- **Mehrwert:** User mit hellen Terminals (Tagesarbeit, Präsentations-Setups) können Diffs wieder lesen — keine Such-Aktion mehr nach unsichtbaren Lines.
- **Version:** v2.1.141

### [Fix: Error-Overlay zeigt Original-Error statt Minified-Bundle-Source]
- **Was:** Wenn Claude Code intern crashte, zeigte das Error-Overlay manchmal nur minifizierten Bundle-Code statt der eigentlichen Error-Message — Bug-Reports waren unbrauchbar.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** User können bei Crashes hilfreichen Stack-Trace ablesen und Anthropic-Support kann den Fehler tatsächlich diagnostizieren — keine sinnfreien Single-Line-Bug-Reports mehr.
- **Version:** v2.1.141

### [Fix: `/tui` verweigert Drop von laufenden Background-Shells/Subagents]
- **Was:** `/tui` (TUI-Reset/Wechsel) hat stillschweigend laufende Background-Shells und Subagents gedropped. Verweigert jetzt den Wechsel und fordert auf, auf das Ende der Background-Tasks zu warten.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange Background-Tests oder Migrationen werden nicht mehr versehentlich abgebrochen durch ein gedankenloses `/tui` — der User wird gezwungen, bewusst zu entscheiden.
- **Version:** v2.1.141

### [Fix: Welcome-Banner zeigt Provider-Namen auf Bedrock/Vertex/Foundry]
- **Was:** Auf Drittanbieter-Providern (Bedrock, Vertex, Foundry) zeigte das Welcome-Banner „API Usage Billing" — irreführend, weil dort kein Anthropic-API-Billing greift. Jetzt wird der Provider-Name angezeigt.
- **Einsatz:** Automatisch aktiv auf Drittanbieter-Providern
- **Mehrwert:** Klare Visibility, über welchen Backend-Provider die Session läuft — verhindert Verwirrung über Billing-Zuordnung und Kostenstellen-Tracking.
- **Version:** v2.1.141

### [Fix: Plugin-Install — bessere Meldungen bei ref/sha-Inkonsistenzen]
- **Was:** `claude plugin install` schlug fehl, wenn die im Marketplace gepinnte `ref` upstream nicht mehr existiert, aber zusätzlich eine `sha` gepinnt war. Plugin-MCP-Servers mit nicht-gesetzten Config-Variablen zeigen jetzt eine konkrete „config issue"-Meldung mit Fix-it-Hinweis.
- **Einsatz:** Automatisch aktiv beim Plugin-Install und MCP-Connect
- **Mehrwert:** Plugin-Installations- und Konfigurations-Fehler sind diagnostizierbar — keine generischen „connection failed"-Stack-Traces mehr, sondern „env var FOO is not set, did you mean to export it?".
- **Version:** v2.1.141

### [Fix: MCP HTTP/SSE-Server 403 als „needs auth" statt „failed"]
- **Was:** Wenn ein MCP-HTTP/SSE-Server beim Connect 403 zurückgab, wurde er als generisch „failed" markiert. Jetzt wird korrekt „needs auth" angezeigt — User wissen, dass sie `/mcp` → Login machen müssen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Authenticated MCP-Server (Linear, Notion, Slack) haben einen klaren Recovery-Path bei abgelaufener Auth — kein Trial-and-Error-Debugging mehr.
- **Version:** v2.1.141

### [Fix: Remote MCP-Server — Tool-Calls funktionieren auch bei Stream-Fail]
- **Was:** Wenn der optionale Server-Events-Stream eines Remote-MCP-Servers nicht reconnecten konnte, wurde der gesamte Server stillschweigend disconnected — auch die Tool-Calls über POST verloren. Tool-Calls laufen jetzt unabhängig vom Stream weiter.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Remote-MCPs sind robuster gegenüber transient broken Event-Streams (z.B. Firewall-Idle-Timeouts) — Core-Funktionalität bleibt verfügbar, auch wenn Push-Notifications kurzzeitig ausfallen.
- **Version:** v2.1.141

### [Fix: Remote-Control MCP — kein 401-Cascade bei Token-Rotation]
- **Was:** Wenn der Worker-Session-Token mitten in einer Session rotierte, schlugen alle Remote-Control-MCP-Connectors gleichzeitig mit 401 fehl. Token-Rotation wird jetzt sauber an Connectoren weitergereicht.
- **Einsatz:** Automatisch aktiv für Remote-Control-User
- **Mehrwert:** Lange Remote-Control-Sessions überstehen Token-Rotations ohne Re-Login — kein Workflow-Unterbruch mehr nach 1-2 Stunden Arbeit.
- **Version:** v2.1.141

### [Fix: Remote-Control — kein Auto-Re-Enroll bei stale Token]
- **Was:** Wenn der Remote-Control-Server einen stale Token ablehnte, hat der Client automatisch versucht, das Device neu zu enrollen — was in einer `/login`-Schleife enden konnte. Jetzt wird stattdessen der bestehende Trusted-Device-Token refreshed.
- **Einsatz:** Automatisch aktiv für Remote-Control-User
- **Mehrwert:** Stabile Remote-Control-Sessions ohne Re-Enrollment-Loops — auch bei längeren Offline-Phasen oder Server-Restarts.
- **Version:** v2.1.141

### [Fix: Windows Alt+V Image-Paste mit Screenshot-Clipboard]
- **Was:** Wenn die Windows-Zwischenablage einen Screenshot enthielt (z.B. von Snipping Tool), meldete Alt+V „no image found". Clipboard-Format-Detection erkennt jetzt Screenshots korrekt.
- **Einsatz:** Automatisch aktiv auf Windows
- **Mehrwert:** Windows-User können Screenshots wieder direkt per Alt+V einfügen — kein Workaround mehr über Datei-Speicherung und Drag-and-Drop.
- **Version:** v2.1.141
- **Plattform:** Windows

### [Fix: SDK „native binary not found" auf Linux mit glibc + musl]
- **Was:** Das SDK warf auf Linux-Systemen, auf denen sowohl glibc- als auch musl-Platform-Packages installiert waren, „Claude Code native binary not found". Binary-Detection wählt jetzt korrekt das passende Build.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Polyglot-Containerized-Setups (Alpine + Debian-Tools im selben Image) können das Claude-Code-SDK einbinden, ohne Native-Binary-Pfad-Hacks.
- **Version:** v2.1.141
- **Plattform:** Linux

### [Fix: Bedrock `awsCredentialExport` — Cross-Account-Access funktioniert]
- **Was:** Wenn `awsCredentialExport` konfiguriert war, wurde der Hook übersprungen, sobald ambient AWS-Credentials auflösten — Cross-Account-Setups (Assume-Role) brachen still. Hook läuft jetzt immer.
- **Einsatz:** Automatisch aktiv auf Bedrock mit `awsCredentialExport`
- **Mehrwert:** Multi-Account-AWS-Setups (Claude in Account A, Bedrock in Account B per Assume-Role) bekommen wieder zuverlässige Auth — keine sporadischen AccessDenied-Errors mehr.
- **Version:** v2.1.141

### [`claude agents`: Robustheit beim Launch — Fallback bei kranker Pre-Warm-Session]
- **Was:** Beim Launch einer Session in `claude agents` wurde bisher zwingend ein vorgewärmter Background-Worker genutzt. Falls dieser unhealthy ist, wird jetzt sauber auf einen frischen Launch zurückgefallen.
- **Einsatz:** Automatisch aktiv in `claude agents`
- **Mehrwert:** Sessions starten zuverlässig, auch wenn der Background-Worker-Pool teilweise hängt — keine Failure-Cascades mehr in der Agent-View.
- **Version:** v2.1.141

### [`claude agents`: leere Idle-Background-Sessions werden nach 5 Min retiriert]
- **Was:** Leere Idle-Background-Sessions, die durch ein einzelnes `←` (Backgrounding eines frischen REPLs) entstehen, werden vom Daemon jetzt nach 5 Minuten automatisch retiriert — vorher blieben sie als „Placeholder" in der Agent-View hängen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Saubere Agent-View ohne historische „Geister-Sessions", die nie genutzt wurden — schluss mit manueller Aufräum-Arbeit.
- **Version:** v2.1.141

---

### Woche 19 (12. Mai 2026) — v2.1.140

---

### [Agent-Tool: `subagent_type` case- und separator-insensitive]
- **Was:** Das `subagent_type`-Argument des Agent-Tools akzeptiert jetzt Variationen — `"Code Reviewer"`, `"code_reviewer"` oder `"CodeReviewer"` lösen sich alle korrekt zum Agent `code-reviewer` auf. Groß-/Kleinschreibung und Trenner (Leerzeichen, Underscore, Bindestrich, CamelCase) werden tolerant gematcht.
- **Einsatz:** Im Agent-Tool-Call `subagent_type` mit beliebigem Casing/Separator angeben
- **Mehrwert:** Schluss mit „agent not found"-Fehlern wegen Tippfehlern oder Stil-Inkonsistenzen — Orchestratoren bauen Agent-Aufrufe robust, ohne den exakten kanonischen Namen kennen zu müssen.
- **Version:** v2.1.140

### [Aktualisierte Agent-Farbpalette]
- **Was:** Die Farbpalette für Agents (Anzeige in `claude agents`-View, Transcripts, OTEL-Logs) wurde überarbeitet — bessere visuelle Unterscheidung paralleler Agents und konsistentere Farben über Light-/Dark-Themes.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** In Multi-Agent-Sessions (Research Preview von Agent View) sind verschachtelte Subagents auf einen Blick auseinanderzuhalten — kein „welcher Agent war nochmal Magenta?".
- **Version:** v2.1.140

### [Fix: `/goal` hängt nicht mehr stumm bei `disableAllHooks` / `allowManagedHooksOnly`]
- **Was:** Wenn `disableAllHooks` oder `allowManagedHooksOnly` aktiv waren, blockierte `/goal` stillschweigend ohne Rückmeldung — der Command zeigt jetzt eine klare Meldung, dass die Goal-Funktion in dieser Hook-Policy nicht verfügbar ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Enterprise-Policies, die Hooks restriktiv konfigurieren, geben jetzt verständliches Feedback statt einer toten Eingabezeile — kein „warum tut sich nichts?" mehr.
- **Version:** v2.1.140

### [Fix: `claude --bg` — keine „connection dropped mid-request" mehr bei Idle-Exit]
- **Was:** `claude --bg <task>` schlug mit „connection dropped mid-request" fehl, wenn der Background-Service kurz vor dem Idle-Exit stand — Race-Condition zwischen Connection-Aufbau und Shutdown-Timer. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Background-Sessions (per `--bg` oder `/bg`) starten zuverlässig auch nach längeren Pausen — keine zufällig fehlschlagenden Jobs mehr beim Anstoßen neuer Hintergrund-Tasks.
- **Version:** v2.1.140

### [Fix: Background-Service-Startup auf Enterprise-Endpoint-Security-Maschinen]
- **Was:** Der Background-Service brach beim Start ab, wenn Endpoint-Security-Software (CrowdStrike, SentinelOne, Defender mit aggressiver Policy) den Service-Spawn verlangsamte — der Startup-Timeout war zu kurz. Timeout großzügiger gesetzt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Corporate-Laptops mit EDR-Tools können Background-Sessions und Agent-View wieder nutzen, ohne dass IT eine Allowlist-Ausnahme bauen muss.
- **Version:** v2.1.140

### [Fix: Remote-Managed-Settings — Retry mit force-refreshed Token bei 401]
- **Was:** Bekommt der Remote-Managed-Settings-Fetch ein 401 zurück, wird der Token jetzt force-refreshed und der Request einmal retried — vorher gab es kein Retry, und der Settings-Pull schlug stumm fehl.
- **Einsatz:** Automatisch aktiv bei aktivem `forceRemoteSettingsRefresh`
- **Mehrwert:** Enterprises mit kurzlebigen OAuth-Tokens bekommen ihre Managed-Settings auch dann durchgereicht, wenn der Token-Cache während des Pulls ablief — kein Settings-Drift mehr durch transiente Auth-Fehler.
- **Version:** v2.1.140

### [Fix: `extraKnownMarketplaces` Auto-Update-Policy wird persistiert]
- **Was:** Die Managed-Policy `extraKnownMarketplaces` für Auto-Updates wurde zwischen Sessions nicht persistiert — Admin-Konfigurationen für zusätzliche Plugin-Marketplaces verschwanden nach CLI-Restart. Behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Enterprise-Internal-Marketplaces (z.B. firmeneigene Plugin-Registries) bleiben dauerhaft konfiguriert, ohne dass User sie pro Session re-installieren müssen.
- **Version:** v2.1.140

### [Fix: `/loop` schedulte redundante Wakeups]
- **Was:** `/loop` (Dynamic Mode) konnte mehrere überlappende Wakeups schedulen, wenn das Modell zwischen zwei aktiven Iterations einen weiteren `ScheduleWakeup`-Aufruf machte — führte zu doppelten Firings. Wakeup-State wird jetzt korrekt deduplicated.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Loop-basierte Watcher (z.B. „check CI alle 5 Minuten") laufen ohne Duplicate-Runs — saubere Polling-Cadence und keine doppelten Token-Kosten.
- **Version:** v2.1.140

### [Fix: Event-Loop-Stall auf Windows bei Missing Executables]
- **Was:** Auf Windows konnte der Event-Loop kurzfristig stallen, wenn ein konfigurierter Hook/MCP-Server auf ein fehlendes Executable verwies — der Spawn-Aufruf blockierte synchronen Path-Lookup. Async behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Windows-Setups mit teilweise fehlenden Tools (z.B. `git` nicht im PATH) frieren nicht mehr periodisch ein — UI bleibt responsive, auch wenn Hook-Configs leicht inkonsistent sind.
- **Version:** v2.1.140
- **Plattform:** Windows

### [Fix: `Read`-Tool — Offset-Strings mit Whitespace oder `+`-Prefix akzeptiert]
- **Was:** `Read`-Tool-Calls scheiterten an der Input-Validation, wenn der `offset`-Parameter als String mit führendem/trailing Whitespace oder mit explizitem `+`-Prefix (`"+100"`) übergeben wurde — beides wird jetzt toleriert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Subagents und externe Orchestratoren, die Offsets dynamisch konstruieren (String-Concat, Template-Engines), brechen nicht mehr an Whitespace-Edge-Cases.
- **Version:** v2.1.140

### [Fix: Native-Terminal-Cursor bleibt am Input-Caret bei Focus-Verlust]
- **Was:** Wenn das Terminal-Fenster den Focus verlor, sprang der native Terminal-Cursor weg vom aktuellen Input-Caret-Position (oben links oder zur letzten Render-Position). Bleibt jetzt sauber am Eingabe-Caret.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Beim Wechsel zwischen Apps (Browser ↔ Terminal) ist sofort sichtbar, wo der Cursor steht — keine Sucherei, weil die Eingabe scheinbar „verschwand".
- **Version:** v2.1.140

### [Plugins: Warnung bei silent-ignorierten Default-Component-Foldern]
- **Was:** Wenn ein Plugin in `plugin.json` Component-Folder explizit konfiguriert, werden die Default-Folder (`hooks/`, `skills/`, `commands/`, `mcp-servers/`) stillschweigend ignoriert. Plugins erhalten jetzt eine Warnung, falls solche Default-Folder vorhanden sind, aber von der Config ausgeschlossen werden.
- **Einsatz:** Automatisch aktiv beim Plugin-Load
- **Mehrwert:** Plugin-Autoren sehen sofort, dass ihre `hooks/lint.sh` nicht geladen wird, weil `plugin.json` z.B. nur `commands/` listet — keine stille Konfigurations-Falle mehr.
- **Version:** v2.1.140

### [Fix: MCP OAuth-Token-Refresh Race-Conditions bei mehreren Servern]
- **Was:** Wenn mehrere MCP-Server gleichzeitig einen OAuth-Token-Refresh anstießen, konnten Race-Conditions zu fehlgeschlagenen Re-Authentifizierungen führen — Refresh-Locks pro Token-Identity sorgen jetzt für sequentielle Refreshs.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Setups mit mehreren MCP-Servern desselben Providers (z.B. Linear + Notion über separate OAuth-Clients) verlieren keine Connections mehr bei gleichzeitiger Token-Expiry.
- **Version:** v2.1.140

---

### Woche 19 (11. Mai 2026) — v2.1.139

---

### [Agent View (Research Preview): zentrale Liste aller Claude-Code-Sessions]
- **Was:** Neuer `claude agents`-View listet alle laufenden, blockierten und abgeschlossenen Sessions in einer einzigen Übersicht — Status, ob Input nötig ist, letzte Antwort, letzte Interaktion. Background-Sessions können per `claude --bg <task>` direkt im Hintergrund gestartet oder aus einer aktiven Session per `/bg` ausgelagert werden; Pfeil-Links wechselt jederzeit zurück zur Agent-View.
- **Einsatz:** `claude agents` aufrufen oder Pfeil-Links aus einer Session drücken; im Hintergrund starten via `claude --bg "review PR #42"`, aus Session in Background per `/bg`
- **Mehrwert:** Schluss mit tmux-Grid und Tab-Jonglage — mehrere parallele Agents (PR-Reviewer, Dashboard-Updater, Long-Running-Builds) bleiben in einer Liste, einspringen nur, wenn Claude blockiert. Verfügbar auf Pro, Max, Team, Enterprise und Claude API.
- **Version:** v2.1.139 (Research Preview)

### [`/goal`: Completion-Condition über mehrere Turns hinweg]
- **Was:** Neuer Slash-Command setzt eine Erfolgs-Bedingung; Claude arbeitet turn-by-turn weiter, bis sie erfüllt ist. Ein Overlay-Panel zeigt live elapsed time, Turns und Token-Verbrauch.
- **Einsatz:** `/goal "alle Tests grün und Linter clean"` interaktiv, in `-p` (Headless) und Remote Control
- **Mehrwert:** Längere Refactorings („refactor X bis Tests bleiben grün") laufen ohne ständiges manuelles „weiter" — Claude bewertet die Goal-Condition selbst und stoppt erst beim Ziel.
- **Version:** v2.1.139

### [`/scroll-speed`: Mouse-Wheel-Geschwindigkeit mit Live-Preview]
- **Was:** Neuer Slash-Command zum Tunen der Mouse-Wheel-Scroll-Geschwindigkeit im CLI, mit Live-Vorschau im Terminal während des Anpassens.
- **Einsatz:** `/scroll-speed` und Slider auf gewünschten Wert ziehen
- **Mehrwert:** Lange Transkripte endlich angenehm scrollbar — vor allem in Terminals (Windows Terminal, VS Code), die unterschiedlich aggressive Defaults haben.
- **Version:** v2.1.139

### [`claude plugin details <name>`: Komponenten-Inventar und Token-Kosten pro Plugin]
- **Was:** Neuer CLI-Befehl zeigt für ein installiertes Plugin alle Komponenten (Hooks, Skills, Slash-Commands, MCP-Server) plus den projizierten Token-Verbrauch pro Session.
- **Einsatz:** `claude plugin details <name>`
- **Mehrwert:** Vor dem Aktivieren eines schweren Plugins (z.B. großer Skill-Sammlung) sieht man transparent, wie viel Context-Window es kostet — fundierte Plugin-Auswahl statt Blind-Install.
- **Version:** v2.1.139

### [Transcript-View: Keyboard-Navigation mit `?`, `{`/`}`, `v`]
- **Was:** Transcript-View bekommt Keyboard-Shortcuts: `?` zeigt alle Shortcuts, `{` und `}` springen rückwärts/vorwärts zwischen User-Prompts, `v` togglet das Shortcut-Panel.
- **Einsatz:** Im Transcript-Viewer Tasten direkt drücken
- **Mehrwert:** Schnelles Hin-und-her zwischen langen Conversation-Steps ohne Maus — besonders wertvoll beim Review langer Agent-Läufe oder Debugging.
- **Version:** v2.1.139

### [Hook `args: string[]` (exec form): kein Shell, kein Quoting]
- **Was:** Hook-Definitionen unterstützen jetzt ein `args: string[]`-Feld, das den Command direkt spawnt — ohne Shell dazwischen, daher müssen Path-Placeholder nicht mehr quoted werden.
- **Einsatz:** In Hook-Config: `{"command": "python", "args": ["${CLAUDE_PROJECT_DIR}/scripts/lint.py", "${CLAUDE_FILE_PATH}"]}`
- **Mehrwert:** Ende der Shell-Escaping-Hölle — Pfade mit Spaces, Sonderzeichen oder Variablen werden zuverlässig durchgereicht, auch unter Windows.
- **Version:** v2.1.139

### [Hook `continueOnBlock` für `PostToolUse`: Rejection-Reason zurück an Claude]
- **Was:** Neue `continueOnBlock: true`-Option in `PostToolUse`-Hooks füttert die Ablehnungs-Begründung des Hooks zurück ans Modell — der Turn läuft weiter, statt hart abzubrechen.
- **Einsatz:** Im Hook-Config `{"matcher": "...", "hooks": [{"type": "command", "command": "...", "continueOnBlock": true}]}`
- **Mehrwert:** Linter-, Test- oder Security-Hooks können Claude konstruktives Feedback geben („Zeile 42: ungetypter Param") und Claude fixt direkt in der gleichen Session — kein User mehr als Vermittler zwischen Hook-Output und nächstem Prompt.
- **Version:** v2.1.139

### [MCP stdio-Server: `CLAUDE_PROJECT_DIR` im Env, `${CLAUDE_PROJECT_DIR}` in Plugin-Configs]
- **Was:** MCP stdio-Server erhalten jetzt `CLAUDE_PROJECT_DIR` in der Environment (analog zu Hooks). Plugin-Configs dürfen `${CLAUDE_PROJECT_DIR}` in `command`/`args` referenzieren.
- **Einsatz:** Im MCP-Server-Code `process.env.CLAUDE_PROJECT_DIR`; in Plugin-MCP-Config `"command": "${CLAUDE_PROJECT_DIR}/.mcp/my-server"`
- **Mehrwert:** Projekt-relative MCP-Server (lokale Tooling-Bridges) laufen ohne fragile `pwd`-Tricks oder Annahmen über das CWD.
- **Version:** v2.1.139

### [Compaction bewahrt sensitive User-Instructions]
- **Was:** Der Compaction-Prompt wurde aktualisiert: das Modell wird angewiesen, sensitive User-Anweisungen (z.B. „NIEMALS Force-Push", „kein direkter Prod-Zugriff") beim Komprimieren explizit zu erhalten.
- **Einsatz:** Automatisch aktiv bei Auto-Compaction
- **Mehrwert:** Sicherheits- und Verhaltens-Regeln überleben den Context-Squeeze — kein leiser Regelverlust nach mehrstündigen Sessions.
- **Version:** v2.1.139

### [`/mcp` Reconnect: lädt `.mcp.json`-Edits ohne Restart, zeigt HTTP-Status]
- **Was:** `/mcp` Reconnect zieht jetzt Änderungen an `.mcp.json` direkt ein (kein CLI-Restart mehr nötig) und gibt bei Connect-Fehlern HTTP-Status-Code und URL aus.
- **Einsatz:** Nach Edit von `.mcp.json` einfach `/mcp` → Reconnect
- **Mehrwert:** MCP-Server-Config iterieren ohne CLI-Restart — und bei Connect-Fehlern direkt sehen, ob 401/404/500 statt nur „failed".
- **Version:** v2.1.139

### [`/context` zeigt Plugin-Quelle bei Skills + tokenizer-genaue Skill-Tokens]
- **Was:** `/context` zeigt für plugin-sourced Skills jetzt den Plugin-Namen als Quelle. `/context all` berechnet per-Skill-Token-Werte mit dem tatsächlichen Modell-Tokenizer und zeigt sie gerundet.
- **Einsatz:** `/context` bzw. `/context all` im laufenden Chat
- **Mehrwert:** Klare Zuordnung „welches Plugin bringt welchen Skill" + exakte Token-Werte fürs Audit eines aufgeblähten Context-Windows.
- **Version:** v2.1.139

### [Subagent-Telemetrie: `agent_id`/`parent_agent_id` Header und OTEL-Spans]
- **Was:** API-Requests aus Subagents tragen jetzt `x-claude-code-agent-id` und `x-claude-code-parent-agent-id` Header. Die `claude_code.llm_request`-OTEL-Spans enthalten entsprechende `agent_id`/`parent_agent_id` Attribute.
- **Einsatz:** Automatisch aktiv; in Grafana/Datadog nach `agent_id` filtern oder Eltern-Agent gruppieren
- **Mehrwert:** Nachvollziehbares Tracing in Sessions mit verschachtelten Agents — wer hat welchen API-Call ausgelöst, wessen Token-Verbrauch gehört zu welcher Sub-Task.
- **Version:** v2.1.139

### [`claude plugin install`: automatischer Marketplace-Refresh und Retry]
- **Was:** `claude plugin install <name>@<marketplace>` aktualisiert jetzt automatisch den Marketplace-Index und versucht es erneut, bevor das Plugin als „not found" gemeldet wird.
- **Einsatz:** `claude plugin install foo@my-marketplace`
- **Mehrwert:** Frisch veröffentlichte Plugins lassen sich sofort installieren — kein manueller Refresh-Befehl mehr nötig.
- **Version:** v2.1.139

### [API-Key-Modus deaktiviert Remote Control, `/schedule`, claude.ai-Connectors]
- **Was:** Wenn `ANTHROPIC_API_KEY`, `apiKeyHelper` oder `ANTHROPIC_AUTH_TOKEN` gesetzt ist, sind Remote Control, `/schedule`, claude.ai-MCP-Connectors und Notification-Preferences deaktiviert — auch dann, wenn parallel ein Claude.ai-Login vorliegt.
- **Einsatz:** Für diese Features API-Key unsetten und auf Claude.ai-Login zurückfallen
- **Mehrwert:** Klare Trennung zwischen API-Key-Pipeline und Claude.ai-Backend — keine Surprise-Fehler in Mixed-Setups („warum geht `/schedule` nicht?").
- **Version:** v2.1.139

### [`/plugin` Details: saubere Hook-Event- und MCP-Server-Namen]
- **Was:** Im `/plugin`-Details-Panel werden Hook-Event-Namen und MCP-Server-Namen jetzt korrekt aufgelöst statt internem Bezeichner.
- **Einsatz:** Automatisch aktiv in `/plugin`
- **Mehrwert:** Plugin-Inspektion bleibt lesbar, statt kryptische IDs zu zeigen.
- **Version:** v2.1.139

### [Remote MCP-Server: Reconnect-Retry bei transienten Fehlern für alle aktiv]
- **Was:** Der automatische Reconnect-Retry für transient fehlschlagende Remote-MCP-Server ist jetzt für alle User aktiviert (war zuvor hinter Flag).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kurze Netz-/Backend-Aussetzer bei Linear, Sentry, GitHub-MCP führen nicht mehr zu „server disconnected" — transparenter Reconnect.
- **Version:** v2.1.139

### [Fix: `autoAllowBashIfSandboxed` greift bei `$VAR`/`$(cmd)`]
- **Was:** `autoAllowBashIfSandboxed` approved Bash-Commands mit Shell-Expansions wie `$VAR` oder `$(cmd)` nicht mehr automatisch — Bug behoben.
- **Einsatz:** Automatisch aktiv bei aktivem `autoAllowBashIfSandboxed`
- **Mehrwert:** Sandbox-Workflows mit Variablen-Templates (`$HOME`, `$CLAUDE_PROJECT_DIR`) laufen wieder ohne manuelle Bestätigung pro Command.
- **Version:** v2.1.139

### [Fix: Hooks ohne Terminal-Zugang (kein Prompt-Corruption mehr)]
- **Was:** Ein Hook, der ans Terminal schrieb, konnte einen on-screen interaktiven Prompt korrumpieren — Hooks laufen jetzt isoliert ohne Terminal-Zugang.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Hooks mit `print`/`echo`-Statements verfälschen die UI nicht mehr — Logs gehen sauber in den Hook-Output.
- **Version:** v2.1.139

### [Fix: HTTP/SSE MCP-Server — kein unbounded Memory-Growth, Cap bei 16 MB/Frame]
- **Was:** Wenn ein HTTP/SSE-MCP-Server Non-Protocol-Daten streamte, konnte der RAM unkontrolliert wachsen. Response-Bodies sind jetzt auf 16 MB pro SSE-Frame gecapped.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Long-running Sessions mit chatty MCP-Servern (z.B. Log-Tailer) bleiben speicherstabil — keine OOM-Crashs mehr nach Stunden.
- **Version:** v2.1.139

### [Fix: `Skill(name *)` Wildcard funktioniert als Prefix-Match]
- **Was:** `Skill(name *)`-Permission-Rules taten nicht das Erwartete — Bug behoben, Verhalten matcht jetzt `Bash(ls *)`.
- **Einsatz:** In Permission-Rules `"Skill(myorg/* *)"` für alle Skills eines Org-Prefixes
- **Mehrwert:** Konsistente Wildcard-Semantik über alle Tool-Permissions — keine Spezial-Regeln pro Plugin/Skill mehr.
- **Version:** v2.1.139

### [Fix: Settings-Hot-Reload erkennt Edits an symlinked `~/.claude/settings.json`]
- **Was:** Settings-Hot-Reload bemerkte Edits an einem symlinked `~/.claude/settings.json` nicht — Bug behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Dotfiles-Symlink-Setups (Multi-Machine, Stow, chezmoi) brauchen nach Settings-Edit keinen CLI-Restart mehr.
- **Version:** v2.1.139

### [Fix: Auth-Deadlock bei expired Credentials + `forceRemoteSettingsRefresh`]
- **Was:** Expired Credentials kombiniert mit dem `forceRemoteSettingsRefresh`-Policy-Setting blockierten `claude auth login`/`logout`/`status` ohne Recovery-Pfad — Bug behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Enterprises mit `forceRemoteSettingsRefresh`-Policy kommen aus einem Auth-Lockout wieder raus, ohne manuell Credentials-Datei löschen zu müssen.
- **Version:** v2.1.139

### [Fix: `/model` Picker respektiert `ANTHROPIC_DEFAULT_OPUS_MODEL`/`SONNET_MODEL`]
- **Was:** Die „Default"-Zeile im `/model`-Picker reflektierte gesetzte `ANTHROPIC_DEFAULT_OPUS_MODEL`/`ANTHROPIC_DEFAULT_SONNET_MODEL`-Overrides nicht — gefixt.
- **Einsatz:** Automatisch aktiv in `/model`
- **Mehrwert:** Klare Anzeige des effektiv aktiven Modells für User, die per Env-Var auf eine andere Snapshot-Version pinnen.
- **Version:** v2.1.139

### [Fix: Spurious „stream idle timeout" 5 Min nach Response-Ende]
- **Was:** Ein verspäteter `stream idle timeout`-Fehler wurde gelegentlich 5 Minuten nach abgeschlossenem Response geworfen — der Watchdog-Timer wurde bei Stream-Cancellation nicht gelöscht. Bug behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine Phantom-Timeouts mehr in Sessions, die längst weitergelaufen sind — sauberes Stream-Lifecycle.
- **Version:** v2.1.139

### [Fix: 10+ MCP-Server bei unwritable Cache-Dir — Error-Message mit Ursache]
- **Was:** Bei 10+ konfigurierten MCP-Servern und einem unwritable Cache-Verzeichnis brach Claude Code mit `exit 1` ohne Erklärung ab. Die Fehlermeldung enthält jetzt die zugrundeliegende Ursache.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schnellere Diagnose von Setup-Problemen (z.B. read-only `~/.cache/claude/`) statt stillschweigendem Crash.
- **Version:** v2.1.139

### [Fix: VS Code/Cursor — gleichmäßiges Mouse-Wheel-Scrolling auf 1.92–1.104]
- **Was:** Mouse-Wheel-Scrolling in Cursor und VS Code 1.92–1.104 war ruckelig oder zu schnell — Fix sorgt für gleichmäßige Trackpad-Bewegung und ~3 Zeilen pro Wheel-Notch.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange Transkripte im VS-Code-Terminal/Extension wieder vernünftig navigierbar.
- **Version:** v2.1.139
- **Plattform:** VS Code, Cursor

### [VS Code: `Cmd/Ctrl+Shift+T` öffnet zuletzt geschlossenen Session-Tab]
- **Was:** Neuer VS-Code-Shortcut `Cmd/Ctrl+Shift+T` öffnet den zuletzt geschlossenen Session-Tab erneut — analog zum Browser-Verhalten. Konfigurierbar über `claudeCode.enableReopenClosedSessionShortcut`.
- **Einsatz:** Bei aktiver Claude-Extension `Cmd+Shift+T` (macOS) bzw. `Ctrl+Shift+T` (Win/Linux) drücken
- **Mehrwert:** Versehentlich geschlossene Session schnell zurückholen — kein „aus History suchen"-Umweg.
- **Version:** v2.1.139
- **Plattform:** VS Code

### [Sammel-Fix v2.1.139: Diverse UI-/Render-/Edge-Case-Korrekturen]
- **Was:** Mehrere kleinere Bugfixes: Hyperlinks lesbar auf Dark Themes, Bash-Mode-Up-Arrow überschreibt In-Progress-Draft nicht mehr, Multi-Image-Paste fügt alle Bilder ein (nicht nur das letzte), Transcript-Letter-Shortcuts nach Maus-Klick reaktiv, Border-Text bei CJK/Emoji ohne Overflow, Fuzzy-Match splittet Emoji-Pairs nicht mehr, Skill-Arg-Namen mit Regex-Metazeichen funktionieren, ProgressBar rendert keinen vollen Block für fast-volle Cells, Cmd-only-Keybindings nicht mehr als unparsbar geflagged, Insights-Time-of-Day-Chart-Skew bei unparseable Timestamps, Grep mit Windows-Drive-Letter-Pfaden relativisiert korrekt, Plugin-Update bewahrt Cross-Plugin-Symlinks, `claude_code.active_time.total` OTEL-Metric in `--print` Mode emittiert, Two-File-Diff-Snippet zählt Truncated-Lines richtig, MCP-Resources disconnected Server fallen aus `@server:`-Autocomplete, Plugin-Dep-Resolution stale count bei abweichender Manifest-Name, Background-Session-Scroll in Windows Terminal/VS Code, redundante „Current model"-Zeile im Picker für 3P entfernt, legacy Opus-Picker-Entry auf PAYG-3P aufgelöst, `--mouse`-Cursor-Blinking auf Tab-Namen/Listen-Pointern entfernt, Plugin-Details lädt bei abweichendem Marketplace-Key, Task-Polling/fs.watch-Resurrection bei Last-Subscriber-Race gestoppt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Liefert in Summe spürbar weniger Render-Artefakte und Edge-Case-Fehler im täglichen Einsatz — vor allem für Windows-, CJK- und PAYG-3P-Setups.
- **Version:** v2.1.139

---

### Plattform-Ankündigungen (11. Mai 2026)

---

### [Claude Platform on AWS (GA): volle API-Feature-Parity über AWS-Billing]
- **Was:** Claude Platform ist auf AWS allgemein verfügbar — kompletter Claude-API-Feature-Set (Managed Agents Beta, Code-Execution-Tool, Web Search/Fetch, Files API Beta, Skills Beta, MCP Connector Beta, Prompt Caching, Batch Processing) mit AWS-IAM-Auth, einzelnem AWS-Invoice, AWS-Commitment-Verrechnung und CloudTrail-Audit-Logging. Modelle Opus 4.7, Sonnet 4.6 und Haiku 4.5 mit Day-One-Release-Parity. Verfügbar in den meisten AWS-Commercial-Regions mit Global- und U.S.-Inference-Optionen. Abgrenzung zu Amazon Bedrock: Claude Platform on AWS bietet volle Feature-Parity und Day-One-Access; Bedrock bleibt der Weg bei strikten Regional-Data-Residency-Anforderungen.
- **Einsatz:** Claude Code CLI per AWS-IAM-Auth gegen Claude Platform endpoint statt 1P-API oder Bedrock konfigurieren; Authentifizierung über Standard-AWS-Credentials, Verrechnung über die normale AWS-Rechnung
- **Mehrwert:** Enterprises auf AWS bekommen Claude Code mit allen Features (inkl. Skills, Files, MCP-Connectors) ohne Bedrock-Feature-Lag, behalten aber AWS-Commitment-Discounts, IAM-Permissions und CloudTrail-Audit — keine separate Anthropic-Vertragsspur mehr nötig.
- **Version:** Ankündigung 2026-05-11 (GA)

---

### Woche 19 (9. Mai 2026) — v2.1.138

---

### [v2.1.138: Internal Fixes Patch-Release]
- **Was:** Wartungs-Release ~6 Stunden nach v2.1.137 mit ausschließlich internen Fixes — keine user-facing Features, keine neuen Settings, keine dokumentierten Bugfixes in den Release-Notes.
- **Einsatz:** Automatisch aktiv nach Update (Homebrew/WinGet/npm); kein Aktions-Bedarf
- **Mehrwert:** Stabilitäts-Polish auf den frischen v2.1.137-Windows-VS-Code-Fix — empfehlenswert für alle, die heute morgen schon auf 137 geupdatet hatten.
- **Version:** v2.1.138

### Woche 19 (9. Mai 2026) — v2.1.137

---

### [VS Code: Extension-Activation auf Windows repariert]
- **Was:** Die VS-Code-Extension scheiterte unter Windows beim Aktivieren — Patch-Release behebt den Activation-Failure.
- **Einsatz:** Automatisch aktiv nach Update auf v2.1.137
- **Mehrwert:** Windows-Nutzer erhalten Claude Code direkt in VS Code wieder funktionsfähig — keine Workaround via Terminal mehr nötig.
- **Version:** v2.1.137
- **Plattform:** Windows / VS Code

### Woche 19 (8. Mai 2026) — v2.1.136

---

### [`settings.autoMode.hard_deny`: unconditional Block-Rules im Auto-Mode]
- **Was:** Neue Auto-Mode-Classifier-Rules, die matched Aktionen **unconditional** blockieren — unabhängig von User-Intent oder breiteren Allow-Exceptions.
- **Einsatz:** In `settings.json`: `"autoMode": { "hard_deny": ["Bash(rm -rf *)", "Bash(curl * | sh)"] }` für Aktionen, die niemals automatisch laufen dürfen.
- **Mehrwert:** Sicherheitsnetz im Auto-Mode für gefährliche Pattern (Datei-Löschungen, Pipe-to-Shell, Force-Push), die selbst bei `Bash(*)`-Allow nie ohne explizite Bestätigung laufen sollen.
- **Version:** v2.1.136

### [`CLAUDE_CODE_ENABLE_FEEDBACK_SURVEY_FOR_OTEL`: Session-Quality-Survey für Enterprises]
- **Was:** Neue Env-Var reaktiviert die Session-Quality-Survey speziell für Enterprises, die Antworten via OpenTelemetry erfassen.
- **Einsatz:** `export CLAUDE_CODE_ENABLE_FEEDBACK_SURVEY_FOR_OTEL=1` in der Enterprise-Shell-Config setzen
- **Mehrwert:** Org-weite Quality-Metrics über OTEL-Pipelines möglich, ohne dass die Survey für alle anderen Enterprise-Sessions stört.
- **Version:** v2.1.136

### [Plan Mode blockiert File-Writes auch bei matchender `Edit(...)`-Allow-Rule]
- **Was:** Im Plan-Mode wurden File-Writes nicht mehr geblockt, sobald eine matchende `Edit(...)`-Allow-Rule existierte — Bug behoben, Plan-Mode ist nun wieder strikt read-only.
- **Einsatz:** Automatisch aktiv im Plan-Mode
- **Mehrwert:** Planungs-Phase bleibt verlässlich nicht-destruktiv — Allow-Rules wirken erst wieder nach Plan-Approval, kein versehentliches In-Plan-Editing.
- **Version:** v2.1.136

### [MCP-Server in `.mcp.json`/Plugins/Connectors verschwinden nicht mehr nach `/clear`]
- **Was:** In VS-Code-Extension, JetBrains-Plugin und Agent-SDK verschwanden MCP-Server aus `.mcp.json`, Plugins und claude.ai-Connectors lautlos nach `/clear` — Bug behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** `/clear` zur Kontext-Bereinigung verliert keine MCP-Konfig mehr — keine erneute Re-Auth oder Reload-Tour nach jedem Clear.
- **Version:** v2.1.136
- **Plattform:** VS Code, JetBrains, Agent SDK

### [MCP-OAuth: Refresh-Tokens überleben paralleles Refresh mehrerer Server]
- **Was:** Bei mehreren remote MCP-Servern, die gleichzeitig refreshten, gingen Refresh-Tokens lautlos verloren — User mussten täglich re-authentifizieren. Race-Condition behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Wer mehrere remote MCP-Server (Linear, GitHub, Sentry, …) parallel nutzt, bleibt eingeloggt — kein tägliches OAuth-Karussell mehr.
- **Version:** v2.1.136

### [Login-Loop bei concurrent Credential-Write geschlossen]
- **Was:** Eine seltene Race-Condition konnte einen frisch rotierten OAuth-Token überschreiben und den User in eine Re-Login-Schleife zwingen — Bug behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabile Auth auch bei mehreren parallel gestarteten CLI-Instanzen (Tabs, Worktrees, Subagents) — kein „login → token weg → login"-Loop mehr.
- **Version:** v2.1.136

### [Extended Thinking + Redacted Block nach Tool-Call: kein 400-Error mehr]
- **Was:** Wenn Extended Thinking nach einem Tool-Call einen redacted Thinking-Block emittierte, brach die API mit 400 ab — gefixt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Long-running Sessions mit Thinking + Tool-Use (z.B. Agentic-Workflows) brechen nicht mehr unvermittelt ab, wenn ein Thinking-Block von der Safety-Schicht redacted wird.
- **Version:** v2.1.136

### [`--resume`/`--continue` findet Sessions auch in Pfaden mit Underscores]
- **Was:** `--resume` und `--continue` fanden Sessions nicht, wenn der Projekt-Pfad Underscores enthielt — Bug behoben.
- **Einsatz:** `claude --resume` / `claude --continue` aus einem `_underscore_named/`-Verzeichnis funktioniert wieder
- **Mehrwert:** Repo-Namen wie `my_project` oder `_internal_` blockieren nicht mehr stillschweigend die Session-Wiederherstellung.
- **Version:** v2.1.136

### [WSL2: Image-Paste aus Windows-Clipboard via PowerShell-Fallback]
- **Was:** Wenn `xclip`/`wl-paste` keine Bild-Daten lesen können (typisch WSL2), nutzt Claude Code jetzt einen PowerShell-Fallback, um Bilder direkt aus dem Windows-Clipboard zu pasten.
- **Einsatz:** Bild im Windows kopieren → in WSL2-CLI mit Strg+V einfügen — funktioniert auch ohne `xclip`
- **Mehrwert:** Screenshot-Workflows (Bug-Reports, UI-Reviews) laufen in WSL2 ohne Tool-Installation oder Speicher-und-attach-Umweg.
- **Version:** v2.1.136
- **Plattform:** WSL2

### [`/usage` Weekly-Reset zeigt Kalenderdatum statt Uhrzeit]
- **Was:** Der wöchentliche Reset-Indikator in `/usage` zeigte Uhrzeit statt Kalenderdatum — gefixt.
- **Einsatz:** Automatisch aktiv in `/usage`
- **Mehrwert:** Klar erkennbar, an welchem Tag das Quota zurückgesetzt wird — keine Verwechslung „heute 18:00" vs. „kommenden Montag".
- **Version:** v2.1.136

### [`AskUserQuestion` akzeptiert Multi-Select als Array]
- **Was:** `AskUserQuestion` verwarf Multi-Select-Antworten, wenn diese als Array übergeben wurden — Bug behoben.
- **Einsatz:** Automatisch aktiv im AskUserQuestion-Tool / Multi-Select
- **Mehrwert:** Skills und Plugins, die Mehrfach-Auswahlen erfragen, erhalten alle ausgewählten Optionen statt nur einer — keine stillen Datenverluste.
- **Version:** v2.1.136

### [`CLAUDE_ENV_FILE`-Vars bleiben nach `/resume`/`/clear` aktuell]
- **Was:** Env-Vars aus `CLAUDE_ENV_FILE`-SessionStart-Hooks wurden nach `/resume` oder `/clear` stale (alter Snapshot blieb hängen) — Bug behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Env-getriebene Workflows (rotierende API-Keys, Branch-spezifische Config) erhalten nach `/clear` immer den aktuellen Wert.
- **Version:** v2.1.136

### [Plugin `skills/`-Default-Verzeichnis nicht mehr von `skills`-Eintrag in `plugin.json` versteckt]
- **Was:** Ein `skills`-Eintrag in `plugin.json` versteckte das Default-Verzeichnis `skills/` des Plugins. Außerdem zeigt das Listen eines File-Pfads nun einen Error statt still zu scheitern.
- **Einsatz:** Automatisch aktiv beim Plugin-Loading
- **Mehrwert:** Plugin-Autoren verlieren keine Skills mehr durch versehentliche Override-Konfiguration — Fehler werden sichtbar statt schweigend geschluckt.
- **Version:** v2.1.136

### [`/insights`-Crash bei malformed Tool-Input behoben]
- **Was:** `/insights` crashte, wenn die Session-History Tool-Calls mit fehlerhaften `input`-Feldern enthielt — Bug behoben.
- **Einsatz:** Automatisch aktiv in `/insights`
- **Mehrwert:** Sessions mit experimentellen Tools oder MCP-Edge-Cases bleiben in `/insights` analysierbar — kein Crash mehr.
- **Version:** v2.1.136

### [Plugin-Marketplace: Removal-Key auf `d` geändert (war `r`)]
- **Was:** Der Hotkey zum Entfernen aus der Plugin-Marketplace-Liste wurde von `r` auf `d` umgestellt, weil `r` mit „Retry" an anderen Stellen kollidierte.
- **Einsatz:** In Plugin-Marketplace-Liste: `d` zum Entfernen, `r` für Retry
- **Mehrwert:** Konsistente Tastatur-Semantik plattformweit — kein versehentliches Löschen mehr beim Retry-Versuch.
- **Version:** v2.1.136

### [`CronList` Output: Qualifiers und Scheduled-Prompt sichtbar]
- **Was:** `CronList`-Output zeigte weder Qualifiers noch den geplanten Prompt an — beides ergänzt.
- **Einsatz:** Automatisch aktiv im `CronList`-Tool
- **Mehrwert:** Übersicht über geplante Cron-Jobs ist endlich vollständig — User sehen sofort, was wann mit welchem Prompt feuert.
- **Version:** v2.1.136

### [Bash-Permission-Prompts zeigen lesbare Erklärung statt Parser-Diagnostik]
- **Was:** Permission-Prompts für Bash-Commands zeigten interne Parser-Diagnostik-Strings — jetzt verständliche Erklärungen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** User verstehen, *warum* ein Command Permission braucht — schnellere informierte Allow/Deny-Entscheidung.
- **Version:** v2.1.136

### [`@`-File-Picker: Files mit >100 Einträgen + mid-session erstellt]
- **Was:** Zwei Bugs gefixt: `@`-File-Picker fand keine Files in Verzeichnissen mit mehr als 100 Einträgen, und mid-session erstellte Files in kleinen Non-Git-Dirs wurden nicht gematcht.
- **Einsatz:** Automatisch aktiv beim `@`-Tippen
- **Mehrwert:** Großes Repo-Listing oder gerade frisch erstellte Files sind sofort attachbar — kein Restart oder Workaround nötig.
- **Version:** v2.1.136

### [MCP-Tool-Results sichtbar bei Content-Blocks-Response]
- **Was:** MCP-Tool-Results waren unsichtbar, wenn der Server Content-Blocks zurückgab — Renderer zeigt sie jetzt wieder an.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** MCP-Server, die strukturierte Multi-Block-Responses liefern (Bilder + Text, mehrere Texte), zeigen ihre Daten endlich im UI.
- **Version:** v2.1.136

### [Plugin Slash-Commands mit Spaces resolvieren auf namespaced Form]
- **Was:** Plugin-Slash-Commands mit Spaces (z.B. `/myplugin review`) wurden nicht mehr auf die namespaced Form aufgelöst — Bug behoben.
- **Einsatz:** `/myplugin review` funktioniert wieder als Alias zu `/myplugin:review`
- **Mehrwert:** User-Aliase mit Leerzeichen funktionieren wie dokumentiert — kein Memorize von `:`-Syntax pro Plugin nötig.
- **Version:** v2.1.136

### [`/release-notes` lädt nach failed Changelog-Refresh wieder aktuelle Version]
- **Was:** `/release-notes` blieb nach einem fehlgeschlagenen Changelog-Refresh auf einer alten Version stehen — gefixt.
- **Einsatz:** Automatisch aktiv in `/release-notes`
- **Mehrwert:** Auch bei zwischenzeitlichen Netzwerk-Fehlern zeigt `/release-notes` nach dem nächsten Erfolg wieder die aktuelle Version.
- **Version:** v2.1.136

### [Plugin-Hooks `Stop`/`UserPromptSubmit`: kein Crash bei Cache-Cleanup]
- **Was:** Plugin-`Stop`- und `UserPromptSubmit`-Hooks scheiterten, wenn Cache-Cleanup eine Plugin-Version löschte, die noch von einer laufenden Session genutzt wurde — gefixt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Long-running Sessions parallel zu einem Plugin-Update überleben — keine sterbenden Hooks bei Hintergrund-Cleanup.
- **Version:** v2.1.136

### [Worktree-Exit-Dialog: korrekte Dir-Warnung nach Removal]
- **Was:** Nach einem Worktree-Removal warnte der Exit-Dialog vor uncommitted Files im **falschen** Verzeichnis — Pfad-Tracking gefixt.
- **Einsatz:** Automatisch aktiv beim Worktree-Exit
- **Mehrwert:** Keine Phantom-Warnungen mehr über Files in Pfaden, die gar nicht mehr existieren — User-Vertrauen in Worktree-Lifecycle bleibt erhalten.
- **Version:** v2.1.136

### [Diverse UI-Polish: Slash-Command-Dialoge, Markdown-Tabellen, Streaming]
- **Was:** Sammelfix für visuelle Konsistenz: Slash-Command-Dialoge erhalten standardisierte Footer-Hints, Dialog-Spacing und Arrow-Key-Styling; Dialog-Frame erscheint sofort beim Loading; Farben in Bash-Output und Markdown-Codeblocks an korrekter Position; ReasonML-Diffs ohne „undefined"-Artefakte; wide Markdown-Tables hinterlassen keinen stale Border-Render mehr; trailing Whitespace beim Streaming-Copy entfernt; CJK-Text in „Jump to bottom"-Overlay und Welcome-Banner fehlerfrei.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar ruhigeres UI vor allem in Fullscreen-Mode, bei CJK-Sprachen und langen Sessions mit vielen Slash-Commands.
- **Version:** v2.1.136

### [Tastatur & Keybindings-Fixes: Backspace-Swap, rebound Keys, Esc-Dismiss]
- **Was:** Sammelfix Tastatur: Backspace/Ctrl+Backspace nicht mehr getauscht nach Ctrl+G-External-Editor; Keyboard-Shortcut-Hints respektieren rebound Keys aus `keybindings.json`; Esc dismisst wieder Dialoge in `/install-github-app`, `/desktop`, `/resume`, `/web-setup`; Mid-input Slash-Command-Autocomplete funktioniert nach initialem Slash; Prompt-Suggestions werden nicht mehr von Enter auf leerem Input auto-submitted (Tab/Arrow erforderlich).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Tastatur-Verhalten wird wieder vorhersehbar — keine versehentlichen Submits, keine vertauschten Edit-Keys, eigene Bindings greifen überall.
- **Version:** v2.1.136

### [Settings & `/doctor`: Language-Persist + bessere MCP-Schema-Errors]
- **Was:** `/settings`-Sprachänderung bleibt auch nach Escape erhalten (statt Revert). `/doctor` nennt bei MCP-Schema-Errors das fehlende Feld und den Source-File-Pfad. `/terminal-setup` erscheint im Autocomplete auch bei Prefix-Match (statt nur bei Exact-Name).
- **Einsatz:** Automatisch aktiv in `/settings`, `/doctor`, `/terminal-setup`
- **Mehrwert:** Faster Diagnose bei MCP-Misconfig; Sprach-Auswahl ist verlässlich persistent; Discoverability für `/terminal-setup` verbessert.
- **Version:** v2.1.136

### [`/branch`, `/clear <name>`, IDE-Lock-Files: Edge-Case-Fixes]
- **Was:** `/branch` speichert keine Multi-Line-Session-Titles mehr aus Multi-Line-Pastes; `/clear <name>` labelt die gecleared Session korrekt für `/resume`; IDE-Shell-Integration-Lock-Files respektieren `CLAUDE_CONFIG_DIR`; „Chat about this" auf einem `AskUserQuestion`-Dialog löscht den Question-Text nicht mehr; Plugin-Uninstall/Enable/Disable matched Slugs case-insensitiv; Tool-Error-Truncation-Marker zeigt keine negative Count mehr bei Surrogate-Pair-Strings.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Diverse subtile Edge-Cases beseitigt — vor allem für Multi-Stack-Setups (Custom CLAUDE_CONFIG_DIR) und non-ASCII-Sessions.
- **Version:** v2.1.136

### [`/mcp`-Server-Liste scrollt + Improved `--worktree`-Collision-Error]
- **Was:** `/mcp`-Server-Liste scrollt jetzt, wenn mehr Server existieren als ins Terminal passen; `--worktree` zeigt bei Collision mit existierendem oder stale Worktree eine bessere Fehlermeldung statt cryptic Git-Output.
- **Einsatz:** Automatisch aktiv in `/mcp` und `--worktree`
- **Mehrwert:** Setups mit vielen MCP-Servern (Enterprise, Multi-Project) bleiben überschaubar; Worktree-Setup-Fehler sind sofort actionable.
- **Version:** v2.1.136

### Woche 19 (7. Mai 2026) — v2.1.133

---

### [`worktree.baseRef`-Setting: `fresh` (Default) vs. `head`]
- **Was:** Neues Setting steuert, ob `--worktree`, `EnterWorktree` und Agent-Isolation-Worktrees vom `origin/<default>` (Default `fresh`) oder vom lokalen `HEAD` abzweigen. **Wichtig:** Default-Änderung kehrt das `EnterWorktree`-Verhalten zurück auf `origin/<default>` (war seit 2.1.128 lokales `HEAD`).
- **Einsatz:** In `settings.json`: `"worktree": { "baseRef": "head" }` setzen, um unpushed Commits in neue Worktrees zu übernehmen
- **Mehrwert:** Wer auf einem Feature-Branch mit unpushed Commits einen Subagent-Worktree spawnt, verliert die lokalen Änderungen sonst lautlos — `head` bringt das alte Verhalten zurück, `fresh` ist sicherer für Fan-Out auf cleaner Base.
- **Version:** v2.1.133

### [Sandbox: `sandbox.bwrapPath` und `sandbox.socatPath`]
- **Was:** Neue Managed Settings (Linux/WSL) zur Angabe nicht-standard Pfade für `bwrap` (Bubblewrap) und `socat`-Binaries — z.B. wenn diese in privaten Mounts oder /opt liegen.
- **Einsatz:** In Managed Settings: `"sandbox": { "bwrapPath": "/opt/bin/bwrap", "socatPath": "/opt/bin/socat" }`
- **Mehrwert:** Locked-down Linux-Setups (Custom-PATH, NixOS, lokal kompilierte Builds) können Sandbox-Mode nutzen, ohne Symlinks oder PATH-Hacks im Wrapper-Skript.
- **Version:** v2.1.133

### [`parentSettingsBehavior` admin-Tier-Key (`first-wins` | `merge`)]
- **Was:** Neuer Admin-Tier-Settings-Key, der erlaubt, SDK `managedSettings` (Parent-Tier) in den Policy-Merge einzubeziehen statt sie strikt zu überschreiben.
- **Einsatz:** In Admin-Settings: `"parentSettingsBehavior": "merge"` opt-in für Kombination, `"first-wins"` für striktes Override (Default-Verhalten)
- **Mehrwert:** Enterprise-Setups mit mehrstufigen Policy-Layern (Org → Team → SDK) können jetzt feiner steuern, wie Parent-Settings auf nachgeordnete Tiers wirken.
- **Version:** v2.1.133

### [Hooks erhalten Effort-Level via `effort.level` und `$CLAUDE_EFFORT`]
- **Was:** Hooks bekommen das aktive Effort-Level neu im JSON-Input (`effort.level`) sowie als `$CLAUDE_EFFORT` Env-Var; Bash-Tool-Befehle können `$CLAUDE_EFFORT` ebenfalls auslesen.
- **Einsatz:** Im Hook-Skript `jq -r .effort.level` oder `$CLAUDE_EFFORT` lesen; im Bash-Tool-Befehl `$CLAUDE_EFFORT` referenzieren
- **Mehrwert:** Hooks und Bash-Skripte können auf Effort-Stufen reagieren — z.B. teure Tests nur bei `xhigh` ausführen, oder Telemetrie nach Effort labeln.
- **Version:** v2.1.133

### [Memory: Warm-Spare-Worker bei Memory-Pressure freigegeben]
- **Was:** Im Hintergrund vorgehaltene Spare-Worker werden jetzt unter Memory-Pressure aktiv freigegeben — der Memory-Footprint sinkt bei langen Sessions.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Long-running Sessions (Stunden-Workflows, Loop-Tasks) bleiben auf Geräten mit knappem RAM stabil, ohne dass der CLI swappt oder OOM-killed wird.
- **Version:** v2.1.133

### [Improved Focus Mode]
- **Was:** Verbessertes Verhalten im Focus Mode (Detail-Bugfixes/UX-Polish im Fokus-UI).
- **Einsatz:** Automatisch aktiv beim Aktivieren von Focus Mode
- **Mehrwert:** Glättere Fokus-Sessions ohne UI-Holpern.
- **Version:** v2.1.133

### [Parallel-Sessions: kein 401-Dead-End mehr nach Token-Refresh]
- **Was:** Race-Condition beim Token-Refresh konnte alle parallelen Sessions gleichzeitig auf 401 (Unauthorized) festfahren, weil shared Credentials überschrieben wurden — Bug behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Mehrere parallele `claude`-CLIs (Tabs, Worktrees, Agents) bleiben gemeinsam authentifiziert — kein Mass-Logout mehr nach abgelaufenem Token.
- **Version:** v2.1.133

### [`Edit`/`Write`-Allow-Rules: Drive-Root-Matching repariert]
- **Was:** Allow-Rules wie `Edit(C:\)` oder POSIX `Edit(/)` haben fälschlich nicht gegriffen und immer den Permission-Prompt ausgelöst — jetzt korrektes Matching.
- **Einsatz:** Automatisch aktiv für bestehende Drive-Root-Rules
- **Mehrwert:** Wer einen kompletten Drive oder Root als erlaubt deklariert hat, wird nicht mehr unnötig befragt — Rule-Definition wirkt wie dokumentiert.
- **Version:** v2.1.133
- **Plattform:** Windows + POSIX

### [Unhandled-Rejection `ECOMPROMISED` bei File-Lock-Skew gefixt]
- **Was:** Bei kompromittiertem History-/Session-Log-File-Lock (durch Clock Skew oder langsame Disk) crashte der Prozess mit unhandled `ECOMPROMISED`-Rejection — jetzt sauber abgefangen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sessions auf NFS, gemounteten Cloud-Drives oder VMs mit driftender Uhr crashen nicht mehr mid-session — wichtig für Remote-Workflows.
- **Version:** v2.1.133

### [Esc während Compaction: kein spurious Error mehr]
- **Was:** Esc-Drücken während der Konversations-Compaction zeigte fälschlich „Error compacting conversation" — Fehlanzeige korrigiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Compaction-Abbruch ist nun sauber (User-Wunsch, kein vermeintlicher Fehler) — keine unnötige Verwirrung in Logs/Telemetrie.
- **Version:** v2.1.133

### [`HTTP(S)_PROXY`/`NO_PROXY`/mTLS für vollen MCP-OAuth-Flow]
- **Was:** Proxy-Env-Vars und mTLS wurden nur für Teile des MCP-OAuth-Flows respektiert. Jetzt auch bei Discovery, Dynamic Client Registration, Token Exchange und Token Refresh.
- **Einsatz:** Automatisch aktiv mit gesetzten `HTTP_PROXY` / `HTTPS_PROXY` / `NO_PROXY` und mTLS-Config
- **Mehrwert:** Enterprise-Netzwerke mit Proxy-Pflicht oder Client-Cert-Auth können MCP-Server mit OAuth jetzt vollständig nutzen — kein partieller Failure mehr beim Re-Auth.
- **Version:** v2.1.133

### [Read/Write/Edit auf Mapped Network Drives via `--add-dir`]
- **Was:** Mapped Network Drives (Windows) und gleichwertige Mounts, die via `--add-dir`/SDK `additionalDirectories` reingegeben wurden, wurden trotz Allow-Liste verweigert — Bug behoben.
- **Einsatz:** `claude --add-dir Z:\shared\repo` (Mapped Drive) funktioniert jetzt
- **Mehrwert:** Code auf Netzwerk-Shares (NAS, Corporate File-Server) ist editierbar wie lokale Pfade — kein Workaround mit `mklink` oder Symlinks mehr nötig.
- **Version:** v2.1.133

### [Remote Control: Stop/Interrupt von claude.ai cancelt CLI-Session vollständig]
- **Was:** Stop/Interrupt aus claude.ai stoppte den CLI nicht so vollständig wie lokales Esc — Queued-Messages liefen nach Tool-/Prompt-Interrupt nicht weiter.
- **Einsatz:** Automatisch aktiv mit `--remote-control`
- **Mehrwert:** Remote-Stop ist jetzt äquivalent zu lokalem Esc — wichtig für Remote-Sessions und Teams, die Web-UI als Steuerungs-Frontend nutzen.
- **Version:** v2.1.133

### [`/effort` ist nun strikt session-lokal]
- **Was:** `/effort` in einer Session änderte unbeabsichtigt das Effort-Level anderer paralleler Sessions; zudem konnte ein IDE-getriggerter Effort-Change still gedroppt werden — beide Bugs behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Mehrere parallele Sessions können unterschiedliche Effort-Levels fahren, ohne sich gegenseitig zu beeinflussen — IDE-Effort-Slider ist verlässlich.
- **Version:** v2.1.133

### [Subagents finden Project/User/Plugin-Skills via Skill-Tool]
- **Was:** Subagents konnten Project-, User- und Plugin-Skills nicht mehr über das Skill-Tool entdecken — Bug behoben.
- **Einsatz:** Automatisch aktiv für alle dispatched Subagents
- **Mehrwert:** Skill-Pipelines (Brainstorming → TDD → Code-Review usw.) funktionieren auch innerhalb von Subagent-Tasks wieder — keine Skill-Lücke beim Delegieren mehr.
- **Version:** v2.1.133

### [`claude --help` listet `--remote-control`]
- **Was:** `--remote-control` (allein) wird nun zusammen mit `--remote-control-session-name-prefix` in der Hilfe-Ausgabe gezeigt — vorher war es nur via Doku auffindbar.
- **Einsatz:** `claude --help`
- **Mehrwert:** Discoverability für Remote-Control-Workflow verbessert — neue User finden den Flag direkt im Help-Output.
- **Version:** v2.1.133

### [VS Code: `claudeProcessWrapper` ohne „Unsupported platform"-Fehler]
- **Was:** Die Settings-Option `claudeCode.claudeProcessWrapper` schlug mit „Unsupported platform" fehl, wenn der Extension-Build kein Claude-Binary mitbringt — behoben.
- **Einsatz:** Automatisch aktiv in der VS-Code-Extension
- **Mehrwert:** Custom-Wrapper-Skripte (z.B. firejail, doas, Audit-Logger) lassen sich auch in Extension-Builds ohne gebundeltes Binary nutzen.
- **Version:** v2.1.133

---

### Plattform-Ankündigungen (6.–7. Mai 2026)

---

### [Claude in Microsoft 365: Excel, PowerPoint, Word, Outlook]
- **Was:** Claude landet als Sidebar in Excel, PowerPoint und Word (GA) sowie Outlook (Public Beta). Eine Konversation trägt Kontext über alle vier Apps hinweg — Änderungen in einer App propagieren in verbundene Inhalte. Outlook-Spezifika: Inbox-Triage, Draft-Replies mit vorbefüllten Empfängern/Betreff sowie Kalender-Invites mit Verfügbarkeitscheck.
- **Einsatz:** Über Microsoft AppSource installieren (separate Listings für Office-Suite und Outlook); IT-Admins können OpenTelemetry-Monitoring und Usage-Analytics pro User/App/Datum konfigurieren
- **Mehrwert:** Email-Drafts in der eigenen Stimme, Excel-Finanzmodelle und PowerPoint-Decks ohne Tool-Switch — Claude Code-Nutzer können Artefakte aus dem Editor jetzt nahtlos in Office-Workflows einspielen, statt Copy-Paste-Brücken zu bauen.
- **Version:** Ankündigung 2026-05-07 (alle Paid Plans, Mac & Windows)

### [Managed Agents: Dreaming (Research Preview)]
- **Was:** Geplanter Hintergrundprozess, der Agent-Sessions analysiert, Patterns extrahiert und Memories kuratiert. Du entscheidest, ob Dreaming Memory automatisch updatet oder Review verlangt — gedacht für lang laufende Agents, um wiederkehrende Fehler und Team-Präferenzen zu erfassen.
- **Einsatz:** Research-Preview-Zugang über Claude Platform anfordern; Dreaming-Schedule und Review-Modus in der Agent-Konfiguration setzen
- **Mehrwert:** Managed Agents lernen jetzt zwischen Sessions ohne externen Retrieval-Layer — derselbe Fehler taucht nicht mehrmals auf, Team-Konventionen setzen sich durch.
- **Version:** Ankündigung 2026-05-06 (Research Preview)

### [Managed Agents: Outcomes (Public Beta)]
- **Was:** Entwickler definieren Erfolgskriterien als Rubric — ein separater Grader bewertet Outputs gegen diese Standards. Bei Unterschreitung pinpointet der Grader, was sich ändern muss, und der Agent macht einen weiteren Pass. Anthropic-Tests zeigen +8.4 Punkte bei docx- und +10.1 Punkte bei PowerPoint-Generierung.
- **Einsatz:** Outcomes-Rubric in der Managed-Agent-Konfiguration deklarieren (Public Beta auf Claude Platform)
- **Mehrwert:** Aufgaben mit Detail-Anspruch, Vollständigkeit oder subjektiver Qualität (Brand Voice, Design-Guidelines) werden iterativ verbessert — Quality Gate eingebaut, statt manuelle Review nach jedem Run.
- **Version:** Ankündigung 2026-05-06 (Public Beta)

### [Managed Agents: Multiagent Orchestration (Public Beta)]
- **Was:** Ein Lead-Agent zerlegt komplexe Arbeit in Stücke und delegiert an Spezialisten mit unterschiedlichen Modellen, Prompts und Tools. Spezialisten arbeiten parallel auf einem geteilten Filesystem, der Lead behält den vollen Kontext.
- **Einsatz:** Multiagent-Setup in der Managed-Agent-Konfiguration definieren (Lead + Spezialisten); Public Beta auf Claude Platform
- **Mehrwert:** Komplexe Investigations werden parallelisiert — ein Agent verarbeitet Deploy-History während andere Logs, Metrics und Support-Tickets parallel auswerten. Spürbarer Speed-Up bei Multi-Source-Recherchen ohne manuelles Fan-Out.
- **Version:** Ankündigung 2026-05-06 (Public Beta)

---

### Woche 19 (6. Mai 2026) — v2.1.132

---

### [`CLAUDE_CODE_SESSION_ID` in der Bash-Subprozess-Umgebung]
- **Was:** Der Bash-Tool-Subprozess erhält die Env-Var `CLAUDE_CODE_SESSION_ID` mit derselben ID, die auch an Hooks weitergereicht wird.
- **Einsatz:** Im Shell-Skript `$CLAUDE_CODE_SESSION_ID` lesen, um Telemetrie/Logging mit der Session zu korrelieren
- **Mehrwert:** Bash-Tools, Hooks und Subprozesse teilen jetzt eine gemeinsame Session-ID — ideal für Trace-Korrelation, Audit-Logs und Side-Effect-Tracking pro Session.
- **Version:** v2.1.132

### [`CLAUDE_CODE_DISABLE_ALTERNATE_SCREEN=1` deaktiviert Fullscreen-Renderer]
- **Was:** Neue Env-Var, die den Fullscreen-Alternate-Screen-Renderer ausschaltet — die Konversation bleibt im nativen Terminal-Scrollback.
- **Einsatz:** `CLAUDE_CODE_DISABLE_ALTERNATE_SCREEN=1 claude`
- **Mehrwert:** Wer das History-Scrollback des Terminals (tmux, VS Code, Cmd+F) nutzen will, behält sie — Opt-Out aus dem Fullscreen-UI ohne Workarounds.
- **Version:** v2.1.132

### [„Pasting…"-Footer-Hint während Image-Paste]
- **Was:** Beim Einfügen eines Bildes via Ctrl+V zeigt der Footer „Pasting…", solange der Inhalt aus dem Clipboard gelesen wird.
- **Einsatz:** Automatisch aktiv beim Image-Paste
- **Mehrwert:** Klares Visual-Feedback, dass die Paste-Operation läuft — kein „nichts passiert"-Eindruck bei großen Screenshots.
- **Version:** v2.1.132

### [SIGINT von außen löst Graceful Shutdown aus]
- **Was:** Externes SIGINT (z.B. via IDE-Stop-Button oder `kill -INT`) führte zu abruptem Exit. Jetzt werden Terminal-Modi restored und der `--resume`-Hint angezeigt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sauberes Beenden auch via IDE/Skript — kein kaputter Terminal-State (versteckter Cursor, Mausmodus) mehr nach Stop.
- **Version:** v2.1.132

### [Native-Build: kein Crash mehr bei SSH-Disconnect mid-session]
- **Was:** Im nativen Binary löste das Schließen des Terminals oder ein SSH-Drop mid-session eine uncaught Exception aus — jetzt wird der Fall sauber abgefangen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Remote-Sessions per SSH überleben Netzwerk-Hänger und Disconnects ohne Crash-Trace im Log.
- **Version:** v2.1.132

### [`--resume` repariert kaputte Emoji-Surrogate]
- **Was:** `--resume` schlug mit `no low surrogate in string` fehl, wenn ein Tool-Error-Truncate ein Emoji geteilt hatte. Bestehende beschädigte Sessions werden beim Laden saniert.
- **Einsatz:** Automatisch aktiv beim `claude --resume`
- **Mehrwert:** Sessions mit Emoji-haltigen Tool-Errors lassen sich wieder fortsetzen — kein manuelles JSON-Patchen mehr nötig.
- **Version:** v2.1.132

### [`--permission-mode` greift auch beim Resume in Plan-Mode]
- **Was:** Der `--permission-mode`-Flag wurde bei `-p --continue`/`--resume` einer Plan-Mode-Session ignoriert; zudem wurde Plan-Mode nach `ExitPlanMode` nicht wieder aktiviert.
- **Einsatz:** `claude -p --continue --permission-mode plan` funktioniert jetzt korrekt
- **Mehrwert:** Skriptbarer Plan-Mode-Workflow funktioniert verlässlich — wichtig für CI-Pipelines mit mehrstufigen Plan/Execute-Flows.
- **Version:** v2.1.132

### [Fullscreen: kein Blank-Screen nach Sleep/Wake oder Ctrl+Z]
- **Was:** Nach Laptop-Sleep/Wake oder Ctrl+Z/`fg` blieb der Fullscreen-Modus blank, bis der nächste Tastendruck oder Stream-Output kam — Bug behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sofortiges Repaint nach Wake/Resume — keine „toten" Sessions mehr nach Suspend.
- **Version:** v2.1.132

### [Cursor-Position: korrekt bei ZWJ-Emoji und Indic-Conjuncts]
- **Was:** Ctrl+E/A/K/U und Pfeiltasten ließen den Cursor mitten in einem Grapheme landen, wenn ein Indic-Conjunct oder ZWJ-Emoji über einen Zeilenumbruch ging — jetzt korrekte Grapheme-Awareness.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Editing in Prompts mit Family-Emoji oder Devanagari ist wieder zuverlässig — keine kaputten Zeichen mehr.
- **Version:** v2.1.132

### [Vim-Mode: NFD-Akzente bleiben intakt]
- **Was:** Vim-Operatoren (`d`, `y`, `c`) haben Text mit decomposed (NFD) akzentuierten Zeichen korrumpiert — Bug behoben.
- **Einsatz:** Automatisch aktiv mit `editorMode: vim`
- **Mehrwert:** Vim-Editing in mehrsprachigen Prompts (z.B. macOS-NFD-Pasten) ist verlustfrei.
- **Version:** v2.1.132

### [Paste mit führendem `/` wird nicht mehr verschluckt]
- **Was:** Pasting eines Strings, der mit `/` beginnt, schluckte den Input still oder löste einen Unknown-Command-Reply aus — Eingabe wird jetzt korrekt als Prompt-Text behandelt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Code-Snippets oder Pfade beginnend mit `/` lassen sich problemlos einfügen — keine versehentlichen Slash-Command-Trigger.
- **Version:** v2.1.132

### [Bracketed-Paste: keine Stray-Escape-Sequences mehr]
- **Was:** Wenn Focus-Events oder Mouse-Tracking-Reports mit einem Paste interleaved waren, landeten Escape-Codes wörtlich im Prompt — jetzt korrekt geparsed.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Saubere Pastes auch in Terminals mit aktivem Focus-/Mouse-Reporting (iTerm2, kitty, Wezterm).
- **Version:** v2.1.132

### [Mouse-Wheel-Scroll in Cursor und VS Code (1.92–1.104) korrekt]
- **Was:** Scrollen mit dem Mausrad war in Cursor und VS Code 1.92–1.104 viel zu schnell (Upstream-Bug in xterm.js) — Workaround eingebaut.
- **Einsatz:** Automatisch aktiv im integrierten Terminal von Cursor/VS Code
- **Mehrwert:** Scroll-Velocity passt wieder zum nativen Terminal — kein Überschießen mehr durch lange Konversationen.
- **Version:** v2.1.132

### [JetBrains 2025.2: Scroll-Wheel ohne Pfeiltasten-Glitches]
- **Was:** In JetBrains-IDE-Terminals (2025.2) löste das Scrollrad falsche Pfeiltasten, falsch-gerichtete Events und Runaway-Acceleration aus — alle drei behoben.
- **Einsatz:** Automatisch aktiv im JetBrains-Terminal-Emulator
- **Mehrwert:** Claude Code in IntelliJ/PyCharm/WebStorm ist wieder flüssig nutzbar — Scroll-Verhalten matched native Terminals.
- **Version:** v2.1.132

### [`/usage` Ctrl+S: kein Hang mehr beim Clipboard-Copy unter Linux/X11]
- **Was:** Ctrl+S in `/usage` (Stats-Screenshot in die Zwischenablage kopieren) hing unter Linux/X11 — Bug behoben.
- **Einsatz:** `/usage` öffnen, Ctrl+S
- **Mehrwert:** Schneller Stats-Share via Screenshot funktioniert auf X11 wieder ohne Hänger oder Force-Kill.
- **Version:** v2.1.132

### [`/terminal-setup` zeigt korrekten Status in Windows Terminal]
- **Was:** `/terminal-setup` warf in Windows Terminal eine widersprüchliche Fehlermeldung — dabei wird Shift+Enter dort nativ unterstützt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Windows-Nutzer auf nativem Terminal werden nicht mehr verwirrt — keine fehlleitenden Setup-Hinweise.
- **Version:** v2.1.132

### [`/effort`-Picker respektiert `CLAUDE_CODE_EFFORT_LEVEL`]
- **Was:** Die Env-Var `CLAUDE_CODE_EFFORT_LEVEL` wurde im `/effort`-Picker nicht reflektiert — der angezeigte Default war falsch.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Env-basierte Effort-Default-Konfiguration (z.B. in Shell-Profil oder Direnv) wird sichtbar bestätigt.
- **Version:** v2.1.132

### [`/status` zeigt korrektes Default-Modell]
- **Was:** Für manche User zeigte `/status` ein falsches Default-Modell — Bug behoben.
- **Einsatz:** `/status`
- **Mehrwert:** Verlässliche Anzeige des aktiv genutzten Modells — wichtig zur schnellen Verifikation in Multi-Account-/Multi-Subscription-Setups.
- **Version:** v2.1.132

### [Slash-Command-Autocomplete: Liste skaliert mit Terminal-Höhe]
- **Was:** Das Slash-Command-Autocomplete-Popup war fälschlich auf ~3–5 sichtbare Einträge gedeckelt — jetzt skaliert es mit der verfügbaren Terminal-Höhe.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Bei großen Terminals werden mehr Commands gleichzeitig sichtbar — schneller Wechsel zwischen seltener genutzten Slash-Commands.
- **Version:** v2.1.132

### [Statusline: `context_window` zeigt aktuelle Auslastung]
- **Was:** Der Statusline-Token-Counter `context_window` zeigte kumulative Session-Totals statt der aktuellen Kontext-Auslastung — Bug behoben.
- **Einsatz:** Automatisch aktiv (in Custom-Statuslines, die `context_window` nutzen)
- **Mehrwert:** Statusline zeigt wieder den realen Füllstand des aktuellen Kontextfensters — wichtige Entscheidungsgrundlage für `/compact` und `/clear`.
- **Version:** v2.1.132

### [macOS Alt+T (Thinking-Toggle) ohne „Option as Meta"]
- **Was:** Alt+T für den Thinking-Toggle funktionierte auf macOS-Terminals ohne aktiviertes „Option as Meta" (iTerm2-/Terminal.app-Defaults) nicht — Bug behoben.
- **Einsatz:** Alt+T in Default-iTerm2/Terminal.app
- **Mehrwert:** Thinking-Toggle ohne erst die Terminal-Settings ändern zu müssen — Out-of-the-box-funktional auf jedem Mac.
- **Version:** v2.1.132

### [Windows: Tastatur reagiert nach Wiedereröffnen aus `claude agents`]
- **Was:** Unter Windows war die Tastatureingabe tot, nachdem eine Background-Session über `claude agents` wieder aufgerufen wurde — Bug behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Windows-Nutzer von `claude agents` (Background-Sessions) verlieren beim Resume keine Eingabe mehr — kein Force-Restart nötig.
- **Version:** v2.1.132

### [Stdio-MCP: kein Memory-Leak (10 GB+ RSS) mehr bei Non-Protocol-Stdout]
- **Was:** Wenn ein Stdio-MCP-Server Non-Protocol-Daten auf stdout schrieb, wuchs der Speicherverbrauch unbegrenzt (10 GB+ RSS) — jetzt gedeckelt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Buggy oder verbose MCP-Server killen die Session nicht mehr per OOM — robuster Default für unbekannte Server.
- **Version:** v2.1.132

### [MCP `tools/list`-Fehler: Retry und sichtbarer Status]
- **Was:** MCP-Server, die zwar verbunden, aber bei `tools/list` still mit 0 Tools fehlschlugen, werden jetzt einmal retried und in `/mcp` als „connected · tools fetch failed" markiert.
- **Einsatz:** `/mcp` öffnen — Status der Server prüfen
- **Mehrwert:** Sichtbarkeit für eine häufige Failure-Mode — Server-Probleme sind sofort diagnostizierbar statt wie „erfolgreich verbunden" zu wirken.
- **Version:** v2.1.132

### [Unautorisierte claude.ai MCP-Connectors zeigen `needs auth`]
- **Was:** Unautorisierte claude.ai-MCP-Connectors wurden als „failed" angezeigt statt als „needs auth"; zudem retried der Headless-Mode (`-p`) nicht-transient 4xx-Fehler unnötig.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Klare Unterscheidung Auth-Issue vs. echter Fehler — und Headless-Pipelines sparen Retries auf permanente 4xx.
- **Version:** v2.1.132

### [Slash-Command-Dialogs: konsistentere Optik]
- **Was:** `/login`, `/upgrade`, `/extra-usage` und weitere Slash-Command-Dialoge wurden im Spacing/Style harmonisiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Polishing der Dialog-UX — weniger visuelle Inkonsistenzen zwischen ähnlichen Modalen.
- **Version:** v2.1.132

### [`/tui fullscreen`-Banner beschreibt zusätzliche Vorteile]
- **Was:** Das Startup-Banner für den Fullscreen-Renderer (`/tui fullscreen`) listet jetzt explizit niedrigeren Speicherverbrauch, Mausunterstützung und Auto-Copy-on-Select als Vorteile.
- **Einsatz:** Beim Start im Fullscreen-Modus sichtbar
- **Mehrwert:** Bessere Onboarding-Information — User wissen vorab, was Fullscreen ihnen bietet, statt es selbst entdecken zu müssen.
- **Version:** v2.1.132

### [Bedrock/Vertex: kein 400-Fehler mehr mit `ENABLE_PROMPT_CACHING_1H`]
- **Was:** Mit `ENABLE_PROMPT_CACHING_1H=1` warfen Bedrock und Vertex 400er-Fehler — der 1h-Prompt-Cache wird jetzt korrekt formatiert.
- **Einsatz:** `ENABLE_PROMPT_CACHING_1H=1` mit Bedrock/Vertex-Setup
- **Mehrwert:** Enterprise-Setups auf AWS/GCP profitieren wieder vom 1-Stunden-Cache — ergänzt den TTL-Fix aus v2.1.129 für die Cloud-Gateways.
- **Version:** v2.1.132

---

### Woche 19 (6. Mai 2026) — v2.1.131

---

### [VS Code Extension: Aktivierung unter Windows wieder funktional]
- **Was:** Die VS Code Extension scheiterte unter Windows beim Aktivieren wegen eines hardcodierten Build-Pfads im gebündelten SDK (`createRequire`-Polyfill-Bug). Fix korrigiert die Pfad-Auflösung.
- **Einsatz:** Automatisch aktiv nach Update auf v2.1.131
- **Mehrwert:** Windows-VS-Code-Nutzer können die Extension wieder ohne Workaround verwenden — die Regression hat seit Erscheinen den IDE-Workflow blockiert.
- **Version:** v2.1.131

### [Mantle-Endpoint: `x-api-key`-Header wird wieder gesendet]
- **Was:** Die Authentifizierung gegen Mantle-Endpoints schlug fehl, weil der `x-api-key`-Header nicht gesetzt wurde. Header wird jetzt korrekt mitgegeben.
- **Einsatz:** Automatisch aktiv für Setups, die den Mantle-Endpoint nutzen
- **Mehrwert:** Enterprise-Setups mit Mantle als Inference-Gateway können wieder authentifizieren — vorher kompletter Auth-Block.
- **Version:** v2.1.131

---

### Woche 19 (6. Mai 2026) — v2.1.129

---

### [`--plugin-url` lädt Plugin-`.zip` direkt von URL]
- **Was:** Neuer CLI-Flag `--plugin-url <url>` zieht ein Plugin-`.zip`-Archiv von einer URL und lädt es für die aktuelle Session.
- **Einsatz:** `claude --plugin-url https://example.com/my-plugin.zip`
- **Mehrwert:** Plugin-Distribution direkt von Release-Pages oder CI-Artefakten — kein vorheriger Download oder Entpacken nötig. Ergänzt das in v2.1.128 hinzugekommene `--plugin-dir` für lokale `.zip`s.
- **Version:** v2.1.129

### [`CLAUDE_CODE_FORCE_SYNC_OUTPUT` für synchronisierte Terminal-Ausgabe]
- **Was:** Neue Env-Var `CLAUDE_CODE_FORCE_SYNC_OUTPUT=1` erzwingt synchronisierte Ausgabe in Terminals, die die Auto-Detection nicht erkennt (z.B. Emacs `eat`).
- **Einsatz:** `CLAUDE_CODE_FORCE_SYNC_OUTPUT=1 claude`
- **Mehrwert:** Beendet Render-Flicker und zerrissene Frames in exotischen Terminals — Workaround ohne Patch der Auto-Detection.
- **Version:** v2.1.129

### [`CLAUDE_CODE_PACKAGE_MANAGER_AUTO_UPDATE` für Homebrew/WinGet]
- **Was:** Wenn gesetzt, läuft das Upgrade-Kommando bei Homebrew- oder WinGet-Installationen im Hintergrund und Claude Code fragt nach einem Restart.
- **Einsatz:** `CLAUDE_CODE_PACKAGE_MANAGER_AUTO_UPDATE=1` in der Shell-Config setzen
- **Mehrwert:** Brew/WinGet-Nutzer bekommen ohne manuellen `brew upgrade` automatisch die neuesten Versionen — gleiche Update-Disziplin wie native Binaries.
- **Version:** v2.1.129

### [Plugin-Manifest: `themes` und `monitors` unter `experimental`]
- **Was:** Im Plugin-Manifest gehören `themes` und `monitors` jetzt unter den Block `"experimental": { ... }`. Top-Level-Deklarationen funktionieren weiter, aber `claude plugin validate` warnt.
- **Einsatz:** `themes`/`monitors` im Manifest in den `experimental`-Block verschieben
- **Mehrwert:** Klare API-Stabilitätsmarkierung — Plugin-Autoren wissen jetzt, welche Plugin-Features stabil und welche experimentell sind.
- **Version:** v2.1.129

### [Gateway `/v1/models`-Discovery wieder Opt-In]
- **Was:** Die Modell-Discovery via Gateway `/v1/models` für den `/model`-Picker ist jetzt opt-in via `CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY=1` (war in v2.1.126–v2.1.128 automatisch).
- **Einsatz:** `CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY=1` setzen, wenn Gateway-Modelle im Picker erscheinen sollen
- **Mehrwert:** Reduziert Startup-Latenz und unnötige Gateway-Calls für User, die keine Custom-Models nutzen — die Discovery war für Standard-Setups Overhead.
- **Version:** v2.1.129

### [Ctrl+R History-Picker: Default wieder „alle Prompts"]
- **Was:** Der Ctrl+R-History-Picker durchsucht standardmäßig wieder alle Prompts über alle Projekte hinweg (Verhalten vor v2.1.124). Ctrl+S grenzt jetzt auf aktuelles Projekt/Session ein.
- **Einsatz:** Ctrl+R für globale History; Ctrl+S innerhalb der History-Liste zum Filtern
- **Mehrwert:** Behebt eine Regression — viele Nutzer suchen Prompts, die sie vor Wochen in einem anderen Projekt benutzt haben. Default-Verhalten wieder restored.
- **Version:** v2.1.129

### [Spinner-Tipps für Third-Party-Deployments unterdrückt]
- **Was:** Bedrock-, Vertex-, Foundry- und `ANTHROPIC_BASE_URL`-Gateway-Deployments sehen keine Spinner-Tipps mehr, die auf First-Party-Anthropic-Surfaces zeigen.
- **Einsatz:** Automatisch aktiv bei Third-Party-Endpoints
- **Mehrwert:** Saubere UX in Enterprise-Setups — kein Verweis mehr auf Features, die im jeweiligen Deployment gar nicht verfügbar sind.
- **Version:** v2.1.129

### [`skillOverrides` ausgewertet: `off`, `user-invocable-only`, `name-only`]
- **Was:** Das `skillOverrides`-Setting funktioniert jetzt: `off` versteckt eine Skill vor Modell und `/`, `user-invocable-only` versteckt sie vor dem Modell, `name-only` zeigt nur den Namen ohne Description.
- **Einsatz:** `"skillOverrides": { "<skill>": "off" \| "user-invocable-only" \| "name-only" }` in `settings.json`
- **Mehrwert:** Granulare Skill-Sichtbarkeit — Skill-Listen lassen sich für Modell-Kontext schlanker halten, ohne Skills zu deinstallieren.
- **Version:** v2.1.129

### [OTel: `claude_code.pull_request.count` zählt MCP-PRs]
- **Was:** Die OTel-Metrik `claude_code.pull_request.count` zählt jetzt auch via MCP-Tools erstellte PRs/MRs, nicht nur per Shell-Kommando angelegte.
- **Einsatz:** Automatisch aktiv bei OTel-Instrumentierung
- **Mehrwert:** Saubere PR-Statistiken in Dashboards — viele Teams nutzen MCP-Server (GitHub-MCP, GitLab-MCP) für PR-Erstellung, die vorher unsichtbar waren.
- **Version:** v2.1.129

### [Policy-Refusals: API Request ID in der Fehlermeldung]
- **Was:** Bei Policy-Refusals zeigt die Fehlermeldung jetzt die API Request ID — nützlich für Support-Tickets und Debugging.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schnellere Eskalation an Anthropic-Support — kein Suchen mehr in Logs, Request-ID ist direkt im UI sichtbar.
- **Version:** v2.1.129

### [API: 400er mit unbekanntem Status-Code zeigen Klartext-Fehler]
- **Was:** API-Fehler mit unbekanntem 400-Status zeigten vorher rohes JSON; jetzt wird die zugrundeliegende Fehlermeldung extrahiert und angezeigt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verständlichere Fehler bei Edge-Cases — kein JSON-Decoden mehr per Hand für seltene Fehlertypen.
- **Version:** v2.1.129

### [`/clear` setzt Terminal-Tab-Titel zurück]
- **Was:** `/clear` setzt jetzt nach dem Kontext-Reset auch den Terminal-Tab-Titel zurück.
- **Einsatz:** `/clear`
- **Mehrwert:** Kein „Geistertitel" der vorherigen Session — Tab-Titel matched wieder den aktuellen Konversations-Stand.
- **Version:** v2.1.129

### [`/rename`-Session-Chip bleibt während Dialogs sichtbar]
- **Was:** Der Session-Title-Chip aus `/rename` verschwindet nicht mehr, wenn ein Permission- oder anderer Dialog aktiv ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Visueller Anker für die Session bleibt erhalten — gerade bei langen Permission-Flows verliert man nicht die Übersicht über den Session-Kontext.
- **Version:** v2.1.129

### [Agent-Panel sichtbar trotz laufender Subagenten]
- **Was:** Das Agent-Panel unter dem Prompt verschwand seit v2.1.122 fälschlich, wenn Subagenten liefen — jetzt bleibt es sichtbar.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Subagent-Status (Spawning, Running, Done) wieder permanent im Blickfeld — Regression behoben.
- **Version:** v2.1.129

### [Ctrl+G External-Editor verliert keine History mehr]
- **Was:** Der External-Editor-Handoff (Ctrl+G) blankte vorher die Konversations-History oberhalb des Prompts — Bug behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Editor-Power-User können Prompts in $EDITOR schreiben, ohne den sichtbaren Verlauf zu verlieren.
- **Version:** v2.1.129

### [`/context` dumpt ASCII-Visualisierung nicht mehr in Konversation]
- **Was:** `/context` schrieb seine gerenderte ASCII-Visualisierungs-Grid in die Konversation und verbrannte ~1.6k Tokens pro Aufruf — jetzt wird sie nur noch dargestellt, nicht in den Kontext geschrieben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** `/context` ohne versteckte Token-Kosten — bei häufiger Nutzung in langen Sessions spart das tausende Tokens.
- **Version:** v2.1.129

### [`/agents`-Library: Pfeil-Navigation hält Highlight sichtbar]
- **Was:** In der `/agents`-Library bleibt der hervorgehobene Agent jetzt sichtbar, wenn die Liste größer als der Viewport ist (Pfeiltasten scrollen automatisch).
- **Einsatz:** Automatisch aktiv beim `/agents`-Picker
- **Mehrwert:** Smoothes Scrolling durch große Agent-Listen — kein „verlorener Cursor" außerhalb des sichtbaren Bereichs.
- **Version:** v2.1.129

### [`/branch`-Erfolg enthält neue Session-ID für `/resume`]
- **Was:** Die Erfolgsmeldung von `/branch` enthält jetzt die Session-ID des neuen Branches, sodass man sie direkt mit `/resume <id>` wieder aufnehmen kann.
- **Einsatz:** `/branch` ausführen, dann angezeigte Session-ID via `/resume <id>` nutzen
- **Mehrwert:** Branch-Workflows sind nun Copy-Paste-tauglich — keine manuelle Suche der Session-ID mehr.
- **Version:** v2.1.129

### [Bold-Header mit Emoji: keine abgeschnittenen Zeichen mehr]
- **Was:** Bold-Header mit Keycap-, ZWJ- oder Skin-Tone-Emoji verloren im Fullscreen-Mode trailing Zeichen — jetzt wird die Glyph-Breite korrekt berechnet.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Markdown-Header in Konversationen rendern korrekt, egal welche Emoji enthalten sind.
- **Version:** v2.1.129

### [Server-Managed-Settings: Policy gilt auch ohne `user:inference`-Scope]
- **Was:** Server-managed Settings (Enterprise/Team-Policies) griffen vorher nicht für OAuth-User, deren gespeicherte Credentials den `user:inference`-Scope nicht hatten — jetzt unabhängig vom Scope.
- **Einsatz:** Automatisch aktiv für Enterprise-Org-User
- **Mehrwert:** Verlässliche Policy-Durchsetzung — keine Lücke mehr für ältere Token-Sets, die vor Scope-Änderungen ausgestellt wurden.
- **Version:** v2.1.129

### [OAuth-Refresh nach Wake-from-Sleep: kein Logout aller Sessions mehr]
- **Was:** Nach Wake-from-Sleep konnte ein Race im OAuth-Refresh alle laufenden Sessions ausloggen — Race behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Laptop zuklappen ist sicher — nach dem Aufwachen kein massenhafter Re-Login von parallelen Claude-Sessions mehr.
- **Version:** v2.1.129

### [1-Stunden-Prompt-Cache: TTL nicht mehr auf 5 Min downgegradet]
- **Was:** Der 1h-Prompt-Cache-TTL wurde stillschweigend auf 5 Minuten heruntergesetzt — Bug behoben, 1h hält jetzt wirklich 1h.
- **Einsatz:** Automatisch aktiv (sofern 1h-Cache verwendet wird)
- **Mehrwert:** Erheblich höhere Cache-Hit-Rate für lange Sessions — vorher waren 1h-Caches faktisch nutzlos. Spürbare Token-Ersparnis.
- **Version:** v2.1.129

### [Cache-Miss-Warning nicht mehr nach `/clear` oder Compaction]
- **Was:** Nach `/clear` oder Compaction erschien eine Cache-Miss-Warnung beim Wechseln von `/effort` oder `/model` — fälschlich, da der Cache ohnehin invalidiert war.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine irreführenden Warnungen — Power-User mit häufigem Modell-/Effort-Switching werden nicht mehr verwirrt.
- **Version:** v2.1.129

### [`Bash(mkdir *)`/`Bash(touch *)`-Allow-Rules für Projekt-Pfade]
- **Was:** Allow-Rules wie `Bash(mkdir *)` und `Bash(touch *)` wurden für In-Project-Pfade ignoriert — jetzt korrekt durchgesetzt.
- **Einsatz:** Bestehende Allow-Rules in `.claude/settings.json` greifen jetzt
- **Mehrwert:** Whitelisten von Standard-Filesystem-Operationen funktioniert wieder — kein wiederholtes Permission-Prompting für `mkdir`/`touch` in Projekt-Verzeichnissen.
- **Version:** v2.1.129

### [`deniedMcpServers` mit `*://`: case-insensitive Hostname-Match]
- **Was:** Patterns mit Scheme-Wildcard `*://` matchten Hostnames mit Mixed-Case nicht — jetzt case-insensitive.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deny-Listen funktionieren zuverlässig, egal ob ein Server `Example.COM` oder `example.com` meldet.
- **Version:** v2.1.129

### [Voice-Mode: WebSocket-Warning nicht mehr als Error im `--debug`]
- **Was:** Eine harmlose WebSocket-Warning wurde im `--debug`-Modus während Voice-Mode fälschlich als Error geloggt — jetzt korrekt als Warning.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Saubere Debug-Logs für Voice-Mode-Sessions — Echtfehler sind nicht mehr im Rauschen versteckt.
- **Version:** v2.1.129

### [VSCode: `/clear` löscht Konversation und Transcript]
- **Was:** `/clear` löschte in der VSCode-Extension den Konversations-Kontext und den angezeigten Transcript nicht — Bug behoben.
- **Einsatz:** `/clear` in VSCode
- **Mehrwert:** `/clear` verhält sich in VSCode jetzt identisch zur CLI — kein Restkontext, der die nächste Konversation verfälscht.
- **Version:** v2.1.129

---

### Woche 19 (4. Mai 2026) — v2.1.128

---

### [`/mcp` zeigt Tool-Count und flagged Server mit 0 Tools]
- **Was:** Die `/mcp`-Übersicht listet pro verbundenem Server jetzt die Anzahl angekündigter Tools und markiert Server, die mit 0 Tools verbunden haben — typisch ein Anzeichen für fehlerhafte Server-Konfig oder Auth-Probleme.
- **Einsatz:** `/mcp` aufrufen und Tool-Counts prüfen
- **Mehrwert:** Sofort sichtbar, wenn ein MCP-Server zwar verbunden, aber funktional kaputt ist — vorher musste man erst Tool-Aufrufe testen.
- **Version:** v2.1.128

### [`--plugin-dir` akzeptiert `.zip`-Plugin-Archive]
- **Was:** Der CLI-Flag `--plugin-dir` lädt jetzt nicht nur entpackte Plugin-Verzeichnisse, sondern auch direkt `.zip`-Archive.
- **Einsatz:** `claude --plugin-dir ./my-plugin.zip`
- **Mehrwert:** Plugin-Distribution per E-Mail oder CI-Artefakt funktioniert ohne manuelles Entpacken — schneller Roundtrip beim Plugin-Sharing.
- **Version:** v2.1.128

### [`--channels` jetzt auch mit API-Key/Console-Auth]
- **Was:** Der `--channels`-Flag funktioniert nun auch mit Console-API-Key-Authentifizierung. Console-Orgs mit Managed Settings müssen `channelsEnabled: true` in den Org-Settings setzen.
- **Einsatz:** `claude --channels` mit `ANTHROPIC_API_KEY` (statt OAuth-Login)
- **Mehrwert:** Channels (Slack/Discord-Integration) sind nicht mehr OAuth-only — passt zu CI-Pipelines und Service-Accounts.
- **Version:** v2.1.128

### [Bare `/color` würfelt zufällige Session-Farbe]
- **Was:** `/color` ohne Argumente wählt jetzt eine zufällige Farbe für die aktuelle Session, statt die Liste zu zeigen.
- **Einsatz:** `/color` (ohne Argument)
- **Mehrwert:** Bei mehreren parallelen Sessions sofort visuelle Unterscheidung per Random-Pick — keine manuelle Auswahl nötig.
- **Version:** v2.1.128

### [`/model`-Picker: Opus-4.7-Duplikate kollabiert]
- **Was:** Der `/model`-Picker fasst doppelte Opus-4.7-Einträge zusammen, und das aktuelle Opus-Modell zeigt sich als „Opus" statt „Opus 4.7".
- **Einsatz:** `/model` öffnen
- **Mehrwert:** Saubere Modellliste ohne Versions-Spam — der Picker bleibt auch bei vielen Aliases übersichtlich.
- **Version:** v2.1.128

### [Subprozesse erben keine `OTEL_*`-Variablen mehr]
- **Was:** Bash-, Hook-, MCP- und LSP-Subprozesse erben die `OTEL_*`-Umgebungsvariablen der CLI nicht mehr — OTel-instrumentierte Apps, die per Bash-Tool gestartet werden, schicken ihre Telemetrie nicht mehr versehentlich an den OTLP-Endpoint der CLI.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Saubere Trennung der Telemetrie-Streams; Apps unter Test schreiben in ihren eigenen Collector statt in den der Claude-Code-Session.
- **Version:** v2.1.128

### [MCP: `workspace` ist reservierter Servername]
- **Was:** Der Servername `workspace` ist für interne Nutzung reserviert. Bestehende MCP-Server-Konfigs mit diesem Namen werden mit Warnung übersprungen.
- **Einsatz:** Eigene MCP-Server umbenennen, falls `workspace` verwendet wurde
- **Mehrwert:** Verhindert Kollisionen mit kommenden Workspace-MCP-Features.
- **Version:** v2.1.128

### [MCP-Reconnect: Tool-Listen werden zusammengefasst]
- **Was:** Wenn ein MCP-Server während der Session reconnected, wird die Tool-Liste nicht mehr in voller Länge in den Konversationskontext geschoben. Stattdessen erscheint eine Server-Prefix-Zusammenfassung.
- **Einsatz:** Automatisch aktiv bei MCP-Server-Reconnects
- **Mehrwert:** Spart Kontext-Tokens bei flaky MCP-Servern enorm — gerade Stdio-Server mit häufigen Reconnects fluten den Context jetzt nicht mehr.
- **Version:** v2.1.128

### [SDK: Persistente `localSettings`-Suggestion für Bash-Permissions]
- **Was:** SDK-Hosts erhalten bei Bash-Permission-Prompts jetzt persistent eine `localSettings`-Suggestion. „Always allow" schreibt damit direkt in `.claude/settings.local.json`.
- **Einsatz:** Automatisch aktiv in SDK-Anwendungen
- **Mehrwert:** Ein einmaliges „Always allow" überlebt Session-Wechsel und CI-Reruns ohne manuelles Settings-Editing.
- **Version:** v2.1.128

### [`EnterWorktree` branched von lokalem HEAD]
- **Was:** Das `EnterWorktree`-Tool erstellt den neuen Branch wieder von `local HEAD`, wie dokumentiert — vorher wurde fälschlich von `origin/<default-branch>` gebrancht. Unpushed Commits gehen damit nicht mehr verloren.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Worktree-basierte Workflows (lokale Feature-Branches, in-progress Commits) funktionieren wieder verlustfrei.
- **Version:** v2.1.128

### [Auto-Mode: Hilfreiche Hints bei Classifier-Fehlern]
- **Was:** Wenn der Auto-Mode-Classifier eine Aktion nicht bewerten kann, zeigt die Fehlermeldung jetzt konkrete Hints (Retry, `/compact` oder Run mit `--debug`).
- **Einsatz:** Automatisch aktiv im Auto-Mode
- **Mehrwert:** Schneller Recovery-Pfad statt Sackgassen — Power-User mit langen Sessions wissen sofort, was zu tun ist.
- **Version:** v2.1.128

### [Sub-Agent Prompt-Cache: ~3× weniger `cache_creation`]
- **Was:** Sub-Agent-Progress-Summaries fehlten der Prompt-Cache. Mit dem Fix sinkt das `cache_creation`-Volumen für Sub-Agents um etwa Faktor 3.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Massive Kostenersparnis bei Workflows mit vielen Sub-Agent-Calls (parallele Recherche, Code-Reviews) — direkt in der Anthropic-API-Rechnung sichtbar.
- **Version:** v2.1.128

### [Idle Sub-Agents triggern keine Repeat-Summaries mehr]
- **Was:** Sub-Agent-Summaries wurden bisher wiederholt aufgerufen, auch wenn das Transcript unverändert blieb. Worst-Case-Token-Kosten bei idle Sub-Agents sind jetzt gedeckelt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange laufende Sub-Agents (z.B. Watch/Polling-Loops) verbrennen keine Token mehr für identische Zustandsberichte.
- **Version:** v2.1.128

### [`/plugin update` erkennt npm-Plugin-Updates]
- **Was:** `/plugin update` erkennt jetzt zuverlässig neue Versionen von Plugins, die per npm installiert wurden — vorher meldete es immer „up to date".
- **Einsatz:** `/plugin update`
- **Mehrwert:** npm-distributierte Plugins lassen sich endlich aus der CLI heraus aktualisieren, ohne manuelles `npm i -g …`.
- **Version:** v2.1.128

### [1M-Context: Falsches „Prompt is too long" vor Auto-Compact behoben]
- **Was:** Sessions auf 1M-Context-Modellen mit kleinerem Auto-Compact-Window wurden fälschlich mit „Prompt is too long" geblockt, bevor das tatsächliche API-Limit erreicht war.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange Recherche- und Refactor-Sessions auf 1M-Modellen laufen wieder bis zum echten Limit durch.
- **Version:** v2.1.128

### [Parallele Shell-Calls: Fail in einem Tool killt Geschwister nicht mehr]
- **Was:** Ein fehlschlagender Read-only-Shell-Call (z.B. `grep`, `git diff`, `ls`) bricht parallele Geschwister-Calls nicht mehr ab.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schneller bei parallelen Recherchen — ein No-Match in einem Grep verliert nicht die Ergebnisse der anderen Calls.
- **Version:** v2.1.128

### [Vim-Mode: `Space` bewegt Cursor in NORMAL]
- **Was:** Im Vim-Mode bewegt `Space` im NORMAL-Modus den Cursor wie in vi/vim eine Position nach rechts.
- **Einsatz:** Automatisch aktiv mit `editorMode: vim`
- **Mehrwert:** Standard-vi-Verhalten ist wiederhergestellt — Muscle-Memory von Vim-Nutzern wird nicht mehr gebrochen.
- **Version:** v2.1.128

### [Bedrock: Default-Model nutzt Region-Prefix statt `global.*`]
- **Was:** Auf Bedrock löste das Default-Model fälschlich zu `global.*` auf — jetzt wird der region-passende Prefix gewählt.
- **Einsatz:** Automatisch aktiv für Bedrock-Setups
- **Mehrwert:** Bedrock-Nutzer in nicht-globalen Regions vermeiden Cross-Region-Latenz und ggf. Compliance-Probleme.
- **Version:** v2.1.128

### [`/plugin` Components-Panel zeigt `--plugin-dir`-Plugins korrekt]
- **Was:** Das Components-Panel zeigte für Plugins, die per `--plugin-dir` geladen wurden, fälschlich „Marketplace 'inline' not found". Jetzt funktioniert die Anzeige.
- **Einsatz:** `/plugin` öffnen
- **Mehrwert:** Lokale Plugin-Entwicklung ohne Marketplace ist wieder vollständig sichtbar im UI.
- **Version:** v2.1.128

### [MCP: Bilder bleiben erhalten bei strukturierten Tool-Results]
- **Was:** MCP-Tool-Results, die sowohl `structuredContent` als auch Content-Blocks zurückgeben, verloren bisher die Bilder. Bilder bleiben jetzt erhalten.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Tools, die Screenshots zusammen mit Strukturdaten liefern (Browser-MCP, Diagramm-MCPs), funktionieren wieder vollständig.
- **Version:** v2.1.128

### [MCP-Stdio: Argumente bleiben heil bei `CLAUDE_CODE_SHELL_PREFIX`]
- **Was:** Wenn `CLAUDE_CODE_SHELL_PREFIX` gesetzt war und Argumente Leerzeichen oder Shell-Metazeichen enthielten, kamen MCP-Stdio-Server mit korrupten Argumenten an. Argumente bleiben jetzt korrekt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sandbox-/Container-Setups mit Shell-Wrapper liefern MCP-Servern wieder die exakten Argumente.
- **Version:** v2.1.128

### [Headless: `init.plugin_errors` enthält `--plugin-dir`-Loadfailures]
- **Was:** Im Headless-Modus mit `--output-format stream-json` listet `init.plugin_errors` jetzt auch `--plugin-dir`-Loadfailures, nicht nur Dependency-Demotions.
- **Einsatz:** `claude -p --output-format stream-json --plugin-dir ...`
- **Mehrwert:** CI-Pipelines erkennen Plugin-Probleme zuverlässig im JSON-Stream — kein Silent-Failure mehr.
- **Version:** v2.1.128

### [Diverse UX-Fixes: Crashloops, Notifications, Clipboard, Terminal-Status]
- **Was:** Sammlung kleinerer Fixes: `claude -p`-Crashloop bei >10 MB stdin, stray „4;0;"-Desktop-Notifications in Kitty/OSC9-Terminals, Drag-and-Drop-Image-Hang bei fehlgeschlagenem Read, Stale „remote-control is active"-Statuszeilen nach `--resume`/`--continue`, falsche `installed_plugins.json`-Einträge auf gelöschte Caches, Code-Block-Whitespace beim Clipboard-Copy, Tab-Navigation-Trap in `/config`, fehlende Markdown-Link-Labels auf Terminals ohne OSC-8, OSC-9;4-Progress-Indicator-Flackern zwischen Tool-Calls, `/rename` ohne Args auf Sessions mit Compact-Boundary als letztem Eintrag, `/fast` auf 3rd-Party-Providern matched zu falschem Skill, Banner-Anzeige „with X effort" auf Modellen ohne Effort, Focus-Mode-Dimming bei neuem Prompt, Remote-Control zeigt jetzt actionable Upsell-Optionen statt leerem „Opening your options…" bei Rate-Limits, lange URLs in Fullscreen sind in jedem wrapped Row klickbar.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar weniger Reibung in den alltäglichen Edge-Cases — viele kleine Annoyances auf einmal weg.
- **Version:** v2.1.128

---

### Woche 18 (1. Mai 2026) — v2.1.126

---

### [`/model`-Picker liest Modelle aus Gateway-`/v1/models`]
- **Was:** Wenn `ANTHROPIC_BASE_URL` auf ein Anthropic-kompatibles Gateway zeigt, listet der `/model`-Picker die verfügbaren Modelle direkt aus dem `/v1/models`-Endpoint des Gateways.
- **Einsatz:** `export ANTHROPIC_BASE_URL=https://your-gateway.example/`, dann `/model` öffnen
- **Mehrwert:** Gateway-Nutzer (LiteLLM, OpenRouter-kompatible Proxies, interne Routinger) sehen genau die Modelle, die ihr Gateway tatsächlich freigibt — keine hartkodierte Liste mehr.
- **Version:** v2.1.126

### [`claude project purge`: Komplette Projekt-State-Bereinigung]
- **Was:** Neuer Befehl `claude project purge [path]` löscht den gesamten Claude-Code-State eines Projekts: Transkripte, Tasks, Datei-History, Config-Eintrag.
- **Einsatz:** `claude project purge .` (mit Bestätigung); Flags `--dry-run`, `-y/--yes`, `-i/--interactive`, `--all` (alle Projekte)
- **Mehrwert:** Sauberes Cleanup nach abgeschlossenen oder verworfenen Projekten — kein manuelles Suchen nach versteckten State-Verzeichnissen.
- **Version:** v2.1.126

### [`--dangerously-skip-permissions` umgeht jetzt auch `.git/`, `.vscode/`, Shell-Configs]
- **Was:** Mit `--dangerously-skip-permissions` werden Writes zu `.claude/`, `.git/`, `.vscode/`, Shell-Config-Dateien und weiteren bisher geschützten Pfaden nicht mehr abgefragt. Katastrophale Remove-Befehle (z.B. `rm -rf /`) zeigen weiterhin einen Sicherheits-Prompt.
- **Einsatz:** `claude --dangerously-skip-permissions`
- **Mehrwert:** CI- und Setup-Skripte laufen ohne Permission-Unterbrechungen durch; das verbleibende Catastrophic-Prompt verhindert die wirklich destruktiven Unfälle.
- **Version:** v2.1.126

### [`claude auth login`: OAuth-Code per Paste in WSL2/SSH/Containern]
- **Was:** Wenn der Browser-Callback localhost nicht erreichen kann (WSL2, SSH-Tunnel, Container ohne Port-Forwarding), akzeptiert `claude auth login` jetzt den OAuth-Code per Copy-Paste ins Terminal.
- **Einsatz:** `claude auth login` und Code aus dem Browser einfügen, wenn Auto-Callback fehlschlägt
- **Mehrwert:** Headless- und Container-Setups loggen sich endlich ohne SSH-Port-Forwarding-Frickelei ein.
- **Version:** v2.1.126

### [OpenTelemetry: `claude_code.skill_activated` mit `invocation_trigger`]
- **Was:** Das OTel-Event `claude_code.skill_activated` feuert nun auch bei user-typed Slash-Commands und trägt ein neues Attribut `invocation_trigger` mit den Werten `user-slash`, `claude-proactive` oder `nested-skill`.
- **Einsatz:** Automatisch aktiv mit OTEL-Export
- **Mehrwert:** Telemetrie unterscheidet endlich, ob ein Skill bewusst vom User aufgerufen oder von Claude proaktiv aktiviert wurde — gold für Adoption-Reporting in Teams.
- **Version:** v2.1.126

### [Auto-Mode: Roter Spinner bei stockendem Permission-Check]
- **Was:** Im Auto-Mode färbt sich der Spinner jetzt rot, wenn ein Permission-Check hängt — vorher sah es so aus, als würde das Tool noch arbeiten.
- **Einsatz:** Automatisch aktiv im Auto-Mode
- **Mehrwert:** Klares visuelles Signal, dass User-Eingriff nötig ist — kein minutenlanges Warten auf "still running" mehr.
- **Version:** v2.1.126

### [Host-Managed Deployments behalten Analytics auf Bedrock/Vertex/Foundry]
- **Was:** `CLAUDE_CODE_PROVIDER_MANAGED_BY_HOST`-Deployments deaktivieren Analytics auf Bedrock, Vertex und Foundry nicht mehr automatisch.
- **Einsatz:** Automatisch aktiv für Host-Managed-Provider-Setups
- **Mehrwert:** Enterprise-Hosts bekommen ihre Analytics-Daten zurück — nützlich für Adoption-Reports und Ratenbegrenzungen-Tuning.
- **Version:** v2.1.126

### [Windows: PowerShell 7 aus Microsoft Store / MSI / .NET Tool erkannt]
- **Was:** Die Windows-Erkennung findet PowerShell 7 jetzt auch in Microsoft-Store-Installationen, MSI-Installationen ohne PATH-Eintrag und als `.NET global tool`.
- **Einsatz:** Automatisch aktiv unter Windows
- **Mehrwert:** Out-of-the-box-Erfahrung auf Windows ohne manuelle PATH-Pflege.
- **Version:** v2.1.126

### [Windows: PowerShell als Primary Shell statt Bash]
- **Was:** Wenn das PowerShell-Tool aktiviert ist, behandelt Claude PowerShell als Primary Shell — vorher fiel es auf Bash zurück.
- **Einsatz:** Automatisch aktiv, wenn PowerShell-Tool enabled
- **Mehrwert:** Native Windows-Workflows funktionieren ohne ständiges Tool-Wechseln; PowerShell-spezifische Syntax läuft direkt durch.
- **Version:** v2.1.126

### [Read-Tool: Per-File-Malware-Reminder entfernt]
- **Was:** Der per-Datei-Malware-Assessment-Reminder im Read-Tool wurde entfernt — er führte zu unnötigen Refusals und „this is not malware"-Kommentaren auf älteren Modellen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Lärm und Falsch-Refusals beim Lesen sicherheitsrelevanter Dateien (z.B. Security-Tooling, AV-Repos).
- **Version:** v2.1.126

### [Security-Fix: `allowManagedDomainsOnly` / `allowManagedReadPathsOnly` ohne `sandbox`-Block]
- **Was:** Beide Settings wurden ignoriert, wenn eine höher priorisierte Managed-Settings-Quelle keinen `sandbox`-Block enthielt — gefixt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Enterprise-Domain-/Path-Allowlists greifen wieder zuverlässig, auch bei verschachtelten Managed-Settings-Stacks.
- **Version:** v2.1.126

### [Fix: Bilder >2000 px werden beim Paste runterskaliert]
- **Was:** Pasten eines Bildes >2000 px hat die Session zerschossen. Jetzt werden Bilder beim Paste auf das Maximum runterskaliert; übergroße Bilder im History werden automatisch entfernt und der Request retried.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Screenshot-Workflows bleiben stabil; keine kaputten Sessions wegen versehentlich hochauflösender Bilder.
- **Version:** v2.1.126

### [Fix: „OAuth not allowed for organization" zeigt Admin-Hinweis statt Login-Screen]
- **Was:** Bei `OAuth not allowed for organization`-Fehlern zeigt Claude jetzt einen klaren Hinweis, den Admin zu kontaktieren — nicht mehr den Login-Screen, der den Fehler nur wiederholt hätte.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** SSO-Sperren werden sofort als Org-Policy-Issue erkannt — kein Endloskreis aus Login-Versuchen.
- **Version:** v2.1.126

### [Fix: OAuth-Login bei langsamen/proxied Verbindungen, IPv6-only Devcontainers]
- **Was:** OAuth-Login schlägt nicht mehr mit Timeout fehl, wenn die Verbindung langsam/proxied ist, der Devcontainer IPv6-only ist oder der Browser-Callback localhost nicht erreichen kann.
- **Einsatz:** Automatisch aktiv (mit dem neuen Code-Paste-Fallback)
- **Mehrwert:** Login funktioniert in Enterprise-Netzen und modernen Devcontainer-Setups zuverlässig.
- **Version:** v2.1.126

### [Fix: Race Condition löscht keinen gültigen OAuth-Refresh-Token mehr]
- **Was:** Eine seltene Race Condition, bei der ein paralleler Credential-Write den gültigen OAuth-Refresh-Token löschte, ist behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine spontanen „Re-Login nötig"-Erlebnisse mehr, wenn mehrere Claude-Instanzen parallel laufen.
- **Version:** v2.1.126

### [Fix: API-Retry-Countdown bleibt nicht mehr bei „0s" stehen]
- **Was:** Der API-Retry-Countdown zählt zwischen Versuchen wieder korrekt herunter, statt bei „0s" zu kleben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sichtbare Wartezeit bei Rate-Limits — keine Verwirrung mehr, ob der Client noch lebt.
- **Version:** v2.1.126

### [Fix: Kein „Stream idle timeout" nach Mac-Sleep mid-request]
- **Was:** Nach dem Aufwachen eines Macs mitten in einem Request kommt kein „Stream idle timeout"-Fehler mehr.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** MacBook-Klappe zu, später wieder auf — Session läuft weiter ohne manuellen Restart.
- **Version:** v2.1.126

### [Fix: Background/Remote-Sessions brechen nicht mehr bei langem Thinking ab]
- **Was:** Background- und Remote-Sessions brechen nicht mehr fälschlich mit „Stream idle timeout" ab, während das Modell länger nachdenkt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange Plan-/Reasoning-Phasen in Cloud- und Background-Runs überleben — wichtig für `/ultrareview`, `/loop`, Routinen.
- **Version:** v2.1.126

### [Fix: Hängende Assistant-Antworten nach leeren Turns]
- **Was:** Ein seltener Hang, bei dem das Modell sein Thinking beendete, aber nach einer Folge leerer Turns keinen Output zeigte, ist behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine still-toten Sessions mehr nach komplexen Tool-Loops.
- **Version:** v2.1.126

### [Fix: Trackpad-Scrolling in Cursor und VS Code 1.92–1.104]
- **Was:** In den integrierten Terminals von Cursor und VS Code 1.92–1.104 ist das übermäßig schnelle Trackpad-Scrolling gefixt.
- **Einsatz:** Automatisch aktiv in Cursor/VS-Code-Terminals
- **Mehrwert:** Scrollen durch Output bleibt kontrolliert — kein Vorbeischießen am gesuchten Punkt mehr.
- **Version:** v2.1.126

### [Fix: claude.ai-MCP-Connectors nicht mehr unterdrückt durch needs-auth-Server]
- **Was:** claude.ai-MCP-Connectors wurden durch manuell konfigurierte Server unterdrückt, die in `needs-auth`-State festhingen — gefixt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Erwartete claude.ai-Connectors erscheinen, auch wenn ein anderer MCP-Server sich noch nicht eingeloggt hat.
- **Version:** v2.1.126

### [Fix: Japanisch/Koreanisch/Chinesisch im Windows-No-Flicker-Mode]
- **Was:** CJK-Text wird im Windows-No-Flicker-Mode nicht mehr als Garbled-Characters gerendert.
- **Einsatz:** Automatisch aktiv unter Windows
- **Mehrwert:** Internationale Teams auf Windows können wieder ohne Render-Workaround arbeiten.
- **Version:** v2.1.126

### [Fix: `Ctrl+L` löscht das Prompt-Feld nicht mehr]
- **Was:** `Ctrl+L` erzwingt jetzt nur noch ein Screen-Redraw und löscht nicht mehr den Prompt-Input — entspricht dem gewohnten readline-Verhalten.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Muscle-Memory-konform; halb getippte Prompts überleben das Clear-Screen.
- **Version:** v2.1.126

### [Fix: Deferred Tools (WebSearch, WebFetch) in `context: fork`-Skills]
- **Was:** Deferred Tools wie WebSearch und WebFetch waren in Skills mit `context: fork` und anderen Subagents im ersten Turn nicht verfügbar — gefixt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Forked-Subagent-Skills können sofort recherchieren, statt erst eine Runde leerlaufen zu müssen.
- **Version:** v2.1.126

### [Fix: Plan-Mode-Tools in `--channels`-Sessions verfügbar]
- **Was:** Plan-Mode-Tools waren in interaktiven Sessions, die mit `--channels` gestartet wurden, nicht verfügbar — gefixt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Multi-Channel-Setups können wieder in den Plan-Mode wechseln.
- **Version:** v2.1.126

### [Fix: `/plugin` Uninstall meldet korrekt „Uninstalled"]
- **Was:** Das Uninstall-Result von `/plugin` zeigte fälschlich „Enabled" — jetzt korrekt „Uninstalled".
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein Zweifel mehr, ob ein Plugin wirklich weg ist.
- **Version:** v2.1.126

### [File-Modified-Reminders gebounded]
- **Was:** Wenn ein Linter viele Dateien gleichzeitig anfasst, ist die Gesamtgröße der File-Modified-Reminders jetzt gebounded.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kontext explodiert nicht mehr nach `prettier --write .` oder `eslint --fix` über große Repos.
- **Version:** v2.1.126

### [Fix: `/remote-control`-Retries zeigen Status pro Versuch]
- **Was:** `/remote-control`-Retries hingen optisch auf „connecting…" — jetzt zeigt jeder Retry-Versuch sein eigenes Ergebnis.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sichtbarer Verbindungsstatus während Retry-Loops — kein Rätselraten mehr.
- **Version:** v2.1.126

### [Fix: Remote-Control-Failure zeigt initialen Fehlergrund]
- **Was:** Die Failure-Notification von Remote Control zeigt jetzt auch bei initialen Connection-Failures den genauen Fehlergrund.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schnellere Diagnose von Netzwerk-/Auth-Problemen bei Remote Control.
- **Version:** v2.1.126

### [Windows-Security: Clipboard-Writes verstecken Inhalt vor EDR/SIEM]
- **Was:** Unter Windows landen kopierte Inhalte nicht mehr als Process-Command-Line-Argumente, die EDR-/SIEM-Telemetrie sehen würde. Außerdem: Selektionen >22 KB landen jetzt zuverlässig im Clipboard.
- **Einsatz:** Automatisch aktiv unter Windows
- **Mehrwert:** Sensible Daten (Tokens, Snippets) werden nicht mehr versehentlich in Security-Logs geleakt; große Code-Blöcke kopieren funktioniert wieder.
- **Version:** v2.1.126

### [PowerShell-Tool: bare `--` nicht mehr als `--%` interpretiert]
- **Was:** Ein nacktes `--` (z.B. `git diff -- file`) wurde fälschlich als PowerShell-`--%`-Stop-Parsing-Token interpretiert — gefixt.
- **Einsatz:** Automatisch aktiv im PowerShell-Tool
- **Mehrwert:** Standard-Git/CLI-Argumente mit Pfad-Separator funktionieren in PowerShell wie erwartet.
- **Version:** v2.1.126

### [Fix: Agent-SDK hängt nicht mehr bei malformed parallel Tool Names]
- **Was:** Das Agent-SDK hängte, wenn das Modell in einem parallelen Tool-Call-Batch einen malformed Tool-Namen emittierte — gefixt.
- **Einsatz:** Automatisch aktiv (Agent SDK)
- **Mehrwert:** Robustere Agent-Loops; ein einzelner kaputter Tool-Call killt nicht mehr die ganze Session.
- **Version:** v2.1.126

---

### Woche 18 (30. April 2026) — Blog-Ankündigung

---

### [Blog-Ankündigung: "Claude Security is now in public beta" (2026-04-30)]
- **Was:** Anthropic stellt Claude Security als eigenständigen Vulnerability-Scanner für Enterprise-Kunden in die Public Beta. Claude analysiert Code wie ein Security-Researcher (komponentenübergreifend, Datenfluss-basiert, nicht Pattern-Matching) und liefert Findings inkl. Confidence, Severity, Impact und Repro-Schritten. Eine mehrstufige Validierungs-Pipeline reduziert False Positives vor dem Analyst-Review.
- **Einsatz:** Über `claude.ai/security` (Sidebar in claude.ai). Generierte Patch-Vorschläge lassen sich per Klick in **Claude Code on the Web** öffnen, um den Fix dort im Repo-Kontext zu durcharbeiten.
- **Mehrwert:** Detection und Initial-Fix-Generierung in einem Tool — der Bridge-Punkt zu Claude Code on the Web macht den Übergang vom Finding zum Patch-PR nahtlos. Für Teams, die `/security-review` im CLI bereits nutzen, ergänzend gedacht (Bulk-/Continuous-Scanning vs. Inline-Review).
- **Version:** Platform-Ankündigung 2026-04-30 (public beta, Enterprise)

---

### Woche 18 (28.–29. April 2026) — v2.1.122 / v2.1.123

---

### [Fix: OAuth-401-Retry-Loop bei `CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS=1`]
- **Was:** OAuth-Auth schlägt nicht mehr in einer 401-Retry-Schleife fehl, wenn die Env-Variable `CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS=1` gesetzt ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Hotfix für Enterprise-Setups, die experimentelle Betas deaktivieren — Login funktioniert wieder ohne Workaround.
- **Version:** v2.1.123

### [`ANTHROPIC_BEDROCK_SERVICE_TIER`: Bedrock-Service-Tier wählen]
- **Was:** Neue Env-Variable wählt den AWS-Bedrock-Service-Tier (`default`, `flex` oder `priority`) und sendet ihn als `X-Amzn-Bedrock-Service-Tier`-Header.
- **Einsatz:** `export ANTHROPIC_BEDROCK_SERVICE_TIER=priority` (oder `flex` / `default`)
- **Mehrwert:** Bedrock-Nutzer können bewusst zwischen Latenz/Kosten-Profilen wählen — z.B. `priority` für interaktive Sessions, `flex` für Batch-Workloads.
- **Version:** v2.1.122

### [`/resume` findet Session per PR-URL]
- **Was:** Wer eine PR-URL (GitHub, GitHub Enterprise, GitLab, Bitbucket) in das `/resume`-Suchfeld einfügt, springt direkt zur Session, die diese PR erzeugt hat.
- **Einsatz:** `/resume` öffnen, PR-URL einfügen
- **Mehrwert:** Vom PR-Review zurück in den Claude-Kontext in einem Schritt — kein manuelles Suchen nach der Session mehr.
- **Version:** v2.1.122

### [`/mcp` warnt vor versteckten claude.ai-Connectors]
- **Was:** `/mcp` zeigt jetzt claude.ai-Connectors, die durch einen manuell konfigurierten MCP-Server mit gleicher URL verdeckt werden — inklusive Hinweis, das Duplikat zu entfernen.
- **Einsatz:** Automatisch aktiv im `/mcp`-Output
- **Mehrwert:** Endlich erkennbar, warum ein erwarteter Connector „fehlt" — Debugging-Zeit gespart.
- **Version:** v2.1.122

### [`/mcp`: klarere Meldung nach Browser-Sign-in]
- **Was:** Die Nachricht im `/mcp`-Dialog, wenn ein MCP-Server nach dem Browser-Sign-in noch nicht autorisiert ist, wurde verständlicher formuliert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Verwirrung beim OAuth-Flow von MCP-Servern.
- **Version:** v2.1.122

### [OpenTelemetry: numerische Attribute als Zahlen]
- **Was:** Numerische Attribute auf `api_request`-/`api_error`-Log-Events werden jetzt als Zahlen emittiert, nicht mehr als Strings.
- **Einsatz:** Automatisch aktiv bei aktivem OTEL-Export
- **Mehrwert:** Aggregationen (avg, max, percentile) in Grafana/Datadog funktionieren ohne String-zu-Number-Casts.
- **Version:** v2.1.122

### [OpenTelemetry: `claude_code.at_mention`-Event]
- **Was:** Neues Log-Event `claude_code.at_mention` für `@`-Mention-Auflösung wird via OpenTelemetry emittiert.
- **Einsatz:** Automatisch aktiv mit OTEL-Export
- **Mehrwert:** Telemetrie zu Datei-/Symbol-Mentions — nützlich für Workflow-Analysen in Teams.
- **Version:** v2.1.122

### [Fix: `/branch` nach Rewind erzeugt keine kaputten Forks mehr]
- **Was:** `/branch` produziert keine Forks mehr, die mit „tool_use ids were found without tool_result blocks" scheitern, wenn die Quell-Session Einträge aus zurückgespulten Timelines enthielt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Branching aus komplexen Sessions mit Rewinds funktioniert wieder zuverlässig.
- **Version:** v2.1.122

### [Fix: `/model`-Effort-Option für Bedrock Application Inference Profile ARNs]
- **Was:** `/model` zeigt die Effort-Option nun auch für Bedrock-Application-Inference-Profile-ARNs an, und diese ARNs erhalten korrekt das `output_config.effort`-Feld.
- **Einsatz:** Automatisch aktiv bei Bedrock-Inference-Profilen
- **Mehrwert:** Effort-Tuning (low/medium/high/xhigh) jetzt auch in Bedrock-Enterprise-Setups verfügbar.
- **Version:** v2.1.122

### [Fix: Vertex AI / Bedrock — `output_config: Extra inputs are not permitted`]
- **Was:** Vertex AI und Bedrock geben keinen `invalid_request_error: output_config: Extra inputs are not permitted` mehr bei Session-Title-Generation und anderen Structured-Output-Queries.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sessions auf Vertex/Bedrock bekommen wieder automatische Titel und sonstige strukturierte Antworten.
- **Version:** v2.1.122

### [Fix: Vertex AI `count_tokens` hinter Proxy-Gateways]
- **Was:** Der Vertex-AI-`count_tokens`-Endpoint wirft hinter Proxy-Gateways keine 400-Fehler mehr.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Token-Counting (z.B. für Quota-Anzeigen) funktioniert auch in Enterprise-Netzen mit Proxy-Routing.
- **Version:** v2.1.122

### [Fix: `spinnerTipsOverride.excludeDefault` unterdrückt jetzt zeitbasierte Tips]
- **Was:** Die Setting `spinnerTipsOverride.excludeDefault` greift nun auch bei den zeitbasierten Default-Spinner-Tips, nicht nur bei zustandsbasierten.
- **Einsatz:** `"spinnerTipsOverride": { "excludeDefault": true }` in `settings.json`
- **Mehrwert:** Wer eigene Tips definiert, sieht endlich nur noch die — keine Default-Texte mehr dazwischen.
- **Version:** v2.1.122

### [Fix: ToolSearch findet MCP-Tools, die nach Session-Start verbinden]
- **Was:** ToolSearch findet im Nonblocking-Mode jetzt auch Tools von MCP-Servern, die erst **nach** Session-Start verbunden haben.
- **Einsatz:** Automatisch aktiv im Nonblocking-MCP-Mode
- **Mehrwert:** Spät startende MCP-Server (z.B. lange Auth-Flows) werden zuverlässig in Tool-Searches einbezogen.
- **Version:** v2.1.122

### [Fix: `!exit` / `!quit` im Bash-Mode beendet nicht mehr die CLI]
- **Was:** `!exit` und `!quit` im Bash-Mode werden jetzt als Shell-Kommandos behandelt — nicht mehr fälschlich als CLI-Beenden interpretiert.
- **Einsatz:** Automatisch aktiv im Bash-Mode (`!`-Prefix)
- **Mehrwert:** Subshells/Skripte mit `exit` laufen wie erwartet — keine versehentlich beendeten Sessions mehr.
- **Version:** v2.1.122

### [Fix: Bilder werden korrekt auf 2000 px max statt 2576 px skaliert]
- **Was:** Bilder, die an neuere Modelle gehen, werden wieder auf das korrekte Maximum von 2000 px pro Seite skaliert (vorher fälschlich 2576 px).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Vermeidet API-Fehler und unnötige Token-Kosten durch zu große Bilder.
- **Version:** v2.1.122

### [Fix: Remote-Control-Idle-Status flutet `tmux -CC` nicht mehr]
- **Was:** Der Remote-Control-Session-Idle-Status redrawt nicht mehr 2× pro Sekunde — das hatte `tmux -CC`-Control-Pipes geflutet und das Terminal pausiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** `tmux -CC`-Nutzer (z.B. iTerm2-Integration) bekommen kein eingefrorenes Terminal mehr durch Claude Code.
- **Version:** v2.1.122

### [Fix: Assistant-Messages erscheinen nicht mehr leer]
- **Was:** Eine veraltete View-Preference führte dazu, dass Assistant-Messages in manchen Sessions leer angezeigt wurden — behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Volle Antworten sichtbar, kein Reload-/Resume-Workaround mehr nötig.
- **Version:** v2.1.122

### [Fix: Defekter `hooks`-Eintrag macht `settings.json` nicht mehr ungültig]
- **Was:** Eine fehlerhafte Hook-Definition in `settings.json` invalidiert nicht mehr die ganze Datei — andere Settings bleiben aktiv.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Fail-soft statt fail-hard — ein Tippfehler im Hook legt nicht mehr alle Permissions/Env-Vars lahm.
- **Version:** v2.1.122

### [Voice-Mode: Caps-Lock-Keybindings zeigen Fehler]
- **Was:** Voice-Mode-Keybindings, die auf Caps Lock gebunden sind, zeigen jetzt einen Fehler an — Terminals liefern Caps Lock nicht als Key-Event.
- **Einsatz:** Beim Konfigurieren eines Caps-Lock-Bindings im Voice-Mode
- **Mehrwert:** Ehrliche Fehlermeldung statt stiller Stille — vermeidet stundenlanges Debugging warum's nicht klappt.
- **Version:** v2.1.122

---

### Woche 18 (28. April 2026) — v2.1.120 / v2.1.121

---

### [`alwaysLoad` für MCP-Server: Tools ohne Tool-Search-Deferral]
- **Was:** Neue Option `alwaysLoad: true` in der MCP-Server-Config — alle Tools des Servers überspringen die Tool-Search-Deferral und sind sofort verfügbar.
- **Einsatz:** In der MCP-Server-Config `"alwaysLoad": true` setzen
- **Mehrwert:** Kritische MCP-Tools werden zuverlässig geladen, ohne dass Tool-Search sie versteckt — wichtig bei kleinen, fokussierten MCP-Servern.
- **Version:** v2.1.121

### [`claude plugin prune`: orphaned Plugin-Dependencies aufräumen]
- **Was:** Neuer Befehl `claude plugin prune` entfernt verwaiste, automatisch installierte Plugin-Dependencies; `plugin uninstall --prune` cascadiert ebenfalls.
- **Einsatz:** `claude plugin prune` oder `claude plugin uninstall <name> --prune`
- **Mehrwert:** Plugin-Verwaltung bleibt sauber — keine Karteileichen nach Deinstallationen.
- **Version:** v2.1.121

### [`/skills`: Type-to-Filter-Suchbox]
- **Was:** Im `/skills`-Dialog gibt es jetzt ein Suchfeld zum Filtern — kein Scrollen mehr durch lange Skill-Listen.
- **Einsatz:** `/skills` öffnen und einfach tippen
- **Mehrwert:** Bei vielen installierten Skills (Plugins) findet man den richtigen sofort.
- **Version:** v2.1.121

### [PostToolUse-Hooks: Tool-Output für alle Tools ersetzen]
- **Was:** PostToolUse-Hooks können nun via `hookSpecificOutput.updatedToolOutput` das Tool-Output für **alle** Tools ersetzen (vorher nur MCP-Tools).
- **Einsatz:** Im PostToolUse-Hook `hookSpecificOutput.updatedToolOutput` setzen
- **Mehrwert:** Mächtiges Filtering/Redaction (z.B. Secrets aus Bash-Output) jetzt einheitlich für jedes Tool möglich.
- **Version:** v2.1.121

### [Fullscreen: Scroll-Position bleibt beim Tippen erhalten]
- **Was:** Tippen ins Prompt-Feld scrollt im Fullscreen-Mode nicht mehr automatisch zurück nach unten, wenn man nach oben gescrollt hat.
- **Einsatz:** Automatisch aktiv im Fullscreen
- **Mehrwert:** Frühere Output-Stellen bleiben sichtbar während des Tippens — viel weniger Scroll-Frust.
- **Version:** v2.1.121

### [Scrollbare Dialoge bei Terminal-Overflow]
- **Was:** Dialoge, die das Terminal überfüllen, lassen sich jetzt mit Pfeiltasten, PgUp/PgDn, Home/End und Mausrad scrollen — sowohl im Fullscreen als auch im Standard-Mode.
- **Einsatz:** Automatisch aktiv; in großen Dialogen einfach scrollen
- **Mehrwert:** Lange Listen (Settings, Permissions, etc.) werden auf kleinen Terminals endlich vollständig nutzbar.
- **Version:** v2.1.121

### [Lange URLs: Klick auf jede Zeile öffnet vollen Link]
- **Was:** Bei URLs, die im Fullscreen über mehrere Zeilen umbrechen, öffnet ein Klick auf **jede** Zeile die komplette URL.
- **Einsatz:** Automatisch aktiv im Fullscreen
- **Mehrwert:** Keine Frickelei mehr beim Treffen der ersten Zeile — Links sind robuster klickbar.
- **Version:** v2.1.121

### [`CLAUDE_CODE_FORK_SUBAGENT=1` auch im SDK / `claude -p`]
- **Was:** Die Env-Variable `CLAUDE_CODE_FORK_SUBAGENT=1` funktioniert jetzt auch in non-interactive Sessions (SDK, `claude -p`).
- **Einsatz:** `CLAUDE_CODE_FORK_SUBAGENT=1 claude -p "<prompt>"`
- **Mehrwert:** Subagent-Forking konsistent in allen Run-Modes — wichtig für CI-Pipelines und automatisierte Skripte.
- **Version:** v2.1.121

### [`--dangerously-skip-permissions` fragt nicht mehr für `.claude/`-Configs]
- **Was:** Mit `--dangerously-skip-permissions` werden Writes in `.claude/skills/`, `.claude/agents/` und `.claude/commands/` nicht mehr unterbrochen.
- **Einsatz:** `claude --dangerously-skip-permissions`
- **Mehrwert:** Skill-/Agent-/Command-Setup in CI-Runs läuft ohne Permission-Block durch.
- **Version:** v2.1.121

### [`/terminal-setup` aktiviert iTerm2 Clipboard-Setting für tmux]
- **Was:** `/terminal-setup` schaltet iTerm2's „Applications in terminal may access clipboard"-Setting an, damit `/copy` auch aus tmux funktioniert.
- **Einsatz:** `/terminal-setup` ausführen (iTerm2 + tmux)
- **Mehrwert:** Endlich funktioniert `/copy` zuverlässig im typischen iTerm2/tmux-Setup vieler Devs.
- **Version:** v2.1.121

### [MCP-Server: Auto-Retry (3×) bei Startup-Errors]
- **Was:** MCP-Server, die beim Startup einen transienten Fehler werfen, werden bis zu 3× automatisch erneut verbunden — statt dauerhaft disconnected zu bleiben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabile MCP-Pipelines auch bei flaky Netzwerk- oder Auth-Hängern beim Start.
- **Version:** v2.1.121

### [Terminal-Tab-Titel respektiert `language`-Setting]
- **Was:** Der Terminal-Tab-Titel wird in der konfigurierten `language`-Sprache erzeugt.
- **Einsatz:** Sprache via Settings / `language` setzen
- **Mehrwert:** Konsistente UI-Sprache bis in den Tab-Titel — wichtig für nicht-englische Nutzer.
- **Version:** v2.1.121

### [claude.ai Connectors: Deduplication bei gleicher Upstream-URL]
- **Was:** Connectors mit identischer Upstream-URL werden zusammengefasst, statt doppelt in der Liste aufzutauchen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Übersichtliche Connector-Liste auf claude.ai — keine verwirrenden Duplikate.
- **Version:** v2.1.121

### [Vertex AI: X.509 Workload Identity Federation (mTLS ADC)]
- **Was:** Vertex AI unterstützt jetzt zertifikatbasierte Workload Identity Federation per X.509 (mTLS Application Default Credentials).
- **Einsatz:** ADC mit X.509-Zertifikat einrichten — Claude Code nutzt es automatisch
- **Mehrwert:** Enterprise-konforme Vertex-AI-Authentifizierung ohne langlebige Service-Account-Keys.
- **Version:** v2.1.121

### [Schnellerer Startup nach Upgrade (Recent Activity entfernt)]
- **Was:** Nach Upgrades startet Claude Code spürbar schneller — das Recent-Activity-Panel im Release-Notes-Splash wurde entfernt.
- **Einsatz:** Automatisch aktiv nach jedem Upgrade
- **Mehrwert:** Weniger Wartezeit nach `claude upgrade` — schneller wieder produktiv.
- **Version:** v2.1.121

### [LSP-Diagnose-Summaries: expand on click / Ctrl+O]
- **Was:** LSP-Diagnostic-Summaries lassen sich per Klick oder `Ctrl+O` aufklappen; ein Hinweis zeigt, dass es geht.
- **Einsatz:** Auf eine Diagnose-Zeile klicken oder `Ctrl+O` drücken
- **Mehrwert:** Lange Type-/Compiler-Errors werden bei Bedarf voll lesbar, ohne den Default-View zu zumüllen.
- **Version:** v2.1.121

### [SDK: `mcp_authenticate` mit `redirectUri`]
- **Was:** Das SDK-API `mcp_authenticate` akzeptiert jetzt `redirectUri` für Custom-Scheme-Completion und claude.ai-Connectors.
- **Einsatz:** Im SDK `mcp_authenticate({ redirectUri: '<scheme>://...' })`
- **Mehrwert:** OAuth-Flows aus Desktop-/Custom-Apps schließen sauber — kein manuelles Code-Paste-Drama mehr.
- **Version:** v2.1.121

### [OpenTelemetry: `stop_reason`, `finish_reasons`, optional `user_system_prompt`]
- **Was:** LLM-Request-Spans bekommen `stop_reason`, `gen_ai.response.finish_reasons` und (per `OTEL_LOG_USER_PROMPTS` gegated) `user_system_prompt`.
- **Einsatz:** OTel-Collector queryen; für User-Prompt-Logging `OTEL_LOG_USER_PROMPTS=1` setzen
- **Mehrwert:** Bessere Observability für Stop-Reasons und Prompts — Debugging und Analytics werden viel präziser.
- **Version:** v2.1.121

### [VSCode: Voice-Dictation respektiert `speechLanguage`]
- **Was:** Voice-Dictation in der VSCode-Extension nutzt das `accessibility.voice.speechLanguage`-Setting, wenn keine Claude-Code-Sprache gesetzt ist.
- **Einsatz:** In VSCode `accessibility.voice.speechLanguage` setzen
- **Mehrwert:** Diktieren in der korrekten Sprache funktioniert ohne separate Claude-Code-Konfig.
- **Version:** v2.1.121

### [VSCode: `/context` öffnet nativen Token-Usage-Dialog]
- **Was:** `/context` zeigt in der VSCode-Extension einen nativen Dialog mit Token-Usage statt Inline-Output.
- **Einsatz:** In VSCode `/context` ausführen
- **Mehrwert:** Übersichtliche Token-Auswertung als Dialog — schneller scanbar als Text-Output.
- **Version:** v2.1.121

### [Memory-Leaks behoben: Images, `/usage`, long-running Tools]
- **Was:** Mehrere Memory-Leaks gefixt — unbeschränktes RSS-Wachstum bei vielen Bildern, ~2GB Leak in `/usage` bei großen Transcripts, Leak bei Tools ohne klare Progress-Events.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange Sessions bleiben stabil; kein RAM-Frust mehr bei Image-lastigen oder lang laufenden Workflows.
- **Version:** v2.1.121

### [Fix: Bash-Tool überlebt CWD-Wechsel/Löschung]
- **Was:** Wenn das Verzeichnis, in dem Claude gestartet wurde, mid-session gelöscht oder verschoben wird, bleibt das Bash-Tool nutzbar.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Unterbrechungsfreies Arbeiten bei Branch-Switches mit Verzeichnisumstellungen.
- **Version:** v2.1.121

### [Fix: `--resume` robuster bei großen / korrupten Sessions]
- **Was:** `--resume` crasht nicht mehr beim Startup in External Builds; korrupte Transcript-Zeilen (z.B. nach Unclean Shutdown) werden übersprungen statt geblockt.
- **Einsatz:** `claude --resume`
- **Mehrwert:** Wiederherstellung großer/halbabgebrochener Sessions klappt zuverlässig.
- **Version:** v2.1.121

### [Fix: Bedrock `thinking.type.enabled` mit Application Inference Profile ARNs]
- **Was:** Der Fehler „thinking.type.enabled is not supported" tritt bei Bedrock Application-Inference-Profile-ARNs nicht mehr auf.
- **Einsatz:** Automatisch aktiv bei Bedrock
- **Mehrwert:** Thinking-Mode funktioniert in allen unterstützten Bedrock-Setups.
- **Version:** v2.1.121

### [Fix: Microsoft 365 MCP-OAuth — duplicate `prompt` Parameter]
- **Was:** Der M365-MCP-OAuth-Flow scheitert nicht mehr an doppelten/unsupported `prompt`-Parametern.
- **Einsatz:** Automatisch aktiv für M365 MCP
- **Mehrwert:** Microsoft-365-Integration läuft direkt durch — weniger Setup-Frust für Enterprise.
- **Version:** v2.1.121

### [Fix: Scrollback-Duplication in tmux / GNOME / Windows Terminal / Konsole]
- **Was:** Ctrl+L oder Redraws im Non-Fullscreen-Mode duplizieren keinen Scrollback mehr in tmux, GNOME Terminal, Windows Terminal und Konsole.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sauberes Terminal-Erscheinungsbild über alle gängigen Setups hinweg.
- **Version:** v2.1.121

### [Fix: claude.ai MCP-Connectors verschwinden bei Auth-Hänger]
- **Was:** Connectors verschwinden nicht mehr stillschweigend, wenn der Connector-List-Fetch beim Startup einen transienten Auth-Error trifft.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Connectors bleiben auch bei flaky Authentication zuverlässig sichtbar.
- **Version:** v2.1.121

### [Fix: „Always allow"-Rules überleben Worker-Restart in Remote-Sessions]
- **Was:** Built-in-Tool-Permissions mit „Always allow" werden in Remote-Sessions auch nach Worker-Restarts beibehalten.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine wiederholten Permission-Prompts in lang laufenden Cloud-/Remote-Sessions.
- **Version:** v2.1.121

### [Fix: `NO_PROXY` aus `managed-settings.json` greift überall]
- **Was:** `NO_PROXY`, gesetzt via `managed-settings.json`, wird im Native Build von **allen** HTTP-Clients respektiert.
- **Einsatz:** Automatisch aktiv mit Managed Settings
- **Mehrwert:** Konsistentes Proxy-Verhalten in Enterprise-Netzwerken — keine versehentlichen Proxy-Bypass-Lücken.
- **Version:** v2.1.121

### [Fix: Managed-Settings-Approval beendet Session nicht]
- **Was:** Akzeptiert man den Managed-Settings-Approval-Prompt, wird die Session **fortgesetzt** statt beendet.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Reibungsloser erster Start in Enterprise-Setups mit Managed Settings.
- **Version:** v2.1.121

### [Fix: `/usage` refresht stale OAuth-Token automatisch]
- **Was:** `/usage` liefert nicht mehr „rate limited" bei abgelaufenem OAuth-Token — der Token wird automatisch erneuert.
- **Einsatz:** `/usage` aufrufen
- **Mehrwert:** Verlässliche Limit-Anzeige ohne manuelles Re-Login.
- **Version:** v2.1.121

### [Fix: Invalid Legacy-Enum-Werte invalidieren nicht die ganze settings.json]
- **Was:** Ein einzelner ungültiger Legacy-Enum-Wert macht nicht mehr die gesamte `settings.json` ungültig.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Robuste Settings — Migrationen alter Configs scheitern nicht mehr komplett an einem einzelnen Eintrag.
- **Version:** v2.1.121

### [Fix: `/usage`-Dialog ohne No-Flicker-Mode wird nicht mehr abgeschnitten]
- **Was:** Der `/usage`-Dialog wird auch mit deaktiviertem No-Flicker-Mode vollständig dargestellt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Vollständige Usage-Info auch auf Terminals ohne No-Flicker-Support.
- **Version:** v2.1.121

### [Fix: `/focus` erklärt sich, wenn Fullscreen aus ist]
- **Was:** Statt „Unknown command" zeigt `/focus` jetzt eine Erklärung, wie man den Fullscreen-Renderer aktiviert.
- **Einsatz:** `/focus` ohne Fullscreen ausführen
- **Mehrwert:** Selbsterklärendes UX statt verwirrendem Error.
- **Version:** v2.1.121

### [Fix: Embedded grep/find/rg-Wrapper falls Binary mid-session gelöscht]
- **Was:** Wird das laufende Binary mid-session gelöscht (z.B. nach Upgrade), fallen die Shell-Wrapper für grep/find/rg auf das installierte System-Tool zurück.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Searches funktionieren auch über Upgrade-Brüche hinweg.
- **Version:** v2.1.121

### [Reduzierte File-Descriptor-Nutzung bei `find` auf großen Trees]
- **Was:** `find` im Bash-Tool verbraucht spürbar weniger File Descriptors auf großen Verzeichnisbäumen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger „too many open files"-Fehler bei großen Monorepos.
- **Version:** v2.1.121

### Woche 17 (24. April 2026) — v2.1.119

---

### [`/config`-Settings persistieren mit Override-Hierarchie]
- **Was:** Änderungen via `/config` werden in `~/.claude/settings.json` geschrieben — mit klarer Präzedenz: project > local > policy.
- **Einsatz:** `/config` öffnen, Werte anpassen — landen automatisch in der richtigen Settings-Schicht
- **Mehrwert:** Keine verlorenen Einstellungen mehr zwischen Sessions; Team-Policies bleiben trotzdem verbindlich.
- **Version:** v2.1.119

### [`prUrlTemplate` für eigene Code-Review-Hosts]
- **Was:** Statt fest `github.com` zu linken, lässt sich per `prUrlTemplate` eine beliebige Review-URL (GitLab, Gitea, interner Host) einsetzen.
- **Einsatz:** `prUrlTemplate` in den Settings auf z.B. `https://gitlab.corp/${owner}/${repo}/-/merge_requests/${number}` setzen
- **Mehrwert:** Enterprise-Setups mit Self-Hosted-Git bekommen korrekte Review-Links, ohne GitHub-Hardcoding.
- **Version:** v2.1.119

### [`CLAUDE_CODE_HIDE_CWD` versteckt CWD im Startup-Logo]
- **Was:** Neue Env-Var `CLAUDE_CODE_HIDE_CWD` blendet das aktuelle Arbeitsverzeichnis im Startup-Banner aus.
- **Einsatz:** `export CLAUDE_CODE_HIDE_CWD=1`
- **Mehrwert:** Screen-Sharing, Demos und Aufzeichnungen leaken keine internen Pfadstrukturen mehr.
- **Version:** v2.1.119

### [`--from-pr` unterstützt GitLab, Bitbucket und GitHub Enterprise]
- **Was:** Der `--from-pr`-Flag akzeptiert jetzt zusätzlich GitLab-, Bitbucket- und GHE-Merge-Request-/PR-URLs.
- **Einsatz:** `claude --from-pr https://gitlab.com/org/repo/-/merge_requests/42`
- **Mehrwert:** PR-Reviews aus beliebigen Git-Hostern starten, ohne Branch vorher lokal auschecken zu müssen.
- **Version:** v2.1.119

### [`--print` respektiert Agent-`tools:` / `disallowedTools:`]
- **Was:** Im `--print`-Modus werden die in der Agent-Frontmatter deklarierten `tools:` und `disallowedTools:` korrekt erzwungen.
- **Einsatz:** `claude --print --agent <name>` mit Agent-Definition, die Tool-Scoping setzt
- **Mehrwert:** Non-interactive Runs kriegen dieselben Sicherheits-Boundaries wie interaktive — weniger Risiko bei Agenten-Pipelines.
- **Version:** v2.1.119

### [`--agent` erbt `permissionMode` für Built-in-Agents]
- **Was:** `--agent <name>` übernimmt auch bei Built-in-Agents den in der Agent-Definition gesetzten `permissionMode`.
- **Einsatz:** Agent-File mit `permissionMode: plan` o.ä. anlegen und via `--agent` starten
- **Mehrwert:** Agenten laufen zuverlässig im gewünschten Sicherheits-Level, egal ob extern oder built-in.
- **Version:** v2.1.119

### [PowerShell-Tool-Kommandos auto-approvable]
- **Was:** Kommandos des PowerShell-Tools können jetzt über Permission-Rules automatisch freigegeben werden (wie Bash).
- **Einsatz:** Permission-Entries wie `PowerShell(Get-*)` in den Allow-Rules definieren
- **Mehrwert:** Windows-Workflows werden flüssiger — keine Dauer-Rückfragen mehr für harmlose PowerShell-Reads.
- **Version:** v2.1.119

### [Hook-Payload enthält `duration_ms`]
- **Was:** Hook-Events bekommen ein neues Feld `duration_ms` mit der Ausführungszeit des Tools.
- **Einsatz:** In Hook-Skripten auf `duration_ms` zugreifen, z.B. für Latenz-Logging
- **Mehrwert:** Observability ohne Wrapper — Tool-Performance direkt aus Hooks messbar.
- **Version:** v2.1.119

### [Parallele (Re-)Verbindung für Subagent- und SDK-MCP-Server]
- **Was:** Bei Subagent- und SDK-MCP-Reconfiguration werden alle Server parallel verbunden, nicht sequentiell.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar kürzere Startup-Zeit bei Projekten mit vielen MCP-Servern.
- **Version:** v2.1.119

### [Plugin-Version-Constraints: Auto-Update zum höchsten Match]
- **Was:** Plugins mit Version-Constraints (z.B. `^1.2.0`) bekommen automatisch das höchste passende Git-Tag beim Auto-Update.
- **Einsatz:** Plugin mit Version-Constraint installieren; Auto-Update folgt Semver
- **Mehrwert:** Bugfix-Releases werden automatisch eingezogen, ohne Breaking-Changes zu riskieren.
- **Version:** v2.1.119

### [Vim-Mode: Esc im INSERT lässt Queued-Messages in Ruhe]
- **Was:** Esc beim Verlassen des Vim INSERT-Modes zieht nicht mehr versehentlich bereits gequeuete Nachrichten zurück ins Eingabefeld.
- **Einsatz:** Automatisch aktiv im Vim-Mode
- **Mehrwert:** Vim-Nutzer können ohne Angst vor Message-Merges zwischen Modes wechseln.
- **Version:** v2.1.119

### [Slash-Command-Picker: Highlight + Line-Wrap]
- **Was:** Slash-Command-Vorschläge heben die gematchten Zeichen im Namen hervor, und lange Beschreibungen werden umgebrochen statt abgeschnitten.
- **Einsatz:** Automatisch aktiv; `/` tippen und mitschreiben
- **Mehrwert:** Schnellerer Scan der Treffer, komplette Infos sichtbar — Fuzzy-Matching wird transparenter.
- **Version:** v2.1.119

### [`owner/repo#N`-Shorthand nutzt Git-Remote-Host]
- **Was:** Der Kurzlink `owner/repo#123` wird jetzt gegen den tatsächlichen Git-Remote-Host aufgelöst — nicht mehr fest gegen `github.com`.
- **Einsatz:** `owner/repo#123` in einer Nachricht eingeben; Claude folgt dem Remote
- **Mehrwert:** Korrekte Deep-Links auch in GitLab-/GHE-/Gitea-Repos — kein manuelles Ausschreiben der vollen URL.
- **Version:** v2.1.119

### [`blockedMarketplaces`: `hostPattern`/`pathPattern` wirken]
- **Was:** Die Policy `blockedMarketplaces` enforced jetzt auch ihre `hostPattern`- und `pathPattern`-Einträge.
- **Einsatz:** Im Managed-Settings-File `blockedMarketplaces`-Einträge mit Patterns hinterlegen
- **Mehrwert:** Enterprise kann Plugin-Quellen granular blockieren, nicht nur per exakter Marketplace-ID.
- **Version:** v2.1.119

### [OpenTelemetry-Events: `tool_use_id` in `tool_result` / `tool_decision`]
- **Was:** Die OTel-Events `tool_result` und `tool_decision` enthalten jetzt die `tool_use_id`.
- **Einsatz:** Automatisch aktiv; in Collector-Queries nach `tool_use_id` joinen
- **Mehrwert:** Events desselben Tool-Calls lassen sich sauber korrelieren — End-to-End-Traces ohne Heuristik.
- **Version:** v2.1.119

### [Statusline-Stdin JSON: `effort.level` + `thinking.enabled`]
- **Was:** Das JSON, das an Statusline-Skripte per Stdin übergeben wird, enthält jetzt `effort.level` und `thinking.enabled`.
- **Einsatz:** Statusline-Skript um Parsing dieser Felder erweitern
- **Mehrwert:** Statusline kann anzeigen, ob Extended Thinking läuft und in welchem Effort-Level — sichtbarer als bisher.
- **Version:** v2.1.119

### [Fix: CRLF-Paste erzeugte Leerzeilen]
- **Was:** Einfügen von Text mit Windows-Line-Endings (CRLF) fügte keine zusätzlichen Leerzeilen mehr ein.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Cross-Platform-Copy/Paste funktioniert jetzt verlustfrei — kein Cleanup mehr nötig.
- **Version:** v2.1.119

### [Fix: Multi-Line-Paste im Kitty-Protocol]
- **Was:** Mehrzeilige Pastes in Terminals mit Kitty-Keyboard-Protocol verloren keine Newlines mehr.
- **Einsatz:** Automatisch aktiv in Kitty/Wezterm/Ghostty
- **Mehrwert:** Modern-Terminal-User können wieder zuverlässig mehrzeiligen Code einfügen.
- **Version:** v2.1.119

### [Fix: Glob/Grep verschwanden bei Bash-Deny]
- **Was:** Wenn Bash per Permissions verboten war, verschwanden irrtümlich auch `Glob`/`Grep` aus dem Tool-Katalog.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sichere Setups ohne Bash funktionieren jetzt normal — Datei-Suche bleibt verfügbar.
- **Version:** v2.1.119

### [Fix: Fullscreen-Scrolling springt nicht mehr nach unten]
- **Was:** Im Fullscreen-Modus sprang die Scroll-Position nach Tool-Ende nicht mehr automatisch an den Unterrand.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Review langer Tool-Outputs ohne ständiges Zurückscrollen.
- **Version:** v2.1.119

### [Fix: MCP-HTTP OAuth-Discovery]
- **Was:** MCP-HTTP-Verbindungen schlugen bei fehlerhaft-geformten OAuth-Discovery-Antworten nicht mehr fehl.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Robuster MCP-OAuth-Flow auch gegen minder-spec-konforme Server.
- **Version:** v2.1.119

### [Fix: Rewind-Overlay zeigte „(no prompt)" bei Bild-Messages]
- **Was:** Rewind-Overlay zeigte für Nachrichten mit Bildanhängen nicht mehr „(no prompt)", sondern den echten Prompt-Text.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Rewind über Multimodal-Messages bleibt les- und navigierbar.
- **Version:** v2.1.119

### [Fix: Auto-Mode überschrieb Plan-Mode]
- **Was:** Auto-Mode überstimmte Plan-Mode-Anweisungen nicht mehr bei widersprüchlicher Konfiguration.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Plan-Mode behält die Oberhand bei Konflikten — vorhersehbares Verhalten.
- **Version:** v2.1.119

### [Fix: Async `PostToolUse`-Hooks schrieben leere Transcript-Einträge]
- **Was:** Asynchrone `PostToolUse`-Hooks schrieben keine leeren Einträge mehr ins Transcript.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sauberer Conversation-Verlauf auch bei Async-Hooks.
- **Version:** v2.1.119

### [Tool-Search standardmäßig aus auf Vertex AI]
- **Was:** Auf Vertex AI ist Tool-Search per Default deaktiviert — Feature war dort nicht zuverlässig.
- **Einsatz:** Automatisch aktiv bei Vertex-Deploys
- **Mehrwert:** Keine irreführenden Fehler mehr bei Vertex-Kunden; bewusst aktivierbar, wenn gewünscht.
- **Version:** v2.1.119

### [Fix: `@-File`-Tab-Completion in Slash-Commands]
- **Was:** Tab-Completion für `@file`-Pfade in Slash-Commands ersetzte nicht mehr den ganzen Prompt, sondern nur das `@`-Token.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Dateipfade ergänzen, ohne den eingetippten Command zu verlieren.
- **Version:** v2.1.119

### [Fix: Stray `p` auf macOS-Terminal via Docker/SSH]
- **Was:** Der spurious `p`-Character beim Start in macOS Terminal.app über Docker/SSH taucht nicht mehr auf.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sauberer erster Frame auch in Remote-/Container-Workflows.
- **Version:** v2.1.119

### [Fix: `${ENV_VAR}` in MCP-Headers]
- **Was:** `${ENV_VAR}`-Platzhalter in MCP-Server-Headers werden jetzt korrekt aus der Umgebung substituiert.
- **Einsatz:** Automatisch aktiv; Header-Config mit `${MY_TOKEN}` nutzen
- **Mehrwert:** Secrets können via Env-Var injiziert werden, ohne in `.json`-Configs zu landen.
- **Version:** v2.1.119

### [Fix: MCP OAuth-Client-Secret beim Token-Exchange]
- **Was:** Der MCP OAuth-Client-Secret wurde beim Token-Exchange nicht mehr verschluckt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** OAuth-Server, die Client-Secret erwarten (Standard!), funktionieren jetzt zuverlässig.
- **Version:** v2.1.119

### [Fix: `/skills`-Enter füllt Command vor]
- **Was:** Enter im `/skills`-Dialog schließt nicht mehr den Dialog, sondern füllt den gewählten Skill als Command vor.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Intuitive Skill-Auswahl — genau das passiert, was man erwartet.
- **Version:** v2.1.119

### [Fix: `/agents` labelt Built-in-Tools nicht mehr als „Unrecognized"]
- **Was:** Im `/agents`-Menü tauchten Built-in-Tools, die gerade nicht verfügbar sind, fälschlich als „Unrecognized" auf.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Verwirrung bei Agent-Konfiguration — Tools werden korrekt kategorisiert.
- **Version:** v2.1.119

### [Fix: Plugin-MCP-Server starten auf Windows mit unvollständigem Cache]
- **Was:** MCP-Server aus Plugins spawnen jetzt auch dann, wenn der Plugin-Cache auf Windows partiell ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Windows-Setups bleiben funktional auch nach abgebrochenen Installs.
- **Version:** v2.1.119

### [Fix: `/export` zeigt Conversation-Model statt Current-Model]
- **Was:** `/export` dokumentiert jetzt das tatsächlich in der Conversation genutzte Modell, nicht das aktuell in der Session eingestellte.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Exportierte Transcripts sind historisch korrekt — wichtig für Audit/Repro.
- **Version:** v2.1.119

### [Fix: Verbose-Output persistiert über Restarts]
- **Was:** Das Verbose-Output-Setting überlebt jetzt Neustarts.
- **Einsatz:** Automatisch aktiv; Einstellung via `/config` oder Settings-Datei
- **Mehrwert:** Debugging-Preferences bleiben erhalten — keine Reconfiguration nach jedem Restart.
- **Version:** v2.1.119

### [Fix: `/usage`-Progress-Bars überlappen nicht mehr mit Labels]
- **Was:** Die Progress-Bars im `/usage`-Dashboard kollidieren optisch nicht mehr mit ihren Labels.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Usage-Zahlen sind in engen Terminals wieder lesbar.
- **Version:** v2.1.119

### [Fix: Plugin-MCP mit optionalen `${user_config.*}`-Referenzen]
- **Was:** Plugin-MCP-Server mit optionalen `${user_config.*}`-Placeholdern scheitern nicht mehr, wenn diese Felder leer sind.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Optional-Config-Felder bleiben optional — Plugins funktionieren auch ohne volle User-Config.
- **Version:** v2.1.119

### [Fix: List-Items mit Satzend-Zahlen brechen korrekt um]
- **Was:** Listen-Einträge, deren Text mit einer Zahl endet (z.B. „released v2.1.119"), brechen nicht mehr seltsam um.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kosmetisch — Output wirkt nicht mehr „gestört" bei Versions-Nennungen.
- **Version:** v2.1.119

### [Fix: `/plan open` greift auf existierenden Plan zu]
- **Was:** `/plan open` tut nichts mehr ins Leere, sondern öffnet tatsächlich den vorhandenen Plan.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Plan-Workflow funktioniert wie erwartet, inkl. Reopening aus Sessions.
- **Version:** v2.1.119

### [Fix: Skills nach Auto-Compaction]
- **Was:** Skills, die vor Auto-Compaction invoked wurden, laufen nicht mehr fälschlich bei der nächsten Message nochmal los.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabileres Skill-Verhalten bei langen Sessions mit Compaction.
- **Version:** v2.1.119

### [Fix: `/reload-plugins` und `/doctor` ignorieren disabled Plugins]
- **Was:** `/reload-plugins` und `/doctor` melden keine Load-Errors mehr für bewusst deaktivierte Plugins.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine falschen Warnungen bei absichtlich stillgelegten Plugins.
- **Version:** v2.1.119

### [Fix: Agent-Tool mit `isolation: "worktree"` nutzt keine stale Worktrees]
- **Was:** `Agent` mit `isolation: "worktree"` greift nicht mehr auf veraltete Worktrees zurück.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Parallele Agent-Runs in Worktrees bleiben sauber voneinander isoliert.
- **Version:** v2.1.119

### [Fix: Disabled MCP-Server nicht mehr als „failed"]
- **Was:** Deaktivierte MCP-Server zeigen nicht mehr „failed"-Status im Status-Panel.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Status-Übersicht bleibt aussagekräftig — echte Fehler heben sich visuell ab.
- **Version:** v2.1.119

### [Fix: `TaskList` gibt sortierte Tasks zurück]
- **Was:** `TaskList` liefert die Tasks in deterministischer Reihenfolge.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Reproduzierbare Todo-Übersichten — wichtig für UI-/Script-Nachverarbeitung.
- **Version:** v2.1.119

### [Fix: Keine falschen „GitHub API rate limit"-Hints]
- **Was:** Wenn PR-Titel eine Zahl enthalten (z.B. `#123`), triggert das keine fälschlichen Rate-Limit-Warnungen mehr.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger irreführende Error-Meldungen beim PR-Handling.
- **Version:** v2.1.119

### [Fix: SDK/Bridge-`read_file` enforced Größen-Cap bei wachsenden Dateien]
- **Was:** `read_file` im SDK/Bridge-Pfad respektiert jetzt auch bei Dateien, die während des Reads wachsen, das Size-Cap.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schutz gegen Memory-Blowup beim Lesen von Log-Dateien o.ä.
- **Version:** v2.1.119

### [Fix: PR-Verknüpfung zur Session in Git-Worktrees]
- **Was:** Wird ein PR aus einer Worktree-Session erzeugt, ist er jetzt korrekt mit dieser Session verlinkt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Session-↔-PR-Nachvollziehbarkeit auch für Multi-Worktree-Workflows.
- **Version:** v2.1.119

### [Fix: `/doctor` warnt nicht über überschriebene MCP-Einträge]
- **Was:** `/doctor` meldet keine spurious Warnings mehr, wenn MCP-Server-Configs via Override bewusst überschrieben werden.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Cleanere `/doctor`-Ausgabe bei legitimen Overrides.
- **Version:** v2.1.119

### [Fix: Windows — kein falscher „cmd /c wrapper"-Hinweis mehr]
- **Was:** Auf Windows wird der False-Positive-Hinweis „requires cmd /c wrapper" bei Bash-Kommandos unterdrückt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Windows-User bekommen nur echte Relevant-Warnings.
- **Version:** v2.1.119

### [Fix: VSCode — Voice-Dictation während Permission-Prompt]
- **Was:** Voice-Dictation auf macOS erzeugt nicht mehr leeren Output, wenn ein Permission-Prompt offen ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Diktat-Workflows bleiben funktional auch bei Consent-Dialogen.
- **Version:** v2.1.119

---

### Woche 17 (23. April 2026) — v2.1.118

---

### [Vim Visual Mode (`v` / `V`)]
- **Was:** Vim-Keybindings im Prompt-Input bekommen Visual Mode (`v`) und Visual-Line Mode (`V`) mit Selektion, Operatoren und visuellem Feedback.
- **Einsatz:** In Vim-Mode `v` oder `V` drücken, dann navigieren und Operatoren (`d`, `y`, `c` …) anwenden
- **Mehrwert:** Vertrautes Vim-Editing auch für Block- und Zeilen-Operationen — deutlich schneller beim Umbauen längerer Prompts.
- **Version:** v2.1.118

### [`/cost` und `/stats` → `/usage`]
- **Was:** Die Befehle `/cost` und `/stats` sind in `/usage` zusammengeführt; beide bleiben als Tipp-Shortcuts erhalten und öffnen jeweils den passenden Tab.
- **Einsatz:** `/usage` aufrufen — oder wie gewohnt `/cost` / `/stats` tippen
- **Mehrwert:** Ein einheitliches Dashboard statt zwei getrennter Ansichten; weniger Kontextwechsel bei Nutzungs-Checks.
- **Version:** v2.1.118

### [Benannte Custom-Themes via `/theme`]
- **Was:** Eigene Themes lassen sich jetzt über `/theme` anlegen, benennen und wechseln; alternativ per JSON in `~/.claude/themes/`. Plugins können eigene Themes über ein `themes/`-Verzeichnis ausliefern.
- **Einsatz:** `/theme` → Custom Theme erstellen; oder JSON-Datei unter `~/.claude/themes/<name>.json` hinterlegen
- **Mehrwert:** Teams/Plugins können konsistente Look-and-Feels verteilen; individuelles Tuning ohne Patchen der Core-Themes.
- **Version:** v2.1.118

### [Hooks können MCP-Tools direkt aufrufen (`type: "mcp_tool"`)]
- **Was:** Hooks können jetzt MCP-Tools direkt via `type: "mcp_tool"` ansprechen — ohne Umweg über Bash oder Wrapper-Skripte.
- **Einsatz:** Hook-Config mit `type: "mcp_tool"` + Tool-Name + Parameter definieren
- **Mehrwert:** Hooks werden zu vollwertigen Automations — z.B. beim Stop-Event automatisch eine MCP-Aktion auslösen, ohne Shell-Shim.
- **Version:** v2.1.118

### [`DISABLE_UPDATES` Env-Var blockt auch manuelle Updates]
- **Was:** Neue Env-Var `DISABLE_UPDATES` blockiert alle Update-Pfade, inklusive manuellem `claude update` — strenger als `DISABLE_AUTOUPDATER`.
- **Einsatz:** `export DISABLE_UPDATES=1` im Shell-Profil setzen
- **Mehrwert:** Harte Version-Pins für Enterprise- oder Air-gapped-Setups — keine Updates mehr, egal wie sie angestoßen werden.
- **Version:** v2.1.118

### [WSL erbt Windows-Managed-Settings via `wslInheritsWindowsSettings`]
- **Was:** WSL auf Windows kann Managed-Settings von der Windows-Seite übernehmen, wenn die Policy `wslInheritsWindowsSettings` gesetzt ist.
- **Einsatz:** Policy-Key `wslInheritsWindowsSettings` in `managed-settings.json` aktivieren
- **Mehrwert:** Eine zentrale Corporate-Policy deckt Windows- und WSL-Nutzung ab; keine Doppelpflege mehr.
- **Version:** v2.1.118

### [Auto-Mode: `"$defaults"` erweitert Regeln statt sie zu ersetzen]
- **Was:** In `autoMode.allow`, `autoMode.soft_deny` und `autoMode.environment` kann man `"$defaults"` einschließen, um eigene Regeln *zusätzlich* zur Built-in-Liste zu führen.
- **Einsatz:** `autoMode.allow: ["$defaults", "custom rule …"]`
- **Mehrwert:** Custom-Policies erweitern die sicheren Defaults, ohne sie komplett ersetzen zu müssen — weniger Risiko, Sicherheits-Regeln zu verlieren.
- **Version:** v2.1.118

### [Auto-Mode Opt-in: "Don't ask again"]
- **Was:** Der Auto-Mode Opt-in-Prompt bietet eine "Don't ask again"-Option.
- **Einsatz:** Beim ersten Auto-Mode-Prompt die Option wählen
- **Mehrwert:** Einmaliger Consent statt wiederholter Rückfragen — angenehmer für Nutzer, die Auto-Mode bewusst aktiviert haben.
- **Version:** v2.1.118

### [`claude plugin tag` für Release-Tags mit Version-Validierung]
- **Was:** Neuer Befehl `claude plugin tag` erzeugt Git-Release-Tags für Plugins inklusive Versions-Validierung.
- **Einsatz:** Im Plugin-Repo `claude plugin tag` ausführen
- **Mehrwert:** Sauberer Plugin-Release-Workflow aus dem CLI heraus — fehlerhafte Versions-Strings werden abgefangen, bevor Tags rausgehen.
- **Version:** v2.1.118

### [`--continue` / `--resume` finden Sessions mit `/add-dir`]
- **Was:** `--continue` und `--resume` finden jetzt auch Sessions, deren aktuelles Verzeichnis nur via `/add-dir` hinzugefügt wurde.
- **Einsatz:** `claude --continue` oder `claude --resume` aus einem Verzeichnis starten, das ursprünglich über `/add-dir` eingebunden wurde
- **Mehrwert:** Keine verlorenen Sessions mehr bei Multi-Directory-Workflows — das richtige Verzeichnis reicht zum Wiederaufnehmen.
- **Version:** v2.1.118

### [`/color` synchronisiert Accent-Farbe mit claude.ai/code]
- **Was:** `/color` überträgt die Session-Accent-Farbe an claude.ai/code, wenn Remote Control verbunden ist.
- **Einsatz:** `/color <farbe>` bei aktivem Remote Control
- **Mehrwert:** Session-Identität (z.B. prod vs. dev) ist auch im Web-UI sofort sichtbar — weniger Verwechslungen bei parallelen Sessions.
- **Version:** v2.1.118

### [`/model`-Picker respektiert `ANTHROPIC_DEFAULT_*`-Overrides bei Custom-Gateways]
- **Was:** Der `/model`-Picker berücksichtigt jetzt `ANTHROPIC_DEFAULT_*_MODEL_NAME` und `_DESCRIPTION`-Overrides, auch wenn ein Custom-`ANTHROPIC_BASE_URL`-Gateway genutzt wird.
- **Einsatz:** Env-Vars wie `ANTHROPIC_DEFAULT_OPUS_MODEL_NAME` mit Custom-Gateway kombinieren
- **Mehrwert:** Eigene Proxy-/Gateway-Setups zeigen korrekte Modellnamen — kein "unknown model" mehr im Picker.
- **Version:** v2.1.118

### [Skipped-Plugin-Updates sichtbar in `/doctor` und `/plugin` Errors]
- **Was:** Wenn Auto-Update ein Plugin wegen einer Versions-Constraint eines anderen Plugins überspringt, erscheint der Skip jetzt in `/doctor` und im `/plugin`-Errors-Tab.
- **Einsatz:** Automatisch aktiv; `/doctor` oder `/plugin` → Errors öffnen
- **Mehrwert:** Keine stillen Update-Ausfälle mehr — Dependency-Konflikte werden sichtbar diagnostizierbar.
- **Version:** v2.1.118

### [Fix: `/mcp` versteckte OAuth-Actions bei `headersHelper`]
- **Was:** Im `/mcp`-Menü fehlten die OAuth-Authenticate/Re-authenticate-Actions für Server mit `headersHelper`; HTTP/SSE-MCP-Server mit Custom-Headern blieben nach transient-401 in "needs authentication" hängen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** MCP-Auth-Flows funktionieren zuverlässig auch mit Custom-Header-Setups.
- **Version:** v2.1.118

### [Fix: MCP ohne `expires_in` erzwang stündliche Re-Auth]
- **Was:** MCP-Server, deren OAuth-Token-Response kein `expires_in` liefert, forderten bisher stündlich eine Re-Authentifizierung.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Nahtlose MCP-Nutzung auch bei minimalen OAuth-Responses — keine ständigen Login-Unterbrechungen.
- **Version:** v2.1.118

### [Fix: MCP Step-up Auth prompt bei `insufficient_scope`]
- **Was:** MCP-Step-up-Authorization refreshte bisher stumm, wenn der Server per `insufficient_scope`-403 einen Scope nannte, den das Token bereits hatte — jetzt gibt es einen Re-Consent-Prompt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Korrektes OAuth-Verhalten — der User bekommt die Zustimmungs-Aufforderung, die der Protokoll-Standard vorsieht.
- **Version:** v2.1.118

### [Fix: Unhandled Promise-Rejection bei MCP-OAuth Timeout/Cancel]
- **Was:** Wenn der OAuth-Flow eines MCP-Servers timeoutet oder gecancelt wird, gibt es keine Unhandled Promise Rejection mehr.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabile Session auch bei fehlgeschlagener MCP-Auth — kein Crash, kein Log-Rauschen.
- **Version:** v2.1.118

### [Fix: MCP-OAuth-Refresh respektiert Cross-Process-Lock]
- **Was:** MCP-OAuth-Refresh lief bisher unter Contention auch ohne Cross-Process-Lock — das ist behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Mehrere parallele Claude-Instanzen kollidieren nicht mehr bei Token-Refresh — sauberes Locking über Prozesse hinweg.
- **Version:** v2.1.118

### [Fix: macOS-Keychain Race beim MCP-Token-Refresh]
- **Was:** Ein Race auf der macOS-Keychain führte dazu, dass ein paralleler MCP-Token-Refresh ein frisch refreshtes OAuth-Token überschreiben konnte — mit fälschlichem "Please run /login".
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine mysteriösen Logout-Aufforderungen mehr auf macOS bei aktiven MCP-Sessions.
- **Version:** v2.1.118

### [Fix: OAuth-Refresh bei server-seitig früh-revozierten Tokens]
- **Was:** OAuth-Token-Refresh schlug fehl, wenn der Server ein Token vor dessen lokaler Ablaufzeit revozierte.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Robusteres Login-Handling — Revocations serverseitig führen nicht mehr zu Crash-Refresh.
- **Version:** v2.1.118

### [Fix: Credential-Save-Crash korrumpierte `.credentials.json`]
- **Was:** Ein Crash beim Speichern von Credentials konnte auf Linux/Windows die Datei `~/.claude/.credentials.json` korrumpieren.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine zerschossenen Credential-Dateien mehr — kein Repair-Aufwand nach Crashes.
- **Version:** v2.1.118

### [Fix: `/login` in Sessions mit gesetztem `CLAUDE_CODE_OAUTH_TOKEN`]
- **Was:** `/login` wirkte bisher nicht, wenn die Session mit einem gesetzten `CLAUDE_CODE_OAUTH_TOKEN` gestartet wurde — das Env-Token wird jetzt gelöscht, damit Disk-Credentials greifen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** `/login` tut zuverlässig das Erwartete — auch in Env-basierten Setups.
- **Version:** v2.1.118

### [Fix: Lesbarkeit von "new messages"-Pille und `/plugin`-Badges]
- **Was:** Der Text in der "new messages"-Scroll-Pille und in `/plugin`-Badges war schwer lesbar.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Bessere UI-Lesbarkeit — kein Augen-Kneifen bei Scroll- und Plugin-Ansichten.
- **Version:** v2.1.118

### [Fix: Plan-Dialog mit `--dangerously-skip-permissions`]
- **Was:** Der Plan-Acceptance-Dialog bot fälschlich "auto mode" statt "bypass permissions" an, wenn Claude mit `--dangerously-skip-permissions` lief.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Dialog-Text matcht den tatsächlich aktiven Modus — keine Missverständnisse beim Accept.
- **Version:** v2.1.118

### [Fix: Agent-Hooks auf anderen Events als `Stop`/`SubagentStop`]
- **Was:** Agent-Type-Hooks schlugen mit "Messages are required for agent hooks" fehl, wenn sie für andere Events als `Stop`/`SubagentStop` konfiguriert waren.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Agent-Hooks lassen sich auf beliebigen Events nutzen — deutlich flexiblerer Automations-Baukasten.
- **Version:** v2.1.118

### [Fix: `prompt`-Hooks feuern nicht auf Verifier-Subagent-Tool-Calls]
- **Was:** `prompt`-Hooks feuerten bisher nochmal bei Tool-Calls eines Agent-Hook-Verifier-Subagents — das ist behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine rekursiven Hook-Trigger mehr — Verifier-Subagents stören den Hook-Flow nicht.
- **Version:** v2.1.118

### [Fix: `/fork` speichert Pointer statt vollständige Parent-Konversation]
- **Was:** `/fork` schrieb bisher die komplette Parent-Konversation pro Fork auf Disk — jetzt wird ein Pointer geschrieben und beim Lesen hydratisiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich weniger Disk-Verbrauch und schnellere Forks — besonders bei langen Sessions.
- **Version:** v2.1.118

### [Fix: Alt+K / Alt+X / Alt+^ / Alt+_ fror Keyboard-Input ein]
- **Was:** Die Tasten-Kombos Alt+K / Alt+X / Alt+^ / Alt+_ froren den Keyboard-Input ein.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine versehentlichen UI-Lockups mehr durch exotische Alt-Kombos.
- **Version:** v2.1.118

### [Fix: Remote-Session überschrieb lokales `model`-Setting nicht mehr]
- **Was:** Connecten auf eine Remote-Session überschrieb bisher das lokale `model`-Setting in `~/.claude/settings.json`.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lokale Modell-Präferenzen bleiben bestehen, egal welche Remote-Session man nutzt.
- **Version:** v2.1.118

### [Fix: Typeahead "No commands match" beim Einfügen von `/`-Pfaden]
- **Was:** Der Typeahead zeigte "No commands match", wenn man Dateipfade einfügte, die mit `/` beginnen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Pfade im Prompt-Input einfügen ohne nervigen False-Positive-Error.
- **Version:** v2.1.118

### [Fix: `plugin install` re-resolvt falsche Dependency-Version]
- **Was:** `plugin install` auf einem bereits installierten Plugin löste eine in falscher Version installierte Dependency nicht mehr auf — das ist behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Plugin-Ökosystem bleibt konsistent — keine hängen gebliebenen Fehl-Versionen nach Neu-Installs.
- **Version:** v2.1.118

### [Fix: File-Watcher crasht nicht bei invaliden Pfaden / fd-Exhaustion]
- **Was:** Unhandled Errors vom File-Watcher bei invaliden Pfaden oder File-Descriptor-Erschöpfung sind behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabilere Langläufer-Sessions in großen Projekten mit vielen watched Paths.
- **Version:** v2.1.118

### [Fix: Remote-Control-Sessions überleben CCR-JWT-Refresh-Blips]
- **Was:** Remote-Control-Sessions wurden bei transienten CCR-Init-Blips während JWT-Refresh archiviert — das ist behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Remote-Sessions bleiben auch bei kurzen Netz-/Auth-Hickups verbunden.
- **Version:** v2.1.118

### [Fix: Per `SendMessage` fortgeführte Subagents restaurieren `cwd`]
- **Was:** Subagents, die per `SendMessage` fortgeführt wurden, restaurierten den beim Spawn expliziten `cwd` nicht — das ist behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Korrektes Working-Directory-Verhalten bei fortgesetzten Subagents — keine überraschenden Pfad-Fehler.
- **Version:** v2.1.118

### [Blog-Ankündigung: "New connectors in Claude for everyday life" (2026-04-23)]
- **Was:** Neue Connectors für claude.ai speziell für Alltagsaufgaben werden eingeführt (Details im Blog-Post).
- **Einsatz:** Über claude.ai → Connectors aktivieren; betrifft primär die Produktseite, nicht Claude Code CLI
- **Mehrwert:** Breitere Integration in Alltags-Workflows — für Claude Code relevant, soweit diese Connectors später auch im CLI via MCP/Plugins erscheinen.
- **Version:** Ankündigung 2026-04-23

### [Built-in Memory für Claude Managed Agents (Public Beta)]
- **Was:** Claude Managed Agents bekommen eingebautes, persistentes Gedächtnis. Memories werden als Dateien in einem sandboxed Filesystem abgelegt — der Agent greift via Bash/Code-Execution darauf zu, Memories sind via API exportierbar, scoped und auditierbar.
- **Einsatz:** Managed Agent über Claude Console / `ant` CLI deployen; Memory ist standardmäßig aktiv. Doku unter `platform.claude.com/docs/en/managed-agents/memory`.
- **Mehrwert:** Kein eigener Retrieval-Layer mehr nötig — Agents lernen über Sessions hinweg, machen weniger Wiederholungsfehler (Anthropic nennt einen Kunden mit „97 % weniger First-Pass-Errors"). Workspace-scoped Boundaries halten Daten sauber getrennt.
- **Version:** Platform-Ankündigung 2026-04-23 (public beta)

---

### Woche 17 (22. April 2026) — v2.1.117

---

### [Forked Subagents auf externen Builds]
- **Was:** Forked Subagents können jetzt auch in externen (Nicht-Anthropic-) Builds aktiviert werden.
- **Einsatz:** Umgebungsvariable `CLAUDE_CODE_FORK_SUBAGENT=1` setzen
- **Mehrwert:** Community-Builds und Enterprise-Forks bekommen Zugriff auf parallele Subagenten, bisher nur offiziellen Builds vorbehalten.
- **Version:** v2.1.117

### [Agent-Frontmatter `mcpServers` für Main-Thread-Sessions]
- **Was:** Im Agent-Frontmatter deklarierte `mcpServers` werden jetzt auch geladen, wenn der Agent über `--agent` als Main-Thread-Session gestartet wird.
- **Einsatz:** `claude --agent <name>` mit MCP-Servern im Frontmatter
- **Mehrwert:** Agent-Definitionen sind portabler — ein Agent bringt seine MCP-Server mit, egal ob als Subagent oder Main-Session.
- **Version:** v2.1.117

### [`/model` Auswahl überlebt Neustart]
- **Was:** Das über `/model` gewählte Modell bleibt über Session-Neustarts hinweg erhalten, selbst wenn das Projekt ein anderes Modell pinnt. Der Startup-Header zeigt an, ob das aktive Modell aus Projekt- oder Managed-Settings stammt.
- **Einsatz:** `/model` einmal setzen — bleibt persistent
- **Mehrwert:** Kein wiederholtes Umstellen auf das Wunsch-Modell bei jedem Session-Start; Transparenz über die Quelle des Pins.
- **Version:** v2.1.117

### [`/resume` bietet Zusammenfassung alter großer Sessions]
- **Was:** Bei sehr großen, alten Sessions schlägt `/resume` vor, eine Zusammenfassung zu erstellen, statt die ganze Session neu einzulesen (analog `--resume`).
- **Einsatz:** `/resume` auf einer alten, großen Session aufrufen und Angebot annehmen
- **Mehrwert:** Alte Projekt-Sessions lassen sich ohne Wartezeit und ohne Kontext-Overflow fortsetzen.
- **Version:** v2.1.117

### [Paralleles MCP-Server-Connect als Default]
- **Was:** Lokale und claude.ai-MCP-Server werden jetzt standardmäßig parallel verbunden, wenn beides konfiguriert ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar schnellerer Startup in Hybrid-Setups mit Remote- und lokalen MCP-Servern.
- **Version:** v2.1.117

### [`plugin install` ergänzt fehlende Dependencies]
- **Was:** Ein erneutes `plugin install` auf einem bereits installierten Plugin bricht nicht mehr ab, sondern installiert fehlende Dependencies nach. `claude plugin marketplace add` löst fehlende Dependencies automatisch auf.
- **Einsatz:** `plugin install <name>` erneut ausführen — Dependencies werden nachgezogen
- **Mehrwert:** Selbstheilende Plugin-Umgebung ohne manuelles Uninstall/Reinstall.
- **Version:** v2.1.117

### [Managed-Settings: `blockedMarketplaces` / `strictKnownMarketplaces` strikter durchgesetzt]
- **Was:** Die Managed-Settings `blockedMarketplaces` und `strictKnownMarketplaces` greifen jetzt bei Install, Update, Refresh und Autoupdate — nicht nur beim ersten Add.
- **Einsatz:** In `managed-settings.json` setzen; wird automatisch bei allen Plugin-Ops durchgesetzt
- **Mehrwert:** Enterprise-Admins können Marketplace-Policies zuverlässig durchziehen, ohne Schlupflöcher bei Updates.
- **Version:** v2.1.117

### [Advisor-Tool (experimentell) mit klarer Kennzeichnung]
- **Was:** Der Advisor-Tool-Dialog zeigt jetzt ein "experimental"-Label plus Learn-More-Link; beim Start gibt es eine Benachrichtigung, wenn das Tool aktiv ist. Der Fehler "Advisor tool result content could not be processed" bei jedem Prompt ist behoben.
- **Einsatz:** Advisor-Tool aktivieren; Hinweise erscheinen automatisch
- **Mehrwert:** Transparenter Umgang mit experimentellen Features — kein Rätselraten mehr, was aktiv ist.
- **Version:** v2.1.117

### [`cleanupPeriodDays` räumt auch tasks/shell-snapshots/backups auf]
- **Was:** Die `cleanupPeriodDays`-Aufräumroutine deckt jetzt auch `~/.claude/tasks/`, `~/.claude/shell-snapshots/` und `~/.claude/backups/` ab.
- **Einsatz:** `cleanupPeriodDays` in Settings setzen — wirkt automatisch weiter
- **Mehrwert:** Claude-Home-Verzeichnis bleibt schlank; keine manuellen Putz-Aktionen für Snapshots und Backups nötig.
- **Version:** v2.1.117

### [Native Builds: `Glob` und `Grep` als embedded bfs/ugrep]
- **Was:** Auf macOS- und Linux-Native-Builds werden die `Glob`- und `Grep`-Tools durch eingebettete `bfs`- und `ugrep`-Binaries via Bash-Tool ersetzt. Windows- und npm-installierte Builds unverändert.
- **Einsatz:** Automatisch aktiv auf Native-Builds
- **Mehrwert:** Schnellere Suchen ohne separaten Tool-Round-Trip; weniger Latenz bei Datei-Exploration.
- **Version:** v2.1.117

### [Windows: `where.exe`-Lookups werden gecacht]
- **Was:** Auf Windows werden `where.exe`-Executable-Lookups pro Prozess zwischengespeichert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich schnellere Subprocess-Starts auf Windows — insbesondere bei vielen Bash-/Tool-Aufrufen.
- **Version:** v2.1.117

### [Default Effort `high` für Pro/Max auf Opus 4.6 & Sonnet 4.6]
- **Was:** Pro- und Max-Subscriber laufen auf Opus 4.6 und Sonnet 4.6 jetzt standardmäßig mit Effort-Level `high` (vorher `medium`).
- **Einsatz:** Automatisch aktiv für Pro/Max
- **Mehrwert:** Bessere Antwortqualität out-of-the-box, ohne dass man `/effort high` manuell setzen muss.
- **Version:** v2.1.117

### [OpenTelemetry: `command_name` / `command_source` in user_prompt Events]
- **Was:** `user_prompt`-Events enthalten jetzt `command_name` und `command_source`, wenn ein Slash-Command genutzt wurde. Custom/MCP-Command-Namen sind standardmäßig redacted (außer mit `OTEL_LOG_TOOL_DETAILS=1`).
- **Einsatz:** OTEL-Export aktiv; Felder erscheinen automatisch in Telemetrie-Events
- **Mehrwert:** Bessere Observability über Slash-Command-Nutzung, ohne sensible Custom-Command-Namen zu leaken.
- **Version:** v2.1.117

### [OpenTelemetry: `effort`-Attribut in Cost/Token/API-Events]
- **Was:** `cost.usage`, `token.usage`, `api_request` und `api_error` enthalten jetzt ein `effort`-Attribut (sofern vom Modell unterstützt).
- **Einsatz:** Automatisch aktiv bei OTEL-Export
- **Mehrwert:** Kostenanalyse kann jetzt nach Effort-Level gruppiert werden — nützlich fürs Controlling.
- **Version:** v2.1.117

### [Fix: Plain-CLI OAuth-Sessions refreshen Token reaktiv auf 401]
- **Was:** OAuth-Sessions im Plain-CLI sterben nicht mehr mit "Please run /login", sondern refreshen das Token reaktiv bei 401.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine Unterbrechungen mehr durch abgelaufene Tokens mitten in der Arbeit.
- **Version:** v2.1.117

### [Fix: `WebFetch` hängt nicht mehr bei sehr großen HTML-Seiten]
- **Was:** Input wird vor der HTML-zu-Markdown-Konvertierung gekürzt, damit `WebFetch` nicht mehr auf riesigen Seiten hängt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Recherche-Workflows mit großen Dokumentations-Seiten laufen zuverlässig durch.
- **Version:** v2.1.117

### [Fix: Klare Fehlermeldung bei HTTP 204 vom Proxy]
- **Was:** Wenn ein Proxy HTTP 204 No Content zurückgibt, gibt es jetzt eine klare Fehlermeldung statt eines `TypeError`.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Einfachere Diagnose bei Proxy-Problemen in Corporate-Netzwerken.
- **Version:** v2.1.117

### [Fix: `/login` mit abgelaufenem `CLAUDE_CODE_OAUTH_TOKEN`]
- **Was:** `/login` funktioniert jetzt auch, wenn die Env-Variable `CLAUDE_CODE_OAUTH_TOKEN` mit abgelaufenem Token gesetzt ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein Env-Cleanup mehr nötig, um sich neu einzuloggen.
- **Version:** v2.1.117

### [Fix: Prompt-Input-Undo (Ctrl+_) direkt nach Eingabe]
- **Was:** `Ctrl+_` (Undo) funktioniert jetzt auch unmittelbar nach einer Eingabe.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Flüssige Text-Editierung im Prompt-Input, ohne Zwischenschritte.
- **Version:** v2.1.117

### [Fix: `NO_PROXY` wird unter Bun respektiert]
- **Was:** Remote-API-Requests unter der Bun-Runtime beachten jetzt die `NO_PROXY`-Env-Variable.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Korrektes Proxy-Bypass-Verhalten in Bun-basierten Setups — wichtig für Intranet-APIs.
- **Version:** v2.1.117

### [Fix: Spurious Escape/Return-Trigger bei langsamen Verbindungen]
- **Was:** Bei langsamen Verbindungen werden keine versehentlichen Escape- oder Return-Ereignisse mehr ausgelöst.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabileres Verhalten über SSH oder schwache WLAN-Verbindungen.
- **Version:** v2.1.117

### [Fix: SDK `reload_plugins` verbindet MCP-Server parallel]
- **Was:** SDK-`reload_plugins` verbindet User-MCP-Server jetzt parallel statt seriell.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schnellerer Plugin-Reload in SDK-getriebenen Integrationen.
- **Version:** v2.1.117

### [Fix: Bedrock-Requests mit Opus 4.7 ohne Thinking]
- **Was:** Bedrock-Requests mit Opus 4.7 und deaktiviertem Thinking schlagen nicht mehr fehl.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** AWS-Bedrock-Nutzer können Opus 4.7 auch ohne Extended Thinking zuverlässig einsetzen.
- **Version:** v2.1.117

### [Fix: MCP `elicitation/create` im Print/SDK-Mode]
- **Was:** MCP-`elicitation/create`-Requests werden im Print-/SDK-Modus nicht mehr automatisch gecancelt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Interaktive MCP-Tools funktionieren jetzt auch in nicht-interaktiven Pipelines.
- **Version:** v2.1.117

### [Fix: Subagents mit anderem Modell zeigen keine falschen Malware-Warnungen]
- **Was:** Subagents, die ein anderes Modell nutzen, lösen keine falschen Malware-Warnungen mehr aus.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Schreckmomente bei Multi-Modell-Agent-Setups.
- **Version:** v2.1.117

### [Fix: Idle Re-Render Loop mit Background-Tasks]
- **Was:** Speicherwachstum durch eine Idle-Re-Render-Schleife bei laufenden Background-Tasks ist behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabile Speichernutzung in langen Sessions mit parallelen Background-Agents.
- **Version:** v2.1.117

### [Fix: VSCode "Manage Plugins"-Panel mit großen Marketplaces]
- **Was:** Das "Manage Plugins"-Panel in VSCode bricht nicht mehr bei Marketplaces mit vielen Plugins.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Plugin-Verwaltung bleibt auch in Enterprise-Setups mit großem Marketplace nutzbar.
- **Version:** v2.1.117

### [Fix: Opus 4.7 `/context`-Prozentsatz rechnet mit 1M-Fenster]
- **Was:** Opus 4.7 zeigt in `/context` korrekte Prozentsätze basierend auf dem 1M-Kontext-Fenster statt fälschlich mit 200K zu rechnen.
- **Einsatz:** `/context` bei Opus 4.7 nutzen
- **Mehrwert:** Verlässliche Kontext-Auslastungsanzeige — wichtig, um das 1M-Fenster nicht ungewollt zu sprengen.
- **Version:** v2.1.117

---

### Woche 17 (20. April 2026) — v2.1.116

---

### [/resume auf großen Sessions bis zu 67% schneller]
- **Was:** `/resume` bei Sessions über 40 MB läuft deutlich schneller (bis zu 67%) und verarbeitet Sessions mit vielen Dead-Fork-Einträgen effizienter.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lange laufende Projekt-Sessions lassen sich ohne spürbare Wartezeit fortsetzen — auch bei massivem Verlauf.
- **Version:** v2.1.116

### [Schnellerer MCP-Startup bei mehreren stdio-Servern]
- **Was:** MCP-Startup ist spürbar schneller, wenn mehrere stdio-Server konfiguriert sind; `resources/templates/list` wird erst beim ersten `@`-Mention aufgerufen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kürzere Startzeit bei umfangreichen MCP-Setups — kein Warten mehr beim Session-Start.
- **Version:** v2.1.116

### [Glatteres Fullscreen-Scrolling in VS Code / Cursor / Windsurf]
- **Was:** Fullscreen-Scrolling in den integrierten Terminals von VS Code, Cursor und Windsurf ist flüssiger; `/terminal-setup` konfiguriert die Scroll-Sensitivität des Editors mit.
- **Einsatz:** `/terminal-setup` ausführen; Scroll-Verbesserungen automatisch aktiv
- **Mehrwert:** Deutlich angenehmeres Navigieren in IDE-Terminals — keine ruckeligen Sprünge beim Scrollen mehr.
- **Version:** v2.1.116

### [Thinking-Spinner mit Inline-Progress-Hinweisen]
- **Was:** Der Thinking-Spinner zeigt seinen Status inline an ("still thinking", "thinking more", "almost done thinking") statt über eine separate Hinweis-Zeile.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kompakterer Output und besseres Gefühl für den Fortschritt bei langen Denkphasen.
- **Version:** v2.1.116

### [/config Search matcht auch Option-Values]
- **Was:** Die Suche in `/config` trifft jetzt auch Werte einzelner Optionen — z.B. findet `vim` die Editor-Mode-Einstellung.
- **Einsatz:** In `/config` nach einem Wert statt nach dem Options-Namen suchen
- **Mehrwert:** Settings schneller finden, auch wenn man nur den gewünschten Wert im Kopf hat.
- **Version:** v2.1.116

### [/doctor öffnen während Claude antwortet]
- **Was:** `/doctor` kann jetzt aufgerufen werden, während Claude gerade noch antwortet, ohne auf das Ende des Turns warten zu müssen.
- **Einsatz:** `/doctor` jederzeit ausführen
- **Mehrwert:** Setup-Probleme sofort diagnostizieren — auch mitten in einer laufenden Antwort.
- **Version:** v2.1.116

### [/reload-plugins installiert fehlende Dependencies]
- **Was:** `/reload-plugins` und der Background-Auto-Update-Mechanismus installieren jetzt fehlende Plugin-Dependencies aus bereits hinzugefügten Marketplaces automatisch nach.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Plugin-Updates und -Reloads funktionieren ohne manuelle Dependency-Installation.
- **Version:** v2.1.116

### [Bash-Tool Hint bei GitHub API Rate Limit]
- **Was:** Das Bash-Tool zeigt einen Hinweis, wenn `gh`-Befehle in GitHubs API-Rate-Limit laufen — Agents können zurückskalieren statt blind zu wiederholen.
- **Einsatz:** Automatisch aktiv bei `gh`-Befehlen
- **Mehrwert:** Kein Requests-Sturm mehr bei Rate-Limits; Agents reagieren sinnvoll auf API-Drosselung.
- **Version:** v2.1.116

### [Usage-Tab zeigt 5h- und Wochen-Nutzung sofort]
- **Was:** Der Usage-Tab in den Settings zeigt 5-Stunden- und wöchentliche Nutzung sofort an und scheitert nicht mehr, wenn der Usage-Endpoint selbst rate-limited ist.
- **Einsatz:** Settings → Usage öffnen
- **Mehrwert:** Verlässlicher Blick auf Verbrauch — selbst dann, wenn der Backend-Endpoint unter Last steht.
- **Version:** v2.1.116

### [Agent frontmatter hooks feuern bei `--agent`]
- **Was:** Die in der Agent-Frontmatter deklarierten `hooks:` werden jetzt auch ausgelöst, wenn der Agent als Main-Thread-Agent über `--agent` läuft.
- **Einsatz:** `hooks:` in Agent-Frontmatter definieren; `claude --agent <name>` startet
- **Mehrwert:** Konsistentes Hook-Verhalten unabhängig davon, ob der Agent als Subagent oder als Main-Thread läuft.
- **Version:** v2.1.116

### [Slash-Command-Menu: "No commands match"]
- **Was:** Das Slash-Command-Menu zeigt "No commands match", wenn der Filter keine Treffer hat, statt einfach zu verschwinden.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Klares Feedback bei Tippfehlern oder nicht existierenden Befehlen — kein Rätselraten mehr.
- **Version:** v2.1.116

### [Security: Sandbox auto-allow umgeht keinen dangerous-path Check mehr]
- **Was:** Sandbox auto-allow umgeht nicht mehr den dangerous-path Safety-Check für `rm`/`rmdir` mit Zielen `/`, `$HOME` oder anderen kritischen System-Verzeichnissen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Auto-Allow darf nicht mehr `rm -rf /` oder ähnlich Katastrophales durchwinken — harte Safety-Grenze bleibt bestehen.
- **Version:** v2.1.116

### [Fix: Devanagari/Indic-Scripts Column-Alignment]
- **Was:** Devanagari und andere indische Schriften wurden im Terminal-UI mit fehlerhafter Spaltenausrichtung gerendert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Korrekte Darstellung für indische Sprachen — kein zerschossenes Layout mehr bei Hindi, Sanskrit etc.
- **Version:** v2.1.116

### [Fix: Ctrl+- Undo mit Kitty-Keyboard-Protocol]
- **Was:** `Ctrl+-` löste in Terminals mit Kitty-Keyboard-Protocol (iTerm2, Ghostty, kitty, WezTerm, Windows Terminal) kein Undo aus.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Undo-Shortcut funktioniert jetzt zuverlässig in modernen Terminals mit erweiterten Keyboard-Events.
- **Version:** v2.1.116

### [Fix: Cmd+Left/Right Line-Navigation in Kitty-Protokoll-Terminals]
- **Was:** `Cmd+Left`/`Cmd+Right` sprangen in Terminals mit Kitty-Keyboard-Protocol (Warp Fullscreen, kitty, Ghostty, WezTerm) nicht an Zeilenanfang/-ende.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Gewohnte macOS-Zeilen-Navigation funktioniert auch in modernen Terminal-Emulatoren.
- **Version:** v2.1.116

### [Fix: Ctrl+Z Hang via Wrapper-Prozesse]
- **Was:** `Ctrl+Z` hing das Terminal ein, wenn Claude Code über einen Wrapper (`npx`, `bun run`) gestartet wurde.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Suspend/Resume funktioniert auch bei Wrapper-Launch — kein Reboot-Bedarf mehr nach versehentlichem `Ctrl+Z`.
- **Version:** v2.1.116

### [Fix: Scrollback-Duplikation im Inline-Modus]
- **Was:** Im Inline-Modus wurden frühere Konversations-Segmente wiederholt, wenn das Terminal skaliert oder große Output-Bursts gerendert wurden.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sauberer Scrollback — keine Duplikate mehr bei Resize oder großem Output.
- **Version:** v2.1.116

### [Fix: Modal-Search-Dialogs bei kurzer Terminal-Höhe]
- **Was:** Modal-Search-Dialogs lief bei kurzer Terminal-Höhe über den Bildschirmrand — Such-Box und Keyboard-Hints wurden versteckt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Such-UI bleibt benutzbar auch in kleinen/geteilten Terminal-Fenstern.
- **Version:** v2.1.116

### [Fix: Verstreute Blank-Cells in VS Code Integrated Terminal]
- **Was:** Im integrierten Terminal von VS Code erschienen beim Scrollen verstreute leere Zellen und die Composer-Chrome verschwand zeitweise.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sauberes Rendering in VS Code — keine Geisterzellen mehr und stabile Composer-Anzeige.
- **Version:** v2.1.116

### [Fix: API 400 Cache-Control TTL Ordering]
- **Was:** Ein intermittierender API-400-Fehler durch Cache-Control-TTL-Ordering konnte auftreten, wenn ein paralleler Request während des Request-Setups abgeschlossen wurde.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabilere API-Calls bei paralleler Nutzung — keine seltenen 400er-Abbrüche mehr durch Race-Conditions.
- **Version:** v2.1.116

### [Fix: /branch akzeptiert Transcripts > 50MB]
- **Was:** `/branch` lehnte Konversationen mit Transcripts über 50 MB ab.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Auch sehr lange Sessions können verzweigt werden — keine künstliche Größen-Blockade mehr.
- **Version:** v2.1.116

### [Fix: /resume zeigt Fehler bei großen Session-Files]
- **Was:** `/resume` zeigte bei großen Session-Files still eine leere Konversation statt den Lade-Fehler zu melden.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Klare Fehlerdiagnose statt scheinbar leerer Session — man weiß, dass etwas schiefging.
- **Version:** v2.1.116

### [Fix: /plugin Installed-Tab Duplikate]
- **Was:** Der `/plugin` Installed-Tab zeigte denselben Eintrag doppelt, wenn er sowohl unter „Needs attention" als auch „Favorites" stand.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Saubere Plugin-Übersicht ohne verwirrende Duplikate.
- **Version:** v2.1.116

### [Fix: /update und /tui nach Worktree-Wechsel]
- **Was:** `/update` und `/tui` funktionierten nicht mehr, wenn man mitten in der Session in einen Worktree gewechselt hatte.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Seamless Update und UI-Toggles auch nach `EnterWorktree` — kein Session-Neustart mehr nötig.
- **Version:** v2.1.116

---

### Woche 16 (13.–18. April 2026) — v2.1.111–v2.1.114 + Opus 4.7

---

### [Fix: Crash im Permission-Dialog bei Agent-Team Anfragen]
- **Was:** Behebt einen Absturz im Permission-Dialog, wenn ein Agent-Teams-Teammate eine Tool-Berechtigung anfordert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabile Permission-Dialoge auch bei komplexen Agent-Team-Szenarien.
- **Version:** v2.1.114

### [Native Claude-Code-Binary per Plattform]
- **Was:** Die CLI startet jetzt eine native Claude-Code-Binary (per-Plattform Optional-Dependency) statt das gebündelte JavaScript auszuführen.
- **Einsatz:** Automatisch aktiv nach Update
- **Mehrwert:** Schnellerer Startup und geringerer Speicherverbrauch durch Verzicht auf zusätzliche Node-Laufzeit.
- **Version:** v2.1.113

### [sandbox.network.deniedDomains]
- **Was:** Neues Setting `sandbox.network.deniedDomains` zum Blockieren spezifischer Domains im Sandbox-Netzwerk.
- **Einsatz:** `"sandbox": { "network": { "deniedDomains": ["example.com"] } }` in settings.json
- **Mehrwert:** Feingranulare Netzwerk-Policy für Sandbox-Umgebungen — Blocklisting für unerwünschte Endpoints.
- **Version:** v2.1.113

### [Fullscreen: Shift+↑/↓ scrollt Viewport]
- **Was:** Im Fullscreen-Mode scrollen `Shift+↑` und `Shift+↓` den Viewport, während eine Selection erweitert wird.
- **Einsatz:** Im Fullscreen-Mode `Shift+↑`/`Shift+↓` drücken
- **Mehrwert:** Flüssiges Markieren über den sichtbaren Bereich hinaus in langen Transcripts.
- **Version:** v2.1.113

### [Ctrl+A / Ctrl+E für Zeilen-Enden im Multiline-Input]
- **Was:** `Ctrl+A` und `Ctrl+E` springen im Multiline-Input zum Anfang bzw. Ende der logischen Zeile (statt der gesamten Eingabe).
- **Einsatz:** `Ctrl+A` / `Ctrl+E` im Multiline-Editor
- **Mehrwert:** Readline-konforme Zeilennavigation — vertraute Shortcuts funktionieren wie erwartet.
- **Version:** v2.1.113

### [Windows: Ctrl+Backspace löscht Wort]
- **Was:** Auf Windows löscht `Ctrl+Backspace` das vorherige Wort in der Eingabe.
- **Einsatz:** Automatisch aktiv (Windows)
- **Mehrwert:** Gewohnter Word-Delete-Shortcut auf Windows, entsprechend macOS-`Opt+Backspace`.
- **Version:** v2.1.113

### [/ultrareview: Schnellerer Start & parallelisierte Checks]
- **Was:** Der `/ultrareview` Befehl startet spürbar schneller, führt Checks parallelisiert aus und zeigt animierte States pro Phase.
- **Einsatz:** `/ultrareview` wie gewohnt nutzen
- **Mehrwert:** Kürzere Wartezeit und besserer Live-Überblick über den Fortschritt der Multi-Agent-Review.
- **Version:** v2.1.113

### [Remote Control: @-Datei-Autocomplete]
- **Was:** Remote-Control-Clients können `@`-Datei-Autocomplete-Suggestions über die CLI abfragen.
- **Einsatz:** Aus Remote-Control-Client heraus `@`-Completion anfordern
- **Mehrwert:** Konsistente Datei-Auswahl in Web/Mobile-UIs wie in der lokalen CLI.
- **Version:** v2.1.113

### [macOS: /private/{etc,var,tmp,home} als gefährlich]
- **Was:** Auf macOS werden `/private/{etc,var,tmp,home}` jetzt als gefährliche Removal-Targets behandelt und gesondert abgesichert.
- **Einsatz:** Automatisch aktiv (macOS)
- **Mehrwert:** Schützt gegen unbeabsichtigtes `rm -rf` auf Symlink-Zielen von System-Verzeichnissen.
- **Version:** v2.1.113

### [Bash Deny Rules matchen Wrapper]
- **Was:** Bash Deny Rules matchen jetzt auch Befehle, die in `env`, `sudo`, `watch`, `ionice` oder `setsid` gewrappt sind.
- **Einsatz:** Automatisch aktiv — bestehende Deny-Rules sind robuster gegen Bypass
- **Mehrwert:** Sicherheitslücke geschlossen: Deny-Rules lassen sich nicht mehr durch Prozess-Wrapper umgehen.
- **Version:** v2.1.113

### [Bash(find:*) genehmigt -exec/-delete nicht mehr]
- **Was:** `Bash(find:*)` Permission-Rules genehmigen `find -exec`/`-delete` nicht mehr automatisch — diese erfordern explizite Zustimmung.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Zerstörerische `find`-Ausführungen werden nicht mehr implizit durch broad Allow-Rules erlaubt.
- **Version:** v2.1.113

### [Fix: Markdown-Tabellen mit Pipe in Inline-Code]
- **Was:** Markdown-Tabellen wurden bei Pipe-Zeichen in Inline-Code zerschossen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Korrekte Tabellen-Darstellung auch bei Code-Snippets mit `|` (z.B. Regex, Shell-Pipes).
- **Version:** v2.1.113

### [Fix: Session-Recap feuerte beim Tippen]
- **Was:** Der Session-Recap feuerte automatisch, während der User gerade noch Text verfasst hatte.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein ungewollter Recap-Lauf mehr, der den Tipp-Flow unterbricht.
- **Version:** v2.1.113

### [Fix: /copy Tabellen für GitHub/Notion/Slack]
- **Was:** Das `/copy` Tabellen-Format für GitHub, Notion und Slack wurde korrigiert.
- **Einsatz:** `/copy` in Tabellen verwenden
- **Mehrwert:** Übernahme von Tabellen in externe Tools funktioniert wieder sauber.
- **Version:** v2.1.113

### [Fix: Bash dangerouslyDisableSandbox Permission-Prompts]
- **Was:** Fehlende Permission-Prompts bei Bash-Ausführung mit `dangerouslyDisableSandbox` wurden nachgezogen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sandbox-Bypass löst jetzt immer einen expliziten Prompt aus — kein stummes Durchwinken mehr.
- **Version:** v2.1.113

### [Fix: /insights EBUSY-Crash auf Windows]
- **Was:** `/insights` stürzte auf Windows mit `EBUSY`-Fehler ab.
- **Einsatz:** Automatisch aktiv (Windows)
- **Mehrwert:** `/insights` funktioniert zuverlässig auf Windows.
- **Version:** v2.1.113

### [Fix: Exit-Confirmation bei One-Shot-Tasks]
- **Was:** Die Exit-Confirmation labelte One-Shot-Tasks fälschlich als „recurring".
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Korrekte Hinweise beim Beenden — kein falscher Verlust-Eindruck bei einmaligen Tasks.
- **Version:** v2.1.113

### [Lange URLs bei Zeilenumbruch klickbar (OSC 8)]
- **Was:** Lange URLs in Claude-Antworten und Bash-Output bleiben auch dann anklickbar, wenn sie über mehrere Zeilen umbrechen — via OSC 8 Hyperlinks.
- **Einsatz:** Automatisch aktiv (Terminal muss OSC 8 unterstützen)
- **Mehrwert:** Keine kaputten Links mehr in schmalen Terminals oder bei langen Query-Strings.
- **Version:** v2.1.113

### [/loop: Esc bricht ausstehende Wakeups ab]
- **Was:** Im `/loop`-Befehl bricht `Esc` jetzt ausstehende Wakeups ab. Wakeups werden als „Claude resuming /loop wakeup" angezeigt.
- **Einsatz:** Während `/loop` läuft `Esc` drücken, um geplante Wakeups zu stoppen
- **Mehrwert:** Saubere Unterbrechung laufender Polling-Loops ohne Session-Neustart oder Kill-Kommando.
- **Version:** v2.1.113

### [/extra-usage via Remote Control]
- **Was:** `/extra-usage` funktioniert jetzt auch aus Remote-Control-Clients (Mobile/Web) heraus.
- **Einsatz:** Im claude.ai-Client oder der Mobile App `/extra-usage` ausführen
- **Mehrwert:** Token-Verbrauch und verbleibende Usage-Limits auch unterwegs im Blick.
- **Version:** v2.1.113

### [Fix: Stalled Subagents terminieren nach 10 Minuten]
- **Was:** Subagents, die mitten im Stream hängen bleiben, scheitern jetzt nach 10 Minuten mit klarer Fehlermeldung statt still weiter zu laufen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine unendlich blockierten Subagent-Sessions mehr — klare Diagnose statt stummem Hang.
- **Version:** v2.1.113

### [Fix: `cd <aktuelles-Verzeichnis> && git …` kein Permission-Prompt]
- **Was:** Wenn `cd` in das aktuelle Verzeichnis ein No-Op ist, löst `cd <dir> && git …` keinen Permission-Prompt mehr aus.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Unterbrechungen bei Git-Befehlen, die durch ein inertes `cd` gewrappt sind.
- **Version:** v2.1.113

### [Fix: SDK-Image-Content-Blocks stürzen Session nicht mehr ab]
- **Was:** Bild-Content-Blöcke, die der SDK nicht verarbeiten kann, stürzen die Session nicht mehr ab.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Robuste SDK-Integration auch bei korrupten oder ungewöhnlichen Bildformaten in Messages.
- **Version:** v2.1.113

### [Fix: Remote-Control-Sessions streamen Subagent-Transcripts]
- **Was:** Remote-Control-Sessions übertragen jetzt Subagent-Transcripts live in den Client und archivieren Sessions beim Exit korrekt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Vollständige Transparenz über Subagent-Arbeit aus Mobile/Web-Clients — nichts geht beim Session-Ende verloren.
- **Version:** v2.1.113

### [Fix: Opus 4.7 via Bedrock Application Inference Profile ARN]
- **Was:** Behebt `thinking.type.enabled is not supported` 400-Fehler bei Opus 4.7 über Bedrock Application Inference Profile ARNs.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Opus 4.7 mit Extended Thinking läuft zuverlässig in AWS-Enterprise-Setups mit Application Inference Profiles.
- **Version:** v2.1.113

### [Fix: User-Input beim Subagent-Viewer ging verloren]
- **Was:** Beim Beobachten eines laufenden Subagenten getippte Nachrichten wurden aus dem Transcript versteckt und fälschlich dem Parent-AI zugeschrieben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein unbemerktes Verschwinden von User-Kommentaren mehr während paralleler Subagent-Beobachtung.
- **Version:** v2.1.113

### [Fix: Compacting langer Long-Context-Sessions]
- **Was:** Beim Resume langer Long-Context-Sessions schlug `/compact` mit „Extra usage is required for long context requests" fehl.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Fortsetzen großer Sessions ohne Rebuild — Compact funktioniert nach Resume wieder zuverlässig.
- **Version:** v2.1.113

### [Fix: Remote-Control-Sessions werden beim Exit archiviert]
- **Was:** Remote-Control-Sessions wurden beim Beenden von Claude Code nicht korrekt archiviert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verlässliche Session-History im Web/Mobile-Client nach dem Schließen der lokalen CLI.
- **Version:** v2.1.113

### [Fix: Plugin Install bei Dependency-Konflikten]
- **Was:** `plugin install` galt als erfolgreich, auch wenn die geforderte Dependency-Version mit einem bereits installierten Plugin kollidierte.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Frühe, klare Fehlermeldung statt später Laufzeit-Probleme durch inkompatible Plugin-Dependencies.
- **Version:** v2.1.113

### [Fix: ToolSearch-Ranking für eingefügte MCP Tool-Namen]
- **Was:** Wird ein MCP-Tool-Name wörtlich eingefügt, liefert `ToolSearch` jetzt zuverlässig genau dieses Tool statt Treffer mit ähnlichen Namen.
- **Einsatz:** MCP-Tool-Namen direkt in die Query pasten
- **Mehrwert:** Gezielte Tool-Auswahl bei großen MCP-Setups ohne Rauschen.
- **Version:** v2.1.113

### [Fix: Ctrl+U / Cmd-Backspace löscht bis Zeilenanfang]
- **Was:** `Cmd-Backspace` und `Ctrl+U` löschen jetzt korrekt vom Cursor bis zum Anfang der Zeile.
- **Einsatz:** `Ctrl+U` bzw. `Cmd-Backspace` im Prompt
- **Mehrwert:** Readline-konformes Verhalten — vertraute Editier-Shortcuts funktionieren wie in Shell und Editor.
- **Version:** v2.1.113

### [Fix: „Refine with Ultraplan" zeigt Remote-Session-URL]
- **Was:** „Refine with Ultraplan" zeigte die Remote-Session-URL nicht mehr im Transcript an.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Direkter Zugriff auf die Cloud-Plan-Session — kein Umweg über die Web-UI nötig.
- **Version:** v2.1.113

### [Fix: Prompt-Cursor bei `NO_COLOR`]
- **Was:** Der Prompt-Cursor verschwand, wenn `NO_COLOR` gesetzt war.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Nutzbare CLI auch in Color-off-Setups (Terminals ohne ANSI-Farben, Screenreader, CI-Logs).
- **Version:** v2.1.113

### [Fix: MCP Concurrent-Call Watchdog]
- **Was:** Bei parallelen MCP-Tool-Calls konnte eine Nachricht den Watchdog-Timer eines anderen Calls stillschweigend deaktivieren — dieser Hänger-Fall wurde behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Robuste Timeouts bei paralleler MCP-Tool-Nutzung — keine unerkannt hängenden Calls mehr.
- **Version:** v2.1.113

### [Claude Opus 4.7 veröffentlicht]
- **Was:** Opus 4.7 ist jetzt GA — neueste Generation für komplexes Reasoning und agentisches Coding. Gleicher Preis wie Opus 4.6 ($5/$25 per MTok), neuer Tokenizer, Capability-Verbesserungen. API Breaking Changes gegenüber 4.6.
- **Einsatz:** Model via `/model` oder `--model claude-opus-4-7` wählen. Vor Upgrade Migrations-Guide lesen.
- **Mehrwert:** Mehr Intelligenz ohne Mehrkosten — Claude Code nutzt es als neues Default-Modell.
- **Version:** Platform Release 16. April 2026

### [Opus 4.7 `xhigh` Effort-Level & interaktiver /effort Slider]
- **Was:** Neues Effort-Level `xhigh` für Opus 4.7 zwischen `high` und `max`. `/effort` ohne Argumente öffnet einen interaktiven Schieberegler für Geschwindigkeit vs. Intelligenz.
- **Einsatz:** `/effort` (Slider) oder `/effort xhigh`
- **Mehrwert:** Feinere Dosierung zwischen schnellen und maximal gründlichen Antworten — besonders nützlich bei langen Coding-Sessions.
- **Version:** v2.1.111

### [Auto Mode für Max-Abonnenten verfügbar]
- **Was:** Der in v2.1.83 eingeführte Auto Mode läuft nun für Max-Abonnenten mit Opus 4.7 und braucht kein `--enable-auto-mode` mehr.
- **Einsatz:** `Shift+Tab` zwischen Modi oder `"permissions": { "defaultMode": "auto" }` in settings.json
- **Mehrwert:** Weniger Permission-Prompts bei sicheren Aktionen auf dem leistungsfähigsten Modell — ohne Sicherheit aufzugeben.
- **Version:** v2.1.111

### [/ultrareview — Cloud-basierte Multi-Agent Code Review]
- **Was:** Neuer `/ultrareview` Befehl startet eine umfassende Code Review in der Cloud mit paralleler Multi-Agent-Analyse.
- **Einsatz:** `/ultrareview` (aktueller Branch) oder `/ultrareview <PR#>` (spezifische GitHub PR)
- **Mehrwert:** Tiefere Review durch mehrere spezialisierte Agents parallel — findet Dinge, die ein einzelner Pass übersieht.
- **Version:** v2.1.111

### [/less-permission-prompts Skill]
- **Was:** Skill scannt Transkripte nach häufigen Read-Only Bash- und MCP-Tool-Calls und generiert eine priorisierte Allowlist für `.claude/settings.json`.
- **Einsatz:** `/less-permission-prompts` ausführen
- **Mehrwert:** Automatisches Permission-Tuning basierend auf tatsächlichem Nutzungsverhalten — weniger Unterbrechungen ohne manuelles Allowlist-Editing.
- **Version:** v2.1.111

### [Read-Only Bash-Commands mit Glob-Patterns ohne Permission-Prompt]
- **Was:** Read-Only Befehle mit Glob-Patterns (z.B. `ls *.ts`) und `cd <dir> && ...` lösen keine Permission-Prompts mehr aus.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Weniger Unterbrechungen bei gängigen Navigations- und List-Operationen.
- **Version:** v2.1.111

### [PowerShell Tool im Windows-Rollout]
- **Was:** Das in v2.1.84 als Preview eingeführte PowerShell Tool rollt jetzt breit auf Windows aus. `CLAUDE_CODE_USE_POWERSHELL_TOOL=1/0` steuert die Aktivierung.
- **Einsatz:** `CLAUDE_CODE_USE_POWERSHELL_TOOL=1` in settings.json
- **Mehrwert:** Native Windows-Erfahrung mit PowerShell-Cmdlets und Objekt-Pipes statt Git-Bash-Umwege.
- **Version:** v2.1.111

### [Plan-Dateien mit sprechenden Namen]
- **Was:** Plan-Dateien werden jetzt nach dem Prompt benannt (z.B. `fix-auth-race-snug-otter.md`) statt mit rein zufälligen Wörtern.
- **Einsatz:** Automatisch aktiv bei Plan-Erstellung
- **Mehrwert:** Pläne sind im Filesystem wiederauffindbar, ohne sie öffnen zu müssen.
- **Version:** v2.1.111

### [/skills Menu mit Token-Count Sortierung]
- **Was:** Im `/skills` Menu lassen sich Skills per `t` nach Token-Count sortieren.
- **Einsatz:** `/skills`, dann `t` zum Umschalten der Sortierung
- **Mehrwert:** Teure Skills schnell identifizieren und hinterfragen, ob der Token-Footprint gerechtfertigt ist.
- **Version:** v2.1.111

### [Verbesserter /setup-vertex und /setup-bedrock]
- **Was:** Die Setup-Wizards zeigen den tatsächlichen settings.json-Pfad (wenn `CLAUDE_CONFIG_DIR` gesetzt ist), schlagen beim Re-Run bisherige Model-Kandidaten vor und bieten "with 1M context" Option für unterstützte Modelle.
- **Einsatz:** `/setup-vertex` oder `/setup-bedrock`
- **Mehrwert:** Schnelleres Re-Setup und klarere Pfad-Anzeige in angepassten Config-Umgebungen.
- **Version:** v2.1.111

### ["Auto (match terminal)" Theme]
- **Was:** Neue Theme-Option passt sich automatisch an Dark/Light-Mode des Terminals an.
- **Einsatz:** `/theme` → "Auto (match terminal)" wählen
- **Mehrwert:** Ein Setup für Tag und Nacht — keine manuellen Theme-Wechsel mehr.
- **Version:** v2.1.111

### [Ctrl+U löscht kompletten Input-Buffer]
- **Was:** `Ctrl+U` löscht nun den gesamten Input-Buffer (vorher nur bis Zeilenanfang). `Ctrl+Y` stellt ihn wieder her.
- **Einsatz:** `Ctrl+U` zum Löschen, `Ctrl+Y` zum Wiederherstellen
- **Mehrwert:** Readline-konformes Verhalten mit Undo-Möglichkeit.
- **Version:** v2.1.111

### [Typo-Vorschläge für CLI-Befehle]
- **Was:** Vertippte Aufrufe wie `claude udpate` zeigen einen Vorschlag: "Did you mean `claude update`?"
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Schnellere Korrektur häufiger Tippfehler.
- **Version:** v2.1.111

### [Headless Mode: plugin_errors im Init-Event]
- **Was:** `--output-format stream-json` liefert `plugin_errors` im Init-Event, wenn Plugins durch unerfüllte Dependencies degradiert wurden.
- **Einsatz:** `claude -p --output-format stream-json ...` und `init` Event inspizieren
- **Mehrwert:** Programmatische Erkennung von Plugin-Problemen in automatisierten Setups.
- **Version:** v2.1.111

### [Ctrl+L erzwingt Screen-Redraw]
- **Was:** `Ctrl+L` erzwingt einen vollständigen Redraw des Terminal-Screens.
- **Einsatz:** `Ctrl+L` drücken
- **Mehrwert:** Schnelles Aufräumen bei Rendering-Artefakten ohne Session-Neustart.
- **Version:** v2.1.111

### [Transcript-Viewer Shortcuts: `[` und `v`]
- **Was:** Im Transcript-Viewer sind neue Footer-Shortcuts verfügbar: `[` dumpt den Transcript-Inhalt ins Scrollback-Puffer, `v` öffnet ihn im externen Editor.
- **Einsatz:** Im Transcript-Viewer `[` oder `v` drücken
- **Mehrwert:** Schnelles Exportieren oder Weiterverarbeiten des Session-Transcripts.
- **Version:** v2.1.111

### [OTEL_LOG_RAW_API_BODIES für API-Debugging]
- **Was:** Neue Umgebungsvariable `OTEL_LOG_RAW_API_BODIES` loggt die kompletten API-Request- und Response-Bodies als OpenTelemetry-Events.
- **Einsatz:** `OTEL_LOG_RAW_API_BODIES=1` setzen (zusätzlich zu bestehender OTEL-Konfiguration)
- **Mehrwert:** Tiefe API-Diagnose bei Debugging-Bedarf — ideal für Enterprise-Support-Cases.
- **Version:** v2.1.111

### [Bare URLs bei Line-Wrapping clickable]
- **Was:** Nackte URLs in Bash-, PowerShell- und MCP-Output werden auch dann anklickbar, wenn sie über Zeilenumbrüche laufen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** URLs aus Tool-Output sind zuverlässig klickbar, unabhängig von Terminal-Breite.
- **Version:** v2.1.111

### [Lange Pastes: „+N lines" Marker]
- **Was:** Bei sehr langen Pastes zeigt die UI einen „+N lines" Marker als Full-Width-Regel statt jede Zeile einzeln zu rendern.
- **Einsatz:** Automatisch aktiv beim Einfügen langer Inhalte
- **Mehrwert:** Übersichtlichere Anzeige großer Paste-Operationen.
- **Version:** v2.1.111

### [Windows: CLAUDE_ENV_FILE und SessionStart-Hook Env-Files]
- **Was:** Auf Windows werden die in `CLAUDE_ENV_FILE` bzw. von SessionStart-Hooks gesetzten Umgebungsvariablen jetzt korrekt übernommen.
- **Einsatz:** Automatisch aktiv (Windows)
- **Mehrwert:** Konsistentes Env-Handling zwischen Windows und Unix-Systemen.
- **Version:** v2.1.111

### [Windows: Permission Rules mit Drive-Letter-Paths]
- **Was:** Permission-Rules mit Windows-Drive-Letter-Pfaden (z.B. `C:\\...`) werden nun korrekt an den Root verankert und matchen nicht mehr unbeabsichtigt andere Pfade.
- **Einsatz:** Automatisch aktiv (Windows)
- **Mehrwert:** Sichere und vorhersehbare Permission-Konfiguration auf Windows.
- **Version:** v2.1.111

### [Fix: Terminal Display Tearing in iTerm2 + tmux]
- **Was:** Behebt Display-Tearing, zufällige Zeichen und driftenden Input in iTerm2 mit tmux.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Stabile Darstellung in der beliebten iTerm2+tmux-Kombination.
- **Version:** v2.1.111

### [Fix: @-Datei-Suggestions in nicht-Git Verzeichnissen]
- **Was:** `@` Datei-Suggestions scannen nicht mehr das gesamte Projekt in nicht-git Verzeichnissen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich schnelleres Autocomplete in Projekten ohne Git.
- **Version:** v2.1.111

### [Fix: `/clear` behält Session-Namen]
- **Was:** `/clear` behält jetzt einen mit `/rename` gesetzten Session-Namen (vorher wurde er verworfen).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Session-Identität überlebt Context-Clearing.
- **Version:** v2.1.111

### [Fix: 429 Rate-Limit auf Bedrock/Vertex/Foundry]
- **Was:** Behebt fehlerhafte 429-Behandlung auf Bedrock, Vertex und Foundry.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Zuverlässigere Fehlerbehandlung bei Cloud-Provider-Rate-Limits.
- **Version:** v2.1.111

### [Fix: Opus 4.7 "temporarily unavailable" im Auto Mode]
- **Was:** Behebt den Fehler "claude-opus-4-7 is temporarily unavailable" im Auto Mode.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Auto Mode funktioniert zuverlässig mit Opus 4.7 direkt nach Release.
- **Version:** v2.1.112

### [Claude Cowork Enterprise-Ready]
- **Was:** Claude Cowork erhielt Enterprise-Upgrades: SSO, Audit-Logs, Admin-Controls für Team-weite Policies, und erhöhte Reliability-SLAs. Positionierung als produktionsreife Plattform für asynchrone Multi-User-Zusammenarbeit mit Claude.
- **Einsatz:** Enterprise-Admin-Panel zur Konfiguration von Policies, SSO, und Team-Access
- **Mehrwert:** Claude Cowork für Teams produktionsreif — zentrale Governance, keine Shadow-IT mehr bei Claude-Zugriffen.
- **Version:** Blog-Ankündigung 9. April 2026

### [Advisor Tool — Executor/Advisor-Paar für lange Agent-Workloads]
- **Was:** Neues Advisor Tool (public beta) kombiniert ein schnelleres Executor-Modell mit einem intelligenteren Advisor-Modell, das strategische Hinweise mitten in der Generation einstreut. Long-Horizon Agent-Workloads erreichen Advisor-Qualität, während die meiste Token-Generierung zum günstigeren Executor-Tarif läuft.
- **Einsatz:** API-Beta-Header `advisor-tool-2026-03-01` in Requests einbinden
- **Mehrwert:** Deutlich bessere Qualität bei langen agentischen Aufgaben ohne voll-auf-Opus-Kosten.
- **Version:** Platform Release 9. April 2026 (public beta)

### [Claude Managed Agents]
- **Was:** Vollständig gemanagter Agent-Harness (public beta). Claude läuft als autonomer Agent mit sicherem Sandboxing, eingebauten Tools und Server-Sent-Event-Streaming. Agents erstellen, Container konfigurieren und Sessions über die API steuern.
- **Einsatz:** API-Beta-Header `managed-agents-2026-04-01`. Managed-Agents-Overview in der Platform-Doku.
- **Mehrwert:** Produktionsreife Agents ohne eigene Harness-Infrastruktur — laut Anthropic bis zu 10× schneller zum Production-Deploy.
- **Version:** Platform Release 8. April 2026 (public beta)

### [ant CLI — Command-Line Client für die Claude API]
- **Was:** Neue `ant` CLI für direkte Claude-API-Interaktion mit nativer Claude-Code-Integration und YAML-basierter Versionierung von API-Ressourcen.
- **Einsatz:** Siehe CLI-Reference in der Platform-Doku
- **Mehrwert:** Klare Trennung zwischen Claude Code (agentisches Coding) und direkter API-Nutzung — plus Git-fähige YAML-Versionierung von Managed-Agent-Resources.
- **Version:** Platform Release 8. April 2026

### [Claude Mythos Preview — Project Glasswing]
- **Was:** Claude Mythos (gated Research Preview) ist für defensive Cybersecurity-Arbeit als Teil von Project Glasswing verfügbar. Zugang nur auf Einladung.
- **Einsatz:** Zugang über anthropic.com/glasswing anfragen
- **Mehrwert:** Spezialisiertes Claude-Modell für Defensive-Security-Workloads.
- **Version:** Platform Release 7. April 2026

### [Claude in Amazon Bedrock — Messages API]
- **Was:** Die Messages API ist als Research Preview auf Amazon Bedrock verfügbar (`/anthropic/v1/messages`). Gleiches Request-Format wie die 1P Claude API, läuft auf AWS-managed Infrastructure mit Zero-Operator-Access. Aktuell in `us-east-1`.
- **Einsatz:** Zugang über Anthropic Account Executive anfragen
- **Mehrwert:** Volle Messages-API-Features auf AWS — kein API-Format-Mapping mehr zwischen 1P und Bedrock.
- **Version:** Platform Release 7. April 2026

### [Model Deprecation: Sonnet 4 und Opus 4]
- **Was:** Sonnet 4 (`claude-sonnet-4-20250514`) und Opus 4 (`claude-opus-4-20250514`) werden am 15. Juni 2026 auf der Claude API retired. Empfehlung: Migration zu Sonnet 4.6 bzw. Opus 4.7.
- **Einsatz:** Model-ID in API-Calls und Claude-Code-Config auf Nachfolger umstellen
- **Mehrwert:** Rechtzeitige Migrationswarnung — Claude Code und eigene Integrationen lassen sich umstellen, bevor Requests fehlschlagen.
- **Version:** Angekündigt 14. April 2026

---

### Woche 15+ (6.–16. April 2026) — v2.1.92–v2.1.110

---

### [/tui Befehl — Flicker-Free Rendering im laufenden Gespräch]
- **Was:** Neuer `/tui` Befehl und `tui` Setting ermöglichen den Wechsel zur flicker-freien Fullscreen-Darstellung mitten in einer Konversation, ohne die Session neu starten zu müssen.
- **Einsatz:** `/tui fullscreen` ausführen — Wechsel erfolgt in derselben Session
- **Mehrwert:** Nahtloser Wechsel zur stabilen Fullscreen-Ansicht wenn man merkt, dass man sie braucht — kein Session-Neustart mehr nötig.
- **Version:** v2.1.110

### [/focus Befehl — Fokus-Ansicht separat steuerbar]
- **Was:** `Ctrl+O` wechselt jetzt nur noch zwischen normalem und ausführlichem Transcript. Die Fokus-Ansicht wird separat mit dem neuen `/focus` Befehl gesteuert.
- **Einsatz:** `/focus` für Fokus-Ansicht, `Ctrl+O` für Transcript-Detailgrad
- **Mehrwert:** Klarere Trennung zwischen Transcript-Verbosity und Fokus-Modus — jede Funktion hat ihren eigenen Schalter.
- **Version:** v2.1.110

### [Push-Benachrichtigungen ans Handy]
- **Was:** Neues Push-Notification Tool — Claude kann mobile Push-Benachrichtigungen senden wenn Remote Control aktiv ist und "Push when Claude decides" in der Config aktiviert wurde.
- **Einsatz:** Remote Control einrichten, dann in `/config` "Push when Claude decides" aktivieren
- **Mehrwert:** Claude benachrichtigt dich aufs Handy wenn etwas Wichtiges passiert — kein aktives Beobachten der Terminal-Session mehr nötig.
- **Version:** v2.1.110

### [Auto-Scroll deaktivierbar im Fullscreen]
- **Was:** Neues `autoScrollEnabled` Config-Setting um automatisches Scrollen im Fullscreen-Modus zu deaktivieren.
- **Einsatz:** In `/config` `autoScrollEnabled` auf `false` setzen
- **Mehrwert:** Manuelles Scrollen wird nicht mehr durch neue Ausgaben unterbrochen — ideal beim Lesen von Code-Diffs.
- **Version:** v2.1.110

### [Claudes letzte Antwort als Kontext im externen Editor]
- **Was:** Optionale Anzeige von Claudes letzter Antwort als kommentierter Kontext im `Ctrl+G` externen Editor.
- **Einsatz:** In `/config` aktivieren, dann `Ctrl+G` drücken — Claudes Antwort erscheint als Kommentar
- **Mehrwert:** Beim Schreiben längerer Follow-Up-Prompts im Editor hat man Claudes letzte Antwort direkt im Blick.
- **Version:** v2.1.110

### [Verbesserter /plugin Installed Tab]
- **Was:** Items die Aufmerksamkeit benötigen und Favoriten erscheinen oben, deaktivierte Items sind hinter einem Fold versteckt, `f` favorisiert das ausgewählte Item.
- **Einsatz:** `/plugin` öffnen, `f` zum Favorisieren
- **Mehrwert:** Bessere Übersicht über installierte Plugins — Wichtiges oben, Rest aufgeräumt.
- **Version:** v2.1.110

### [/doctor warnt bei doppelten MCP-Server-Definitionen]
- **Was:** `/doctor` warnt jetzt wenn ein MCP-Server in mehreren Config-Scopes mit unterschiedlichen Endpoints definiert ist.
- **Einsatz:** `/doctor` ausführen
- **Mehrwert:** Erkennt Konfigurationskonflikte bei MCP-Servern bevor sie zu unerklärlichem Verhalten führen.
- **Version:** v2.1.110

### [--resume/--continue stellt Scheduled Tasks wieder her]
- **Was:** `--resume` und `--continue` reaktivieren jetzt noch nicht abgelaufene geplante Tasks aus der vorherigen Session.
- **Einsatz:** `claude --resume` — Scheduled Tasks werden automatisch fortgesetzt
- **Mehrwert:** Geplante Monitoring-Tasks überleben Session-Neustarts.
- **Version:** v2.1.110

### [Remote Control: Mehr Befehle verfügbar]
- **Was:** `/autocompact`, `/context`, `/exit` und `/reload-plugins` funktionieren jetzt über Remote Control (Mobile/Web Clients).
- **Einsatz:** Über claude.ai oder Mobile App die Befehle ausführen
- **Mehrwert:** Mehr Kontrolle über die CLI-Session vom Handy oder Browser aus.
- **Version:** v2.1.110

### [Write Tool meldet User-Edits im IDE Diff]
- **Was:** Das Write Tool informiert jetzt das Modell wenn der User den vorgeschlagenen Inhalt im IDE-Diff-View bearbeitet hat bevor er akzeptiert wurde.
- **Einsatz:** Automatisch aktiv — Claude sieht wenn du seinen Vorschlag vor dem Akzeptieren änderst
- **Mehrwert:** Claude lernt aus deinen Korrekturen und kann den Kontext im Gespräch besser nachvollziehen.
- **Version:** v2.1.110

### [Bash Tool erzwingt dokumentiertes Timeout-Maximum]
- **Was:** Das Bash Tool erzwingt jetzt das dokumentierte maximale Timeout und akzeptiert keine beliebig großen Werte mehr.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verhindert versehentlich ewig laufende Befehle.
- **Version:** v2.1.110

### [SDK/Headless Distributed Tracing]
- **Was:** SDK- und Headless-Sessions lesen `TRACEPARENT`/`TRACESTATE` aus der Umgebung für Distributed-Trace-Linking.
- **Einsatz:** `TRACEPARENT` und `TRACESTATE` Umgebungsvariablen setzen
- **Mehrwert:** Claude Code Sessions lassen sich in bestehende Observability-Infrastruktur (OpenTelemetry) einbinden.
- **Version:** v2.1.110

### [Session Recap für Telemetrie-deaktivierte User]
- **Was:** Session Recap ist jetzt auch für User mit deaktivierter Telemetrie aktiv (Bedrock, Vertex, Foundry, `DISABLE_TELEMETRY`).
- **Einsatz:** Automatisch aktiv. Opt-out via `/config` oder `CLAUDE_CODE_ENABLE_AWAY_SUMMARY=0`.
- **Mehrwert:** Alle Nutzer profitieren vom Kontext-Recap, unabhängig von Telemetrie-Einstellungen.
- **Version:** v2.1.110

### [Fix: MCP Tool Calls hängen bei Verbindungsabbruch]
- **Was:** MCP Tool Calls hingen endlos wenn die Server-Verbindung mitten in einer Antwort auf SSE/HTTP-Transports abbrach.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine endlosen Wartezeiten mehr bei instabilen MCP-Server-Verbindungen.
- **Version:** v2.1.110

### [Fix: Hohe CPU-Last bei Textselektion im Fullscreen]
- **Was:** Hohe CPU-Auslastung im Fullscreen wenn Text selektiert war während ein Tool läuft.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Kein CPU-Spike mehr beim Markieren von Text während Claude arbeitet.
- **Version:** v2.1.110

### [Fix: Verlorene Tastenanschläge nach CLI-Relaunch]
- **Was:** Nach einem CLI-Relaunch (z.B. `/tui`, Provider-Setup-Wizards) gingen Tastenanschläge verloren.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Flüssiges Tippen direkt nach CLI-Neustarts.
- **Version:** v2.1.110

### [Fix: Verstümmelte Darstellung in macOS Terminal.app]
- **Was:** Verstümmelte Startup-Darstellung in macOS Terminal.app und anderen Terminals ohne Synchronized-Output-Support.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sauberer Start auch in Standard-macOS-Terminal.
- **Version:** v2.1.110

### [Sicherheit: "Open in Editor" gegen Command Injection gehärtet]
- **Was:** "Open in editor" Aktionen sind jetzt gegen Command Injection durch nicht vertrauenswürdige Dateinamen geschützt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Erhöhte Sicherheit bei der Arbeit mit Dateien aus externen Quellen.
- **Version:** v2.1.110

### [Fix: Plugin-Dependencies aus plugin.json]
- **Was:** Plugin-Installation beachtet jetzt Dependencies aus `plugin.json` auch wenn der Marketplace-Eintrag sie nicht aufführt. `/plugin` install zeigt auto-installierte Dependencies.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Plugins funktionieren zuverlässiger direkt nach Installation.
- **Version:** v2.1.110

### [Fix: MCP stdio Server mit Nicht-JSON stdout]
- **Was:** MCP stdio Server die versehentlich Nicht-JSON-Zeilen auf stdout ausgeben wurden bei der ersten solchen Zeile getrennt (Regression seit v2.1.105). Jetzt werden sie toleriert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Robustere MCP-Server-Verbindungen bei unperfekten Server-Implementierungen.
- **Version:** v2.1.110

### [Desktop Redesign für parallele Agents]
- **Was:** Komplett überarbeitete Claude Code Desktop-App für paralleles Arbeiten an mehreren Projekten. Neue Sidebar für aktive/letzte Sessions, integriertes Terminal, In-App Datei-Editor, überarbeiteter Diff-Viewer für große Changesets, HTML/PDF-Vorschau, und Drag-and-Drop Layout.
- **Einsatz:** Desktop-App aktualisieren. Side Chat mit `⌘+;` / `Ctrl+;` öffnen für Zwischenfragen ohne den Hauptthread zu stören. Drei View-Modi: Verbose, Normal, Summary.
- **Mehrwert:** Mehrere Repos gleichzeitig bearbeiten, Sessions nach Status/Projekt filtern, und ein Side Chat der Kontext aus dem Hauptthread zieht ohne ihn zu verändern.
- **Version:** Blog-Ankündigung 14. April 2026

### [Routines — Automatisierte Claude-Code-Workflows]
- **Was:** Routines sind wiederverwendbare Claude-Code-Workflows, die einmal konfiguriert und dann über Zeitplan, API-Endpoint oder GitHub-Webhook ausgelöst werden. Sie laufen auf Claudes Web-Infrastruktur, d.h. ohne offenen Laptop. Drei Trigger-Typen: Scheduled (z.B. „Jede Nacht um 2 Uhr: Top-Bug aus Linear ziehen und Draft-PR öffnen"), API (eigener Endpoint + Auth-Token für Trigger aus Alerting/Deploy-Hooks) und Webhook (Repository-Events wie PR-Kommentare oder CI-Fails).
- **Einsatz:** `claude.ai/code` → Routines anlegen, oder `/schedule` in der CLI. Research Preview für Pro/Max/Team/Enterprise mit aktiviertem Web-Zugriff. Tägliche Limits: Pro 5, Max 15, Team/Enterprise 25 Routines.
- **Mehrwert:** Backlog-Pflege, PR-Reviews, Alert-Triage und Deploy-Verifikation laufen ohne eigene Cron-/Hook-Infrastruktur. Perfekte Ergänzung zu `/loop` — wiederkehrende Aufgaben werden von der lokalen Session entkoppelt.
- **Version:** Blog-Ankündigung 14. April 2026 (Research Preview)

### [Recap-Feature für Session-Rückkehr]
- **Was:** Neues Recap-Feature liefert Kontext-Zusammenfassung wenn man zu einer Session zurückkehrt. Konfigurierbar in `/config`, manuell aufrufbar mit `/recap`.
- **Einsatz:** `/recap` ausführen oder in `/config` aktivieren. `CLAUDE_CODE_ENABLE_AWAY_SUMMARY` zum Erzwingen bei deaktivierter Telemetrie.
- **Mehrwert:** Sofortiger Überblick wo man war und was passiert ist, statt sich durch den Verlauf scrollen zu müssen.
- **Version:** v2.1.108

### [1-Stunden Prompt-Cache TTL]
- **Was:** Neue Umgebungsvariable `ENABLE_PROMPT_CACHING_1H` für 1-Stunden Prompt-Cache TTL auf API-Key, Bedrock, Vertex und Foundry. `FORCE_PROMPT_CACHING_5M` erzwingt 5-Minuten TTL.
- **Einsatz:** `ENABLE_PROMPT_CACHING_1H=1` setzen. `CLAUDE_CODE_SKIP_BEDROCK_AUTH` ist deprecated aber funktioniert noch.
- **Mehrwert:** Längere Cache-Dauer reduziert Kosten und Latenz bei häufiger Nutzung über API-Key oder Cloud-Provider.
- **Version:** v2.1.108

### [Skills via Skill Tool aufrufbar]
- **Was:** Das Modell kann jetzt eingebaute Slash-Commands wie `/init`, `/review` und `/security-review` über das Skill Tool entdecken und aufrufen.
- **Einsatz:** Automatisch aktiv — Claude kann Skills eigenständig nutzen
- **Mehrwert:** Claude kann proaktiv relevante Skills einsetzen ohne dass man sie manuell aufrufen muss.
- **Version:** v2.1.108

### [/undo als Alias für /rewind]
- **Was:** `/undo` ist jetzt ein Alias für den `/rewind` Befehl.
- **Einsatz:** `/undo` statt `/rewind` verwenden
- **Mehrwert:** Intuitiverer Befehlsname zum Rückgängigmachen von Aktionen.
- **Version:** v2.1.108

### [Verbesserte /model Warnung]
- **Was:** `/model` warnt jetzt vor dem Wechsel mitten in einer Konversation, da die nächste Antwort die gesamte History uncached neu einliest.
- **Einsatz:** Automatisch aktiv bei `/model` Nutzung
- **Mehrwert:** Bewusste Entscheidung über Modellwechsel — man weiß was es kostet.
- **Version:** v2.1.108

### [Verbesserte /resume Filterung]
- **Was:** `/resume` Picker zeigt standardmäßig Sessions aus dem aktuellen Verzeichnis. `Ctrl+A` zeigt alle Projekte.
- **Einsatz:** `/resume` ausführen — `Ctrl+A` für alle Projekte
- **Mehrwert:** Schnellerer Zugriff auf relevante Sessions ohne durch projektfremde Sessions scrollen zu müssen.
- **Version:** v2.1.108

### [Bessere Fehlermeldungen]
- **Was:** Server-Rate-Limits werden jetzt von Plan-Usage-Limits unterschieden. 5xx/529 Fehler zeigen Link zu status.claude.com. Unbekannte Slash-Commands schlagen den nächsten Match vor.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Klarere Fehlerdiagnose — man weiß sofort ob es am Server, am Plan oder an einem Tippfehler liegt.
- **Version:** v2.1.108

### [Reduzierter Memory-Footprint]
- **Was:** Sprachgrammatiken für File Reads, Edits und Syntax-Highlighting werden jetzt on-demand geladen statt alle beim Start.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Geringerer Speicherverbrauch, besonders bei langen Sessions mit vielen verschiedenen Dateitypen.
- **Version:** v2.1.108

### [Warnung bei deaktiviertem Prompt-Caching]
- **Was:** Beim Start wird jetzt gewarnt wenn Prompt-Caching über `DISABLE_PROMPT_CACHING*` Umgebungsvariablen deaktiviert ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verhindert versehentlich teuren Betrieb mit deaktiviertem Cache.
- **Version:** v2.1.108

### [Fix: Paste im /login Code-Prompt]
- **Was:** Einfügen funktionierte nicht im `/login` Code-Prompt (Regression seit v2.1.105).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Login-Flow funktioniert wieder korrekt mit Copy-Paste.
- **Version:** v2.1.108

### [Fix: Telemetrie-Deaktivierung und Cache-TTL]
- **Was:** Subscriber die `DISABLE_TELEMETRY` setzen fielen auf 5-Minuten Prompt-Cache TTL zurück statt 1 Stunde zu nutzen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Korrekte Cache-Dauer auch bei deaktivierter Telemetrie — keine unnötigen Kosten mehr.
- **Version:** v2.1.108

### [Fix: Session-Titel bei kurzen Grüßen]
- **Was:** Session-Titel zeigten Platzhalter-Beispieltext wenn die erste Nachricht ein kurzer Gruß war.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sinnvolle Session-Titel auch bei kurzen Startmeldungen.
- **Version:** v2.1.108

### [Fix: Diakritische Zeichen in Antworten]
- **Was:** Akzente, Umlaute und Cedillen wurden aus Antworten entfernt wenn die `language` Einstellung konfiguriert war.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Korrekte Darstellung von Sonderzeichen in allen Sprachen — besonders wichtig für Deutsch, Französisch etc.
- **Version:** v2.1.108

### [Verbesserter Extended-Thinking-Indikator]
- **Was:** Der Extended-Thinking-Indikator zeigt jetzt einen rotierenden Fortschrittshinweis.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Besseres visuelles Feedback während Claude denkt — man sieht dass etwas passiert.
- **Version:** v2.1.109

### [Routines — Automatisierungen auf Claudes Web-Infrastruktur]
- **Was:** Routines sind konfigurierbare Automatisierungen (Prompt + Repo + Connectors), die auf Claudes Web-Infrastruktur laufen — kein offener Laptop nötig. Drei Ausführungsmodelle: **Scheduled** (Cron-artig, z.B. nächtliche Bug-Triage), **API-triggered** (eigener Endpoint pro Routine, z.B. Deploy-Verifizierung bei Alert), **Webhook** (GitHub Events, z.B. Custom Code Review bei PRs auf bestimmte Pfade).
- **Einsatz:** Über `claude.ai/code` oder `/schedule` CLI-Befehl einrichten. Limits: Pro 5/Tag, Max 15/Tag, Team/Enterprise 25/Tag.
- **Mehrwert:** Wiederkehrende Aufgaben wie Backlog-Triage, Dokumentations-Drift-Erkennung, Alert-Triage oder Cross-SDK-Portierung laufen vollautomatisch im Hintergrund.
- **Version:** Blog-Ankündigung 14. April 2026

### [Thinking Hints erscheinen früher]
- **Was:** Thinking Hints (Denkhinweise) werden bei lang andauernden Operationen früher angezeigt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Besseres Feedback während Claude an komplexen Aufgaben arbeitet — man sieht früher, woran Claude denkt.
- **Version:** v2.1.107

### [WebFetch filtert Style/Script-Inhalte]
- **Was:** WebFetch entfernt jetzt `<style>` und `<script>` Inhalte aus abgerufenen Seiten, damit CSS-lastige Seiten nicht das Content-Budget aufbrauchen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich bessere Ergebnisse beim Abrufen von Webseiten — mehr relevanter Text statt CSS/JS-Ballast.
- **Version:** v2.1.105

### [Verbesserte Netzwerk-Fehlermeldungen]
- **Was:** Verbindungsfehler zeigen sofort eine Retry-Nachricht statt eines stillen Spinners.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Sofortiges Feedback bei Netzwerkproblemen statt ratlosem Warten.
- **Version:** v2.1.105

### [Lange Einzeiler-Writes werden abgeschnitten]
- **Was:** Lange einzeilige Schreiboperationen (z.B. minifiziertes JSON) werden in der UI abgeschnitten statt über viele Bildschirmseiten zu paginieren.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine endlosen Seiten bei minifiziertem JSON oder ähnlichen Einzeilern mehr.
- **Version:** v2.1.105

### [Fix: Bilder in Queued Messages]
- **Was:** Bilder, die an Nachrichten angehängt werden während Claude arbeitet, wurden bisher still verworfen. Jetzt werden sie korrekt übermittelt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Bilder gehen nicht mehr verloren, wenn man sie sendet während Claude noch beschäftigt ist.
- **Version:** v2.1.105

### [Fix: Leading Whitespace in Antworten]
- **Was:** Führende Leerzeichen in Claudes Antworten wurden abgeschnitten, was ASCII Art und eingerückte Diagramme zerstörte.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** ASCII Art, Code-Diagramme und eingerückte Ausgaben werden korrekt dargestellt.
- **Version:** v2.1.105

### [Fix: Bash-Output mit Clickable File Links]
- **Was:** Bash-Output wurde verstümmelt wenn Befehle anklickbare Datei-Links ausgeben (z.B. Python `rich`/`loguru` Logging).
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Korrekte Darstellung von Terminal-Output mit Rich-Formatierung.
- **Version:** v2.1.105

### [Fix: One-Shot Scheduled Tasks feuerten wiederholt]
- **Was:** Einmalig geplante Tasks feuerten wiederholt, wenn der File-Watcher das Post-Fire-Cleanup verpasste.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Einmalige Scheduled Tasks laufen jetzt tatsächlich nur einmal.
- **Version:** v2.1.105

### [Fix: Channel-Benachrichtigungen für Team/Enterprise]
- **Was:** Eingehende Channel-Benachrichtigungen wurden nach der ersten Nachricht für Team/Enterprise-Nutzer still verworfen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Zuverlässige Benachrichtigungen für Team- und Enterprise-Nutzer.
- **Version:** v2.1.105

### [Fix: Marketplace Plugin Dependencies]
- **Was:** Marketplace-Plugins mit `package.json` und Lockfile bekamen ihre Dependencies nicht automatisch installiert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Plugins funktionieren sofort nach Installation ohne manuelles `npm install`.
- **Version:** v2.1.105

### [Fix: 429 Rate-Limit-Anzeige]
- **Was:** 429 Rate-Limit-Fehler zeigten einen rohen JSON-Dump statt einer sauberen Meldung für API-Key, Bedrock und Vertex-Nutzer.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Lesbare Fehlermeldungen statt kryptischer JSON-Dumps bei Rate-Limits.
- **Version:** v2.1.105

### [/autofix-pr aus dem Terminal]
- **Was:** PR Auto-Fix direkt aus dem Terminal aktivieren. `/autofix-pr` erkennt den offenen PR für den aktuellen Branch und aktiviert Auto-Fix auf Claude Code Web — Claude beobachtet CI und Review-Kommentare und pusht Fixes bis alles grün ist.
- **Einsatz:** `/autofix-pr` auf dem Branch mit offenem PR ausführen
- **Mehrwert:** Kein Wechsel zum Browser mehr nötig um Auto-Fix zu aktivieren — ein Befehl und man kann sich anderem widmen.
- **Version:** v2.1.101

### [/loop Self-Pacing]
- **Was:** `/loop` kann jetzt ohne Intervall-Angabe aufgerufen werden. Claude bestimmt selbst den optimalen Takt basierend auf der Aufgabe, oder nutzt das Monitor Tool um Polling ganz zu vermeiden.
- **Einsatz:** `/loop check CI on my PR` (ohne Zeitangabe)
- **Mehrwert:** Intelligenteres Polling — Claude wartet genau so lange wie nötig statt starre Intervalle abzuarbeiten.
- **Version:** v2.1.101

### [EnterWorktree `path` Parameter]
- **Was:** Das EnterWorktree Tool akzeptiert jetzt einen `path` Parameter um in bestehende Worktrees zu wechseln statt immer einen neuen zu erstellen.
- **Einsatz:** Automatisch aktiv — Claude kann bestehende Worktrees direkt nutzen
- **Mehrwert:** Effizienter Umgang mit Git Worktrees, weniger unnötige Worktree-Erstellungen.
- **Version:** v2.1.105

### [PreCompact Hook]
- **Was:** Neuer Hook-Event für Context-Kompaktierung. Hooks können die Kompaktierung mit Exit-Code 2 oder `{"decision":"block"}` blockieren.
- **Einsatz:** `PreCompact` Hook in settings.json konfigurieren
- **Mehrwert:** Kontrolle über den Zeitpunkt der Context-Kompaktierung — wichtig wenn bestimmte Informationen nicht verloren gehen dürfen.
- **Version:** v2.1.105

### [Plugin Background Monitors]
- **Was:** Plugins können über einen `monitors` Schlüssel im Manifest Background-Monitore registrieren, die Events in den Konversationsstream einspeisen.
- **Einsatz:** `"monitors"` in plugin.json definieren
- **Mehrwert:** Plugins können Live-Daten (Logs, Metriken, Events) direkt in die Konversation streamen.
- **Version:** v2.1.105

### [/proactive als Alias für /loop]
- **Was:** `/proactive` ist ein neuer Alias für den `/loop` Befehl.
- **Einsatz:** `/proactive` statt `/loop` verwenden
- **Mehrwert:** Intuitiverer Befehlsname für proaktives Monitoring und wiederkehrende Aufgaben.
- **Version:** v2.1.105

### [MCP Truncation-Hinweise mit Format-Rezepten]
- **Was:** Wenn MCP-Ergebnisse abgeschnitten werden, zeigt Claude jetzt format-spezifische Hinweise (z.B. `jq` für JSON) wie man die Daten gezielter abfragen kann.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Statt stumpfer Abschneidung bekommt man actionable Tipps zur gezielteren Datenabfrage.
- **Version:** v2.1.105

### [Verbessertes Stalled-Stream-Handling]
- **Was:** Hängende API-Streams werden nach 5 Minuten abgebrochen und als Non-Streaming-Request wiederholt.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Keine endlosen Wartezeiten mehr bei Netzwerkproblemen — automatischer Fallback.
- **Version:** v2.1.105

### [/doctor mit Status-Icons und Auto-Fix]
- **Was:** `/doctor` zeigt jetzt Status-Icons für jede Prüfung. Mit `f` kann Claude erkannte Probleme automatisch beheben.
- **Einsatz:** `/doctor` ausführen, dann `f` für Auto-Fix
- **Mehrwert:** Schnellere Diagnose und Ein-Klick-Behebung von Setup-Problemen.
- **Version:** v2.1.105

### [Skill Description Limit auf 1.536 Zeichen]
- **Was:** Das Zeichenlimit für Skill-Beschreibungen wurde von 250 auf 1.536 Zeichen angehoben.
- **Einsatz:** Automatisch aktiv — längere Beschreibungen in Skill-Definitionen möglich
- **Mehrwert:** Skills können detailliertere Beschreibungen haben, was bessere Erkennung und Nutzung ermöglicht.
- **Version:** v2.1.105

### [SSH/Mosh 16-Color-Palette repariert]
- **Was:** Ausgewaschene Farben über SSH/mosh auf Ghostty, Kitty, Alacritty, WezTerm, foot, rio und Contour behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Korrekte Farbdarstellung bei Remote-Nutzung über moderne Terminal-Emulatoren.
- **Version:** v2.1.105

### [Vim-Modus History-Navigation]
- **Was:** Im Vim-Modus navigieren `j`/`k` im NORMAL-Modus durch die Eingabe-History.
- **Einsatz:** Vim-Modus aktivieren (`/config` → Editor mode), dann `j`/`k` im Normal-Modus
- **Mehrwert:** Natürliche Vim-Navigation durch frühere Eingaben.
- **Version:** v2.1.98

### [Accept Edits Auto-Approval]
- **Was:** Accept Edits Mode genehmigt jetzt automatisch sichere Befehle mit Umgebungsvariablen-Prefixes und Prozess-Wrappern.
- **Einsatz:** Automatisch aktiv im Accept Edits Mode
- **Mehrwert:** Weniger manuelle Genehmigungen für offensichtlich sichere Befehle.
- **Version:** v2.1.97

### [Cedar Policy Syntax-Highlighting]
- **Was:** Syntax-Highlighting für Cedar Policy-Dateien (`.cedar`, `.cedarpolicy`).
- **Einsatz:** Automatisch aktiv bei Anzeige von Cedar-Dateien
- **Mehrwert:** Bessere Lesbarkeit von Cedar Policy-Definitionen in Claude Code.
- **Version:** v2.1.97

### [Session-Titel in UserPromptSubmit Hooks]
- **Was:** `UserPromptSubmit` Hooks können den Session-Titel über `hookSpecificOutput.sessionTitle` setzen.
- **Einsatz:** In UserPromptSubmit Hook `sessionTitle` im Output setzen
- **Mehrwert:** Automatische Session-Benennung basierend auf dem ersten Prompt oder Custom-Logik.
- **Version:** v2.1.94

### [CLAUDE_CODE_SCRIPT_CAPS]
- **Was:** Neue Umgebungsvariable um die maximale Anzahl von Script-Aufrufen pro Session zu begrenzen.
- **Einsatz:** `CLAUDE_CODE_SCRIPT_CAPS=100` setzen
- **Mehrwert:** Schutz vor Endlosschleifen und unkontrolliertem Script-Verbrauch in automatisierten Setups.
- **Version:** v2.1.98

### [Prompt-Cache-Ablauf-Hinweis]
- **Was:** Pro-User sehen im Footer einen Hinweis wenn der Prompt-Cache abläuft.
- **Einsatz:** Automatisch aktiv für Pro-Subscription
- **Mehrwert:** Bewussterer Umgang mit Pausen — man weiß wann der Cache verfällt und die nächste Anfrage teurer wird.
- **Version:** v2.1.92

### [Remote Control Session-Namen]
- **Was:** Remote Control Sessions verwenden automatisch den Hostnamen als Prefix (überschreibbar mit `--remote-control-session-name-prefix`).
- **Einsatz:** Automatisch aktiv; `--remote-control-session-name-prefix "mein-name"` zum Überschreiben
- **Mehrwert:** Einfachere Identifikation von Remote Sessions bei mehreren verbundenen Rechnern.
- **Version:** v2.1.92

### [Team-Onboarding-Befehl]
- **Was:** Neuer `/team-onboarding` Befehl generiert einen Einarbeitungsleitfaden für neue Teammitglieder basierend auf der lokalen Claude Code Nutzung.
- **Einsatz:** `/team-onboarding` im Terminal ausführen
- **Mehrwert:** Neues Teammitglied kann sofort sehen, wie das Team Claude Code verwendet, welche Conventions gelten und welche Workflows etabliert sind.
- **Version:** v2.1.101

### [Automatisches OS CA-Zertifikats-Vertrauen]
- **Was:** Claude Code vertraut nun automatisch dem OS-Zertifikatspeicher. Enterprise-TLS-Proxys funktionieren ohne zusätzliches Setup.
- **Einsatz:** Automatisch aktiv. `CLAUDE_CODE_CERT_STORE=bundled` um nur gebündelte CAs zu nutzen.
- **Mehrwert:** Kein manuelles Zertifikats-Setup mehr nötig in Enterprise-Umgebungen mit TLS-Inspection.
- **Version:** v2.1.101

### [Ultraplan & Remote-Sessions mit Standard-Cloud-Umgebung]
- **Was:** `/ultraplan` und andere Remote-Session-Features erstellen automatisch eine Standard-Cloud-Umgebung, wenn keine vorhanden ist.
- **Einsatz:** `/ultraplan` ausführen — Cloud-Umgebung wird bei Bedarf automatisch bereitgestellt
- **Mehrwert:** Kein manuelles Setup einer Cloud-Umgebung mehr nötig bevor man Remote-Features nutzen kann.
- **Version:** v2.1.101

### [SDK Cleanup bei vorzeitigem Abbruch]
- **Was:** SDK `query()` bereinigt jetzt Subprozesse und temporäre Dateien korrekt bei `break` aus `for await` oder `await using`.
- **Einsatz:** Automatisch aktiv bei SDK-Nutzung
- **Mehrwert:** Verhindert Ressourcen-Leaks bei programmatischer Claude Code Nutzung mit dem SDK.
- **Version:** v2.1.101

### [Verbesserter Brief-Modus]
- **Was:** Brief-Modus wiederholt einmalig, wenn Claude Klartext statt strukturierter Nachricht antwortet. Focus-Mode schreibt selbstständigere Zusammenfassungen.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Konsistentere und nützlichere kurze Antworten im Brief-Modus.
- **Version:** v2.1.101

### [Bessere Rate-Limit-Meldungen]
- **Was:** Retry-Meldungen zeigen jetzt welches Limit erreicht wurde und die Rücksetzungszeit.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Man weiß sofort, welches Limit betroffen ist und wie lange man warten muss.
- **Version:** v2.1.101

### [Session-Titel-Resume]
- **Was:** `claude -p --resume <name>` akzeptiert nun auch Session-Titel von `/rename` oder `--name`.
- **Einsatz:** `claude -p --resume "mein-feature"` (mit dem vergebenen Titel)
- **Mehrwert:** Sessions lassen sich mit lesbaren Namen statt kryptischen IDs fortsetzen.
- **Version:** v2.1.101

### [Command-Injection-Fix in LSP]
- **Was:** Sicherheitslücke bei Command Injection im POSIX `which` Fallback für LSP-Binärerkennung behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Erhöhte Sicherheit bei der Erkennung von Language-Server-Binaries.
- **Version:** v2.1.101

### [Speicherleck-Fix bei langen Sessions]
- **Was:** Speicherleck durch historische Kopien im Virtual Scroller bei langen Sessions behoben.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Claude Code bleibt auch bei Stunden-langen Sessions performant.
- **Version:** v2.1.101

### [Google Vertex AI Setup-Wizard]
- **Was:** Interaktiver Setup-Wizard für Google Vertex AI direkt auf dem Login-Bildschirm.
- **Einsatz:** Beim Login-Bildschirm Vertex AI Option wählen — Wizard führt durch Setup
- **Mehrwert:** Einfaches Einrichten von Vertex AI ohne manuelle Konfiguration.
- **Version:** v2.1.98

### [Monitor Tool für Background-Scripts]
- **Was:** Neues Monitor Tool ermöglicht das Streaming von Events aus Hintergrund-Skripten.
- **Einsatz:** Monitor Tool in Claude Code verwenden um Background-Prozesse zu beobachten
- **Mehrwert:** Live-Einblick in laufende Hintergrundprozesse ohne manuelles Log-Checking.
- **Version:** v2.1.98

### [Subprocess Sandboxing mit PID Namespace]
- **Was:** PID Namespace Isolation für Subprozesse auf Linux bei aktiviertem `CLAUDE_CODE_SUBPROCESS_ENV_SCRUB`.
- **Einsatz:** `CLAUDE_CODE_SUBPROCESS_ENV_SCRUB=1` setzen
- **Mehrwert:** Stärkere Isolation von Subprozessen für sicherheitskritische Umgebungen.
- **Version:** v2.1.98

### [Perforce-Modus]
- **Was:** `CLAUDE_CODE_PERFORCE_MODE` — Edit/Write/NotebookEdit schlagen bei Read-Only-Dateien fehl mit `p4 edit` Hinweis.
- **Einsatz:** `CLAUDE_CODE_PERFORCE_MODE=1` setzen
- **Mehrwert:** Nahtlose Integration mit Perforce-Versionskontrolle — Claude gibt den richtigen Befehl vor.
- **Version:** v2.1.98

### [Bash Tool Permission Hardening]
- **Was:** Mehrere Sicherheitsfixes für das Bash Tool: Bypass mit Backslash-Escaped Flags, Compound Commands bypassen Permissions, Redirects zu `/dev/tcp` werden jetzt geprüft.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Deutlich gehärtete Sicherheit bei der Ausführung von Shell-Befehlen.
- **Version:** v2.1.98

### [Focus View Toggle]
- **Was:** `Ctrl+O` im `NO_FLICKER` Mode zeigt fokussierte Ansicht mit nur Prompt, einzeiliger Tool-Zusammenfassung und Final Response.
- **Einsatz:** `Ctrl+O` im NO_FLICKER Mode drücken
- **Mehrwert:** Schneller Überblick über den Gesprächsverlauf ohne Tool-Details-Rauschen.
- **Version:** v2.1.97

### [Status-Line Refresh-Intervall]
- **Was:** `refreshInterval` Setting lässt den Status-Line-Befehl automatisch alle N Sekunden neu ausführen.
- **Einsatz:** `"refreshInterval": 5` in der Status-Line-Config setzen
- **Mehrwert:** Dynamische Status-Anzeige die sich automatisch aktualisiert (z.B. für Git-Branch, Build-Status).
- **Version:** v2.1.97

### [Status-Line: `workspace.git_worktree` im JSON-Input]
- **Was:** Der Status-Line-Befehl erhält im JSON-Input jetzt ein Feld `workspace.git_worktree`, das angibt, ob die Session in einem Git-Worktree läuft.
- **Einsatz:** Im Status-Line-Script das Feld `workspace.git_worktree` lesen und z.B. Worktree-Namen anzeigen.
- **Mehrwert:** Status-Line kann Haupt-Checkout von Worktrees optisch unterscheiden — hilfreich beim parallelen Arbeiten an mehreren Branches.
- **Version:** v2.1.92–v2.1.101

### [Live-Subagent-Indikator & /agents Tab-Layout]
- **Was:** `/agents` bekommt ein Tab-Layout: ein „Running"-Tab zeigt aktive Subagents mit `● N running` Zähler, im „Library"-Tab stehen pro Agent-Typ die Aktionen „Run agent" und „View running instance".
- **Einsatz:** `/agents` aufrufen und zwischen Running/Library-Tab wechseln
- **Mehrwert:** Sofortiger Überblick welche Agents gerade laufen — und direkter Sprung zu Start oder Inspektion einer aktiven Instanz.
- **Version:** v2.1.97

### [Standard-Effort auf High gesetzt]
- **Was:** Standard-Effort-Level von Medium auf High geändert für API-Key, Bedrock/Vertex/Foundry, Team und Enterprise User.
- **Einsatz:** Automatisch aktiv (überschreibbar mit `/effort`)
- **Mehrwert:** Bessere Antwortqualität als Standard ohne manuelle Anpassung.
- **Version:** v2.1.94

### [Amazon Bedrock Mantle Support]
- **Was:** Unterstützung für Amazon Bedrock powered by Mantle.
- **Einsatz:** `CLAUDE_CODE_USE_MANTLE=1` setzen
- **Mehrwert:** Neue Deployment-Option für Bedrock-Nutzer mit Mantle-Infrastruktur.
- **Version:** v2.1.94

### [Bedrock Setup-Wizard]
- **Was:** Interaktiver Bedrock Setup-Wizard direkt auf dem Login-Bildschirm.
- **Einsatz:** Beim Login Bedrock-Option wählen — Wizard führt durch Setup
- **Mehrwert:** Vereinfachte Einrichtung von Bedrock ohne manuelle Konfiguration.
- **Version:** v2.1.92

### [Kosten-Breakdown pro Modell]
- **Was:** Per-Model und Cache-Hit Breakdown in `/cost` für Subscription-User.
- **Einsatz:** `/cost` ausführen
- **Mehrwert:** Transparente Kostenaufschlüsselung zeigt wo die Token-Kosten entstehen.
- **Version:** v2.1.92

### [Interaktiver Release-Notes-Picker]
- **Was:** `/release-notes` ist jetzt ein interaktiver Version-Picker statt einer statischen Anzeige.
- **Einsatz:** `/release-notes` ausführen und Version wählen
- **Mehrwert:** Gezielte Release-Notes für die gewünschte Version statt Scrollen durch alle Änderungen.
- **Version:** v2.1.92

### [Remote Settings Force-Refresh]
- **Was:** `forceRemoteSettingsRefresh` Policy Setting blockiert Startup bis Remote Managed Settings geladen sind.
- **Einsatz:** `"forceRemoteSettingsRefresh": true` in Policy-Settings
- **Mehrwert:** Garantiert, dass Enterprise-Policies geladen sind bevor Nutzer arbeiten können.
- **Version:** v2.1.92

### [60% schnellere Write-Tool Diffs]
- **Was:** Write Tool Diff-Berechnung ist 60% schneller.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Spürbar schnellere Datei-Schreiboperationen, besonders bei großen Dateien.
- **Version:** v2.1.92

---

### Woche 14 (30. März – 3. April 2026) — v2.1.86–v2.1.91

---

### [Computer Use in der CLI]
- **Was:** Claude kann native Apps öffnen, durch UIs klicken, Änderungen verifizieren und Fehler beheben — alles aus dem Terminal heraus. Research Preview.
- **Einsatz:** `/mcp` öffnen, `computer-use` finden und aktivieren. Dann z.B.: `"Open the iOS simulator, tap through onboarding, and screenshot each step"`
- **Mehrwert:** Schliesst die Verifikations-Lücke für GUI-only Apps (iOS Simulator, native macOS Apps, etc.) die keine API haben.
- **Version:** v2.1.86–v2.1.91

### [/powerup — Interaktive Lektionen]
- **Was:** Interaktive Lektionen mit animierten Demos für Claude Code Features direkt im Terminal.
- **Einsatz:** `/powerup` ausführen
- **Mehrwert:** Entdecke neue Features die du verpasst hast — lernendes Onboarding statt Release Notes lesen.
- **Version:** v2.1.90

### [Flicker-Free Rendering]
- **Was:** Neuer Alt-Screen-Renderer mit virtualisiertem Scrollback. Prompt-Input bleibt fixiert, Maus-Selektion funktioniert über lange Gespräche, kein Flicker beim Neuzeichnen.
- **Einsatz:** `export CLAUDE_CODE_NO_FLICKER=1` setzen und Claude Code neu starten
- **Mehrwert:** Deutlich angenehmeres visuelles Erlebnis, besonders bei langen Sessions und großen Ausgaben.
- **Version:** v2.1.89

### [MCP Result-Size Override]
- **Was:** MCP-Server-Autoren können das Truncation-Limit pro Tool auf bis zu 500K Zeichen anheben via `anthropic/maxResultSizeChars`.
- **Einsatz:** In der `tools/list` Antwort des MCP-Servers: `"_meta": { "anthropic/maxResultSizeChars": 500000 }`
- **Mehrwert:** Tools mit großen Payloads (DB-Schemas, Datei-Bäume) werden nicht mehr abgeschnitten und als Datei-Referenz persistiert.
- **Version:** v2.1.91

### [Plugin Executables auf PATH]
- **Was:** Executables im `bin/` Verzeichnis eines Plugins werden automatisch dem Bash-Tool PATH hinzugefügt.
- **Einsatz:** `bin/` Verzeichnis im Plugin-Root anlegen mit ausführbaren Dateien
- **Mehrwert:** CLI-Helfer können als bare Commands aufgerufen werden — kein absoluter Pfad oder Wrapper-Skript nötig.
- **Version:** v2.1.91

### [Voice Mode Verbesserungen]
- **Was:** Push-to-Talk Modifier-Kombinationen, Windows WebSocket-Unterstützung und macOS Apple Silicon Mikrofon-Berechtigung für Voice Mode.
- **Einsatz:** Voice Mode aktivieren — Verbesserungen automatisch aktiv
- **Mehrwert:** Zuverlässigere Sprachsteuerung auf allen Plattformen.
- **Version:** v2.1.86–v2.1.91

### [Hook Output auf Disk bei >50K]
- **Was:** Hook-Output über 50K Zeichen wird jetzt auf Disk gespeichert mit Pfad und Preview statt direkt in den Kontext injiziert.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Verhindert Context-Überflutung durch große Hook-Outputs bei gleichzeitigem Zugriff auf die Daten.
- **Version:** v2.1.86–v2.1.91

### [PermissionDenied Hook für Auto Mode]
- **Was:** Neuer `PermissionDenied` Hook feuert bei Classifier-Ablehnungen in Auto Mode. Mit `retry: true` kann Claude einen anderen Ansatz versuchen.
- **Einsatz:** `PermissionDenied` Hook in settings.json konfigurieren; `/permissions` → Recent zeigt Ablehnungen mit `r` zum Retry
- **Mehrwert:** Feinere Kontrolle über Auto-Mode-Entscheidungen und Möglichkeit automatischer Fehlerkorrektur.
- **Version:** v2.1.86–v2.1.91

### [Defer-Wert für PreToolUse Hooks]
- **Was:** `defer` als neuer `permissionDecision` Wert für PreToolUse Hooks. `-p` Sessions pausieren beim Tool Call und geben ein `deferred_tool_use` Payload aus.
- **Einsatz:** In PreToolUse Hook `permissionDecision: "defer"` setzen; mit `--resume` fortsetzen
- **Mehrwert:** SDK-Apps oder Custom UIs können Tool-Aufrufe prüfen bevor sie ausgeführt werden.
- **Version:** v2.1.86–v2.1.91

### [disableSkillShellExecution Setting]
- **Was:** Neues Setting blockiert Inline-Shell-Ausführung aus Skills, Slash-Commands und Plugin-Commands.
- **Einsatz:** `"disableSkillShellExecution": true` in settings.json
- **Mehrwert:** Zusätzliche Sicherheitsebene für Umgebungen die keine Shell-Ausführung durch Plugins erlauben.
- **Version:** v2.1.91

### [Edit Tool ohne vorheriges Read]
- **Was:** Edit Tool funktioniert jetzt auch bei Dateien die via `cat` oder `sed -n` angesehen wurden, ohne separates Read.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Effizienterer Workflow — eine Operation weniger beim Bearbeiten von Dateien.
- **Version:** v2.1.86–v2.1.91

### [Thinking Summaries standardmäßig aus]
- **Was:** Thinking Summaries sind in interaktiven Sessions standardmäßig ausgeschaltet.
- **Einsatz:** `"showThinkingSummaries": true` zum Wiederherstellen
- **Mehrwert:** Weniger visuelle Ablenkung in interaktiven Sessions; bei Bedarf aktivierbar.
- **Version:** v2.1.86–v2.1.91

---

### Woche 13 (23.–27. März 2026) — v2.1.83–v2.1.85

---

### [Auto Mode]
- **Was:** Ein Classifier übernimmt Permission-Prompts: sichere Aktionen laufen ohne Unterbrechung, riskante werden blockiert. Der Mittelweg zwischen Alles-Genehmigen und `--dangerously-skip-permissions`.
- **Einsatz:** `Shift+Tab` zum Wechseln oder in `.claude/settings.json`: `"permissions": { "defaultMode": "auto" }`
- **Mehrwert:** Deutlich weniger Permission-Unterbrechungen bei sicheren Aktionen, ohne Sicherheit aufzugeben.
- **Version:** v2.1.83 (Research Preview)

### [Computer Use im Desktop]
- **Was:** Claude kann den Desktop steuern: native Apps öffnen, durch den iOS Simulator klicken, Hardware-Panels bedienen und Änderungen am Bildschirm verifizieren.
- **Einsatz:** In Desktop-App Settings aktivieren, OS-Berechtigungen gewähren, dann z.B.: `"Open the iOS simulator, tap through the onboarding flow"`
- **Mehrwert:** Verifizierung und Interaktion mit GUI-only Apps die keine API haben.
- **Version:** v2.1.83 (Desktop)

### [PR Auto-Fix]
- **Was:** Claude überwacht CI nach PR-Erstellung, behebt Failures, kümmert sich um Nits und pusht bis alles grün ist.
- **Einsatz:** Nach PR-Erstellung auf Claude Code Web den "Auto fix" Toggle im CI-Panel aktivieren
- **Mehrwert:** Kein manuelles Babysitting von PRs mehr durch mehrere Runden Lint-Fehler und CI-Fixes.
- **Version:** Web

### [Transcript-Suche]
- **Was:** Mit `/` im Transcript-Mode kann man das gesamte Gespräch durchsuchen. `n`/`N` zum Navigieren zwischen Treffern.
- **Einsatz:** `Ctrl+O` (Transcript öffnen), dann `/suchbegriff`, `n` (nächster Treffer), `N` (vorheriger)
- **Mehrwert:** Endlich den einen Bash-Befehl wiederfinden, den Claude 400 Nachrichten zuvor ausgeführt hat.
- **Version:** v2.1.83

### [PowerShell Tool für Windows]
- **Was:** Natives PowerShell Tool neben Bash. Claude kann Cmdlets ausführen, Objekte pipen und mit Windows-nativen Pfaden arbeiten.
- **Einsatz:** `"env": { "CLAUDE_CODE_USE_POWERSHELL_TOOL": "1" }` in settings.json
- **Mehrwert:** Native Windows-Erfahrung statt alles durch Git Bash zu übersetzen.
- **Version:** v2.1.84 (Preview)

### [Conditional Hooks mit `if`]
- **Was:** Hooks können jetzt ein `if` Feld mit Permission-Rule-Syntax deklarieren. Z.B. Pre-Commit-Checks nur bei `Bash(git commit *)`.
- **Einsatz:** In settings.json Hook mit `"if": "Bash(git commit *)"` konfigurieren
- **Mehrwert:** Weniger Prozess-Overhead da Hooks nur bei passenden Befehlen feuern statt bei jeder Bash-Ausführung.
- **Version:** v2.1.85

### [Bild-Chips beim Einfügen]
- **Was:** Eingefügte Bilder erzeugen `[Image #N]` Chips die man positionell referenzieren kann.
- **Einsatz:** Bild einfügen, dann z.B. "In Image #1, fix the alignment" schreiben
- **Mehrwert:** Klare Referenzierung von mehreren eingefügten Bildern in einem Prompt.
- **Version:** v2.1.83–v2.1.85

### [/status während Claude antwortet]
- **Was:** `/status` funktioniert jetzt auch während Claude gerade eine Antwort generiert.
- **Einsatz:** `/status` jederzeit ausführen
- **Mehrwert:** Live-Einblick in Session-Status ohne warten zu müssen bis Claude fertig ist.
- **Version:** v2.1.83–v2.1.85

### [Idle-Return-Hinweis]
- **Was:** Nach 75+ Minuten Inaktivität zeigt Claude Code einen Hinweis zum `/clear` an, da der Prompt-Cache verfallen ist.
- **Einsatz:** Automatisch aktiv
- **Mehrwert:** Bewusstere Entscheidung ob man die Session fortsetzt oder besser einen frischen Kontext startet.
- **Version:** v2.1.83–v2.1.85

### [Interrupt-Wiederherstellung]
- **Was:** Unterbrechung bevor Claude antwortet stellt die Eingabe automatisch wieder her.
- **Einsatz:** `Ctrl+C` drücken bevor eine Antwort kommt — Eingabe bleibt erhalten
- **Mehrwert:** Kein Verlust der getippten Nachricht mehr bei versehentlichem oder bewusstem Abbruch.
- **Version:** v2.1.83–v2.1.85

### [Plugin userConfig]
- **Was:** Plugins können jetzt bei Aktivierung nach Settings fragen und Secrets Keychain-backed speichern.
- **Einsatz:** `userConfig` in Plugin-Definition konfigurieren
- **Mehrwert:** Plugins können nutzer-spezifische Konfiguration und Secrets sicher verwalten.
- **Version:** v2.1.83–v2.1.85

### [Managed-Settings Drop-in Directory]
- **Was:** `managed-settings.d/` Verzeichnis für geschichtete Policy-Fragmente.
- **Einsatz:** Policy-Dateien in `managed-settings.d/` ablegen
- **Mehrwert:** Enterprise-Admins können Policies modular verwalten statt alles in eine Datei zu packen.
- **Version:** v2.1.83–v2.1.85

### [CwdChanged und FileChanged Hook Events]
- **Was:** Neue Hook-Events `CwdChanged` und `FileChanged` für direnv-ähnliche Setups.
- **Einsatz:** `CwdChanged` / `FileChanged` Hooks in settings.json konfigurieren
- **Mehrwert:** Automatische Reaktion auf Verzeichnis- oder Dateiwechsel (z.B. Umgebungsvariablen nachladen).
- **Version:** v2.1.83–v2.1.85

### [Agent initialPrompt]
- **Was:** Agents können in Frontmatter ein `initialPrompt` deklarieren, das automatisch als erster Turn gesendet wird.
- **Einsatz:** `initialPrompt: "..."` in Agent-Frontmatter
- **Mehrwert:** Agents starten sofort mit Arbeit statt auf eine erste Nachricht zu warten.
- **Version:** v2.1.83–v2.1.85

### [Externer Editor mit Ctrl+X Ctrl+E]
- **Was:** `Ctrl+X Ctrl+E` öffnet den externen Editor, passend zum Readline-Standard.
- **Einsatz:** `Ctrl+X Ctrl+E` drücken
- **Mehrwert:** Gewohntes Tastenkürzel für Vim/Emacs-Nutzer um längere Prompts im Editor zu schreiben.
- **Version:** v2.1.83–v2.1.85

---

## Quellen

- [What's New (Offizielle wöchentliche Digests)](https://code.claude.com/docs/en/whats-new)
- [GitHub Releases](https://github.com/anthropics/claude-code/releases)
- [Anthropic Blog Announcements](https://claude.com/blog-category/announcements)
- [Platform Release Notes](https://platform.claude.com/docs/en/release-notes)
