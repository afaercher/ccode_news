# Claude Code News

> Automatisch kuratierte Zusammenfassung der neuesten Claude Code Änderungen.
> Letzte Aktualisierung: 2026-04-13

---

## Neueste Änderungen

### Woche 15+ (7.–13. April 2026) — v2.1.92–v2.1.104

---

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

### [Live-Subagent-Indikator]
- **Was:** `● N running` Anzeige in `/agents` neben Agent-Typen mit aktiven Subagent-Instanzen.
- **Einsatz:** `/agents` aufrufen — Live-Zähler wird angezeigt
- **Mehrwert:** Sofortiger Überblick welche und wie viele Agents gerade aktiv arbeiten.
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
