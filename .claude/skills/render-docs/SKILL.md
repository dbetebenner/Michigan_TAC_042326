---
name: render-docs
description: Build and publish the Michigan TAC site — both documents in HTML and PDF plus the full wiki. Use when asked to render, build, preview, or publish the site or the documents.
---

# render-docs

## Build

```bash
./scripts/render.sh
```

That script regenerates the wikilink slug map, renders the PDFs, then renders the website, then
restores the PDFs into `_site/`. **The order is load-bearing** — a Quarto render cleans its
output directory, so PDFs rendered before the site render would otherwise be deleted.

Preview a single document while iterating:

```bash
quarto preview documents/ai-native-tac.qmd
```

## What gets built

- `_site/index.html` — landing page
- `_site/documents/meeting-summary-2026-04.{html,pdf}`
- `_site/documents/ai-native-tac.{html,pdf}`
- `_site/wiki/**` — every corpus page

## Verify before publishing

```bash
./scripts/check-links.sh                    # every [[wikilink]] resolves, no orphans
pdffonts _site/documents/ai-native-tac.pdf  # Josefin Sans + Noto Sans embedded, no fallback
```

Then open one HTML document and toggle light/dark. The two themes share `styles/_tac-core.scss`
and differ only in their `:root` custom-property block, so a rule that hardcodes a colour will
show up as a light-mode value bleeding into dark.

## Publish

Push to `main`. `.github/workflows/publish.yml` renders and deploys via the GitHub Pages artifact
flow. Nothing rendered is committed.

The workflow instances Josefin Sans from its variable font before rendering the PDF — the family
ships upstream only as a variable font and XeTeX cannot address its named instances, so
`fontTools.varLib.instancer --update-name-table` is required and `fc-match` verifies it. If a PDF
build fails on CI with a fontspec error, that step is where to look.

## Style vocabulary

Defined in `styles/_tac-core.scss` and mirrored in `styles/tac-preamble.sty` so HTML and PDF
match. Quarto's native callouts (`::: {.callout-note}`) are recoloured in both channels — prefer
them over hand-rolled divs, which would need separate LaTeX handling.

Custom: `.tac-recommendation` with a status chip, `.di-eyebrow`, `.di-stat` tiles,
`.di-editorial` left-rule.
