# Claude Code News

> Automatisch kuratierte Zusammenfassung der neuesten Claude Code Änderungen.
> Letzte Aktualisierung: 2026-05-02 06:00 UTC (timestamp refresh — keine neuen Releases seit v2.1.126)

---

## Neueste Änderungen

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
