---
title: "Wiki Schema — Michigan TAC corpus"
type: schema
created: 2026-09-10
updated: 2026-09-10
---

This wiki records the deliberations of the Michigan OEAA/OEE Technical Advisory Committee.
The operating manual for agents is `../AGENTS.md`; this file governs page conventions.

## The evidence chain

A research wiki organizes around `Source → Theory → Method → Finding`. A committee wiki
organizes around **advice and its fate**:

```
Artifact → Session → Topic → Recommendation → Follow-up
              ↕                    ↕
        People / Organizations
```

The key entity is **Recommendation**: a discrete piece of committee advice, *plus* the
reasoning behind it, *plus* who it is addressed to, *plus* its current status. A TAC's worth
is measured over years, not meeting days, and only this page type makes that measurable.

## Page types

| Type | Directory | Purpose |
|---|---|---|
| meeting | `meetings/` | One per convening: dates, venue, roster, session index, themes |
| session | `sessions/` | One per agenda session: presenter, artifacts, what was asked, what was advised |
| artifact | `artifacts/` | Summary of one source document in `raw/`, with provenance and known defects |
| topic | `topics/` | A standing thread that outlives any one meeting — the unit of institutional memory |
| recommendation | `recommendations/` | One discrete piece of TAC advice, with status and reasoning |
| question | `questions/` | An open question posed but not resolved, or a "bring this next time" item |
| analysis | `analyses/` | A member's worked response, developed **between** meetings — the artifact the current process has no place for |
| person | `people/` | A participant: role, affiliation, sessions, standing interests |
| organization | `organizations/` | A body appearing in the record: MDE, DRC, Pearson, Smarter Balanced, … |
| glossary | `glossary.md` | Acronyms and terms of art, for retrieval grounding |

### A note on `analyses/`

Every other page type records what happened at a meeting. `analyses/` records what a member
worked out afterwards, from the corpus, without waiting for the next convening. It is the
only type that is **individually attributed** — and it can be, because it is authored rather
than minuted. Everywhere else the source attributes to a body and this corpus honours that.

An analysis page states who wrote it, what it responds to, and what it is asking the presenter
to do. It is a contribution to the record, not a summary of it, and it should be readable by
the person it addresses.

## One fact, one page

A fact lives in exactly one place. A `sessions/` page says what happened on the day and
points at the topics it advanced; it does not restate the topic's history. A `topics/` page
carries the state of the issue across meetings and points at the sessions that moved it. A
recommendation is never restated inside a session page — it is linked.

## Naming

- Files are `kebab-case.md`. Slugs are **unique across the whole wiki** — the link filter
  resolves on bare slug, so a collision is a bug.
- Recommendations are `rec-<topic>-<short-predicate>.md`, e.g.
  `rec-growth-adequate-target-above-65.md`.
- Sessions are `<YYYY-MM>-<topic-slug>.md`, e.g. `2026-04-smarter-balanced-interim.md`.
- Match each page's `title:` to its filename.

## Frontmatter

```yaml
---
title: <page title>
type: meeting | session | artifact | topic | recommendation | question | person | organization
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: draft | active | superseded          # recommendations use the vocabulary below
curated: false                               # false = safe to regenerate; true once meaningfully edited
meeting: 2026-04-23                          # sessions, recommendations, questions
sources:
  - <path in raw/, or another wiki page>
tags: []
---
```

Recommendations carry three more fields:

```yaml
raised: 2026-04-23
addressed-to: OEAA | OEE | DRC | Pearson | Smarter Balanced | TAC
status: open | accepted | in-progress | closed | declined | superseded
```

`status` is the field that makes the corpus longitudinal. A recommendation stays `open`
until a later meeting moves it. **Never silently close one** — the meeting that changed it
gets named in the page body.

## Links

- Internal links are bare slugs: `[[nearest-grade-average-method]]`. Not
  directory-qualified, no file extension. Resolved for the published site by
  `filters/wikilinks.lua`.
- Add back-links whenever you create a page. No orphans.
- Cite `raw/` files by path in `sources:`, never by wikilink — `raw/` is not wiki content.

## Index and log

- `index.md` — hand-curated catalog grouped by theme, with a one-line description per entry.
  It is prose, not a directory listing; if it reads like `ls` output it is wrong.
- `log.md` — append-only, reverse-chronological. Machine-parseable headers so the session
  hook can read the last few entries:

```
## [YYYY-MM-DD] <action> | <title>

**Action:** <ingest | synthesize | recommend | query | lint | publish>
Pages created: ...
Pages updated: ...
Key additions: ...
```

## Restricted material

The corpus is public. Test-security parameters and vendor commercial strategy are held
outside it in `restricted/` (gitignored, never rendered), and no page here may contain a
value held there — `scripts/check-restricted.sh` enforces this.

Redact by characterisation, never by deletion. A page missing a specific should still make
its argument, and should say where the specific lives. Quotes that embed a restricted value
get paraphrased on the page and kept verbatim in the restricted layer.

The committee's advice and reasoning are never restricted.

## Fidelity

Wiki prose uses corrected names, dates, and figures. Every correction is recorded on the
artifact page for the document that contained the error — the error rate of the current
minutes process is itself evidence for this repo's argument, so it is catalogued rather than
quietly fixed.

Questions and advice are attributed to **bodies**, never to individuals, because the source
minutes do not attribute to individuals. Do not infer. Where a named individual does appear
in the source, name them.
