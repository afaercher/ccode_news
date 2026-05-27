# Claude Code News

> Automatisch kuratierte Zusammenfassung der neuesten Claude Code Änderungen.
> Letzte Aktualisierung: 2026-05-27 12:03 UTC

---

## Neueste Änderungen

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
