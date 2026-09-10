---
title: Corpus Log
type: log
created: 2026-09-10
updated: 2026-09-10
---

Append-only, reverse-chronological. Newest first.

## [2026-09-10] ingest | April 23–24, 2026 TAC meeting

**Action:** ingest

Initial construction of the corpus from the April 2026 meeting materials, built for
demonstration at the September 10, 2026 TAC meeting.

**Pages created:** 76.

1 meeting, 5 sessions, 7 artifacts, 12 topics, 38 recommendations (including the register),
8 questions, 12 people, 11 organizations, plus `schema.md`, `glossary.md`, and `index.md`.

**Sources ingested**

Everything in `raw/2026-04-23/` — the agenda, the 9-page summary minutes, and five presentation
artifacts. Text was extracted with `pdftotext -layout`, PowerPoint content including hidden
slides and speaker notes via direct OOXML extraction, and the 52-page CT-PO simulation deck was
rendered to page images and read visually.

**Key additions the source minutes do not contain**

*The simulation results.* Roughly thirty of the deck's fifty-two pages are chart images carrying
no text. Reading them recovered: the empirical non-normality that justifies abandoning the
multivariate normal assumption; the eigenvalue evidence that the data is effectively one
dimension (first eigenvalue ~12.7 against second and third ~1–2.5); the finding that CT-PO beats
SBAC on accuracy and consistency in **every** simulated condition; and — most importantly — the
Batch 2 gradient showing that CT-PO's advantage collapses as the latent dimensions become less
separable, which is the realistic operating region for a test engineered toward
unidimensionality. Recorded in [[ct-po-vs-sbac-simulation-deck]].

*The hidden slides and speaker notes.* Eight hidden slides in the growth deck carry the canonical
statement of Michigan's current growth model. Two speaker notes carry material found nowhere in
the minutes: the repeal of educator evaluations and school grades from state law, and the
post-COVID data limit that explains the WIDA projection horizon. Recorded in
[[tac-growth-update-deck-2026-04]] and [[michigan-growth-model]].

*The participation trend.* The handout's own totals show interim testing down about 2% in a year
when six new schools joined — a retention problem the presentation does not name. Recorded in
[[smarter-balanced-interim-participation-data]].

**The design decision that makes it work**

`recommendations/` as a first-class page type with `status:` and `raised:`. A TAC's value is
longitudinal and the current record cannot support the question "what did we advise, and what
happened?" [[open-recommendations-april-2026]] is the register that answers it: 37 discrete
recommendations, 2 accepted, 1 declined, 34 open.

**Fidelity decisions**

Body-level attribution preserved throughout — the minutes attribute to "TAC," never to
individuals, and inferring otherwise would fabricate a record the source cannot support. The
loss is documented rather than repaired.

Transcription errors corrected in wiki prose and catalogued in
[[tac-meeting-notes-april-2026]], including a correlation reported as "between 2.7 and 2.8"
(certainly 0.7–0.8) and "Cronbach's coefficient theta" where the source deck says coefficient α.
The error rate is evidence, so it is recorded rather than quietly fixed.

Where the agenda and minutes disagree — session order, session naming, an off-agenda WIDA item,
an unrecorded minute-approval item — both are recorded and the minutes are followed for content.

**Open — the meeting this was built for**

Nothing in the register has been closed, because no meeting has occurred between April and
September to close it. The September 10, 2026 meeting is the first test of whether the register
does the job it was built for.
