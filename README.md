# Michigan TAC — AI-Native Meeting Corpus

A demonstration built for the September 10, 2026 meeting of the Michigan OEAA/OEE Technical
Advisory Committee.

**Site:** <https://dbetebenner.github.io/Michigan_TAC_042326/>

## What this is

The April 23–24, 2026 TAC meeting produced an agenda, five presentation artifacts, and nine
pages of summary minutes. This repo turns that material into a structured, queryable corpus —
and argues that the whole TAC cycle should work this way.

Two documents are published from it, in HTML and PDF:

- **A Fuller Record** — a comprehensive summary of the April meeting, built from the official
  minutes treated as a rough transcript, plus everything the minutes could not carry: findings
  locked in chart images, eight hidden slides, two speaker notes, and a participation total that
  appears on no slide.
- **Toward an AI-Native TAC** — a brief for Andrew Middlestead, Director of OEAA, on capturing
  the committee's work as a corpus rather than a document. With a technical appendix.

## Layout

```
raw/          source documents, exactly as distributed — never modified
wiki/         the corpus: 98 cross-linked pages
documents/    Quarto sources for the two published documents
styles/       SCSS for HTML, LaTeX preamble for PDF — one token set, two channels
filters/      wikilink resolution, PDF block components
scripts/      extraction, slug map, link check, render
.claude/      agent onboarding: operating manual, hooks, agents, skills
```

`AGENTS.md` is the operating manual. `wiki/schema.md` defines the page conventions.
`wiki/index.md` is the way into the corpus.

## Working in this repo

The one invariant: **you own `wiki/`, you never modify `raw/`.**

```bash
./scripts/extract-sources.sh 2026-04-23   # regenerate derived text and page images
./scripts/check-links.sh                  # every [[wikilink]] resolves, no orphans
./scripts/render.sh                       # build _site/ with both documents in HTML and PDF
```

Requires Quarto, XeLaTeX, R, and the Josefin Sans / Noto Sans font families. Nothing rendered is
committed; CI publishes to GitHub Pages on push to `main`.

## The corpus in one number

Thirty-seven discrete recommendations from one meeting, each with a status and an owner. The
official minutes contain the same advice, distributed through nine pages of narrative, with no
way to ask what happened to any of it.
