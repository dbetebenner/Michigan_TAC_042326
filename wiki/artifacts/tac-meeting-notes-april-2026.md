---
title: TAC Meeting Notes, April 2026
type: artifact
created: 2026-09-10
updated: 2026-09-10
status: active
curated: false
meeting: 2026-04-23
sources:
  - restricted/raw/2026-04-23/minutes/TAC Meeting Notes 0423242026.pdf
tags: [artifact, minutes, provenance, restricted-source]
---

The official summary minutes. Nine pages, 5,613 words, authored by Jessica Fenby (MDE) and
generated 2026-05-14 — roughly three weeks after the meeting. This is the single richest
source in the corpus and the closest thing available to a transcript.

::: {.callout-important}
## This document is not published

The PDF is **not in the public repository.** It records Session 4 in full, including the MTTC
test-form overlap ceilings, the form rotation policy, and the per-group form counts — all
test-security sensitive. Redacting those from the corpus while shipping a PDF that contains
them verbatim would accomplish nothing.

It is held in the restricted layer at `restricted/raw/2026-04-23/minutes/`, gitignored and
local only. The extracted specifics are in `restricted/mttc-form-security-detail.md`.

**The cost is auditability, for this one source.** Every other document in `raw/` can be
checked against the page that summarises it. This one cannot, by anyone without the file —
which includes every reader of the published site. The corpus asks to be trusted on its
most-cited source, and that is worth stating plainly rather than burying.

Everything else from the meeting stays public: the agenda and all five presentation
artifacts. None contains MTTC material; there was no MTTC deck.
:::

## Structure

An attendee block per day, then five sessions. Each session opens with a two-to-four sentence
third-person abstract and then drops into a bulleted record using a consistent
speaker-role-prefixed convention:

- `TAC Question:` / `TAC Feedback:` — from the committee
- `OEAA Question:` / `OEAA Feedback:` / `OEE Question:` / `OEE Feedback:` / `Pearson Question:`
- A bare bullet immediately following a `TAC Question:` is the presenter's answer.

Those markers are reliable enough to parse, which is what makes the corpus buildable at all.

## What it does well

It preserves candour. "None of this is great" survives verbatim, quotation marks and all, as
does the committee's blunt assessment that a handful of forms produced over several years,
each sharing most of its items with the others, cannot be called meaningfully different. (That
remark quotes a specific overlap figure and is held verbatim in the restricted layer.) It carries real methodological specificity — NTILE(50), the
1,000-per-bucket stability rationale, the Wainer et al. (2001) unidimensionality procedure.
The five-session structure is clean and the topical sub-headings are sensible.

## What it loses

**Individual attribution.** Every question and every recommendation is attributed to a body,
never a person. Five TAC members with distinct areas of expertise were in the room; the
record cannot tell you which of them raised the ESSA amendment problem or which pressed on
defensible inferences. The one exception is the closing note that Damian Betebenner offered
to collaborate with Ji Zeng.

**Everything in the images.** The substance of the CT-PO simulation study is in chart
images — see [[ct-po-vs-sbac-simulation-deck]]. None of it reaches the minutes beyond a
one-line conclusion.

**Everything in the speaker notes and hidden slides.** See [[tac-growth-update-deck-2026-04]].
The repeal of educator evaluations and school grades from state law, and the post-COVID limit
on WIDA projection horizons, appear nowhere in the minutes.

## Catalogued defects

Recorded here rather than corrected silently, because the error rate of the current process
is evidence for the argument in `documents/ai-native-tac.qmd`.

| In the minutes | Should be | Kind |
|---|---|---|
| `Session 5: 04/204/26` | 04/24/26 | Date typo |
| `Damion Betebenner` | Damian Betebenner | Name |
| `JI Zengs's` | Ji Zeng's | Name |
| `OEEA Question` | OEAA Question | Body |
| `The APG timeframe` | The AGP timeframe | Acronym |
| `Meaningly Different Test Forms` | Meaningfully Different Test Forms | Heading |
| `Adequate Growth Targets (AGPs)` | Adequate Growth Percentiles | Term |
| `Correlation between all content areas is between 2.7 and 2.8` | 0.7 and 0.8 | **Figure — decimal lost** |
| `Cronbach's coefficient theta` | Cronbach's coefficient α | **Statistic misnamed** |
| `unideminsional` | unidimensional | Spelling |
| `Smarter Balance s using` | Smarter Balanced is using | Garbled |
| `piece wising modeling` | piecewise modeling | Term |
| `Englisher language` (source deck) | English language | Spelling in source |

Two of these matter substantively. A correlation "between 2.7 and 2.8" is impossible and
would mislead any reader who did not already know the answer. And Cronbach's α and coefficient
theta are different statistics — the deck says α, and α is what the Wainer procedure calls for.

## A discrepancy the minutes probably get right

On the DRC exploration, the minutes record predictors `SGP 2023 and SGP 2024` with outcome
`SGP 2025`. The source deck's slide 14 says predictors `SGP 2024 and SGP 2025` with outcome
`SGP 2025` — which is self-contradictory, since an outcome cannot also be its own predictor.
The minutes are coherent and are followed here.

## Related

[[april-2026-tac-agenda]] · [[2026-04-23-tac-meeting]]
