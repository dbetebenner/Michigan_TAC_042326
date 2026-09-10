# Michigan TAC — Operating Manual

This repo is an **LLM wiki** for the Michigan Office of Educational Assessment and
Accountability (OEAA) / Office of Educator Excellence (OEE) Technical Advisory Committee.
It holds the corpus for the **April 23–24, 2026** TAC meeting and is built to accept
subsequent meetings without restructuring.

It is also an argument. The corpus exists to demonstrate that an AI-native TAC process
produces a better record, better follow-through, and better advice than the current
summary-minutes practice. See `documents/ai-native-tac.qmd`.

## The one invariant

**You own `wiki/`. You never modify `raw/`.**

`raw/` holds the source documents exactly as they were distributed — original filenames,
original typos, original ambiguity. That fidelity is evidence, not untidiness. Derived text
lives in `raw/**/extracted/` and is gitignored and regenerable via
`scripts/extract-sources.sh`. Everything you *conclude* goes in `wiki/`.

## The restricted layer

The corpus is public. Some of what vendors and OEE present to the committee is not
publishable — test-security parameters and vendor commercial strategy. That material lives
in `restricted/`, which is gitignored and never rendered.

**A public page never contains a value held there.** `scripts/check-restricted.sh` enforces
it and runs in `render.sh` and in CI.

Redact by **characterisation, not deletion**. A public page that has had a specific removed
still carries the argument that specific was evidence for — "a single high overlap ceiling
applied across four groups of very different volume" rather than a hole. The committee's
advice and its reasoning are never restricted; they are the point of the corpus.

When a new meeting produces vendor-sensitive specifics, see `restricted/README.md`.

## What this corpus is for

A TAC meets three times a year. Vendors and state staff bring issues; the committee gives
advice. The value of that advice is **longitudinal** — what the TAC recommended in April has
to be checkable in September. A pile of PDFs cannot answer "what did we advise about
adequate growth targets, and what is blocking it?" This wiki can.

That is why `wiki/recommendations/` is the load-bearing page type. Every discrete piece of
committee advice is one page carrying a `status:` and a `raised:` date.

## Structure

```
raw/<meeting-date>/    agenda/ minutes/ presentations/ extracted/   IMMUTABLE
wiki/                  the corpus — yours
documents/             Quarto sources for published documents
styles/ filters/ scripts/   the publishing pipeline
```

`wiki/schema.md` governs page types, frontmatter, link style, and the log format. Read it
before authoring anything. `wiki/index.md` is the hand-curated catalog; `wiki/log.md` is the
append-only record of what changed and why.

## The evidence chain

```
Artifact → Session → Topic → Recommendation → Follow-up
              ↕                    ↕
        People / Organizations
```

Read it as: a source document was presented in a session; the session advanced one or more
standing topics; the committee's advice on those topics is recorded as recommendations; each
recommendation has a follow-up state that later meetings update.

## Answering questions from the corpus

1. Start at `wiki/index.md`. It is curated prose grouped by theme, not a file listing.
2. Grep `wiki/` for the topic. Open the pages you cite.
3. **Cite page paths. Never assert from memory.** If the corpus does not support a claim,
   say so — the gaps are themselves findings.
4. Prefer a `topics/` page for "what is the state of X"; a `recommendations/` page for "what
   did the TAC advise"; a `sessions/` page for "what happened on the day."

Acronyms are grounded in `wiki/glossary.md`. Resolve AGP, SGP, NGA, CT-PO, MTTC, CRI, WIDA,
MAC, MERA there rather than guessing.

## Fidelity rules

- The April minutes contain transcription errors (`04/204/26`; `Damion Betebenner`; `APG`
  for `AGP`; a correlation given as "between 2.7 and 2.8" that is certainly 0.7–0.8;
  "Cronbach's coefficient theta" where the source deck says coefficient α). Wiki prose uses
  the corrected form. The errors themselves are catalogued in
  `wiki/artifacts/tac-meeting-notes-april-2026.md` because the error rate is part of the
  argument this repo makes.
- The minutes attribute questions and advice to **bodies** (`TAC Question:`, `TAC Feedback:`),
  never to individuals. Preserve that. Do not infer which member said what — the source
  cannot support it, and the loss is itself the point.
- Where the agenda and the minutes disagree (session order, session dates), record both and
  say which you followed.

## Adding a new meeting

Use the `ingest-meeting` skill. In outline: drop sources into
`raw/<YYYY-MM-DD>/`, run `scripts/extract-sources.sh`, author `artifacts/` then `sessions/`,
extend the existing `topics/` pages rather than creating parallel ones, add new
`recommendations/`, and — most important — **update the `status:` of prior recommendations
the new meeting touched.** Then update `index.md` and append to `log.md`.

## Publishing

`quarto render` builds `_site/`, containing both documents in HTML and PDF plus every wiki
page. `scripts/build-slugmap.R` regenerates the `[[wikilink]]` resolution map and is run
automatically by `scripts/render.sh`. CI publishes to GitHub Pages on push to `main`.

Nothing rendered is committed.
