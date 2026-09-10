---
name: tac-query
description: Answer a question from the Michigan TAC corpus with citations to specific wiki pages. Use when asked what the committee advised, what the state of an issue is, what happened in a session, or what is still open.
---

# tac-query

Answer from the corpus, with citations. Never from memory.

## Retrieval order

1. **`wiki/index.md`** — curated prose grouped by theme. It will usually point you at the right
   two or three pages directly.
2. **Choose the page type by the question shape:**
   - "What is the state of X?" → `topics/`
   - "What did the TAC advise about X?" → `recommendations/`, and the register at
     `recommendations/open-recommendations-april-2026.md`
   - "What happened in the session on X?" → `sessions/`
   - "What does this document say?" → `artifacts/`
   - "What's still open?" → the register, plus `questions/`
   - An acronym → `glossary.md`
3. **Grep `wiki/`** for terms the index does not surface. Follow `[[wikilinks]]` outward — pages
   are densely cross-linked and the second hop is usually where the answer is.
4. **Open every page you cite.** A slug in an index line is a pointer, not a source.

## Answering

- **Cite page paths.** `wiki/topics/nearest-grade-average-method.md`, not "the wiki says."
- **Say what is not there.** The corpus has real gaps — individual attribution above all — and
  naming a gap is a better answer than filling it with a plausible guess.
- **Distinguish advice from status.** "The committee endorsed NGA" and "Michigan is adopting NGA"
  are different claims. The register carries the status; use it.
- **Carry the blockers.** Most recommendations in this corpus have prerequisites or blockers on
  their page. An answer that omits the ESSA amendment problem or the undefined-inference problem
  is incomplete even when it is accurate.
- **Preserve body-level attribution.** The committee advised; a member did not, unless the source
  names them.

## Worked example

*"What did the TAC advise about adequate growth targets, and what is blocking it?"*

Index → `topics/adequate-growth-targets.md` → the committee endorsed the Nearest Grade Average
method (`recommendations/rec-growth-pursue-nearest-grade-average.md`, status accepted) **and**
argued the adequacy threshold should rise above the 65th percentile
(`rec-growth-adequate-target-above-65.md`, open). Blocked by
`topics/essa-plan-constraints.md` — the AGP is written into Michigan's approved ESSA plan, so a
definitional change needs a federal plan amendment; OEAA believes the NGA change is a technical
update within its own authority, but the change touches all grades and would require an announced
break in trend that `questions/q-growth-break-in-trend-communication.md` records as unplanned.
Also gated by `questions/q-growth-desirable-impact.md`.
