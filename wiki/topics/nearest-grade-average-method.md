---
title: Nearest Grade Average Method
type: topic
created: 2026-09-10
updated: 2026-09-10
status: active
curated: false
tags: [topic, growth, method]
---

**State as of April 2026:** proposed, tested against current AGPs, endorsed by the committee
for further pursuit, blocked from full adoption by [[essa-plan-constraints]].

OEAA's own framing was "dusting off" the method — it is not new. It was used in 2018-19 for
the test transition to PSAT 8/9 (grade 8) and SAT with Essay.

## How it works

1. Create a previous score history for the **nearest grade** — the closest grade for which a
   full model is estimable.
2. NTILE(50) the prior-year-1 scores of that nearest grade.
3. Set the norm group: assessment, content area, grade, and prior-year-1 achievement NTILE(50).
4. Calculate the average AGP for each norm group.
5. Validate, then apply.

## Why NTILE(50)

Fifty buckets is a precision/stability trade made explicitly. Fifty is fine enough to give
"many small buckets" of output AGPs — more precision than the logistic regression method's
"handful of large buckets" — and coarse enough that each bucket averages **1,000 or more**
R-package AGPs, which is what buys the stability.

## Precision, relative

| Method | Precision unit |
|---|---|
| Quantile regression (R SGP package) | Individual student score history |
| **Nearest Grade Average** | Group score history — many small buckets |
| Logistic regression | Group score history — a handful of large buckets |

Slightly less precise than the R SGP package; more precise than logistic regression.

## What it buys

Every high school grade can project three years out, the same horizon as elementary and
middle school. That directly addresses the grade 11 one-year-of-runway problem described in
[[adequate-growth-targets]].

## Evidence presented

Four Growth Index scatterplots (deck slides 21–24, images only):

- Content areas, model **alignment** — precision between R package and NGA AGPs is "pretty close"
- Content areas, model **application** — meaningful impact on overall rating
- English Learner, model alignment
- English Learner, model application — same magnitude of impact on the EL Index using WIDA

Summary as given: fairly tight alignment, more reasonable targets for both content areas and
English Learners, and meaningful impacts on aggregate Growth and EL Progress index values.

**OEAA has not determined whether that impact is desirable** and said it would need time to
research it. Tracked as [[q-growth-desirable-impact]].

## The EL timing detail

The deck asserts EL impact will increase as Michigan reaches five years post-COVID. The
mechanism is only in slide 20's speaker notes:

> By 2026-27 WIDA NGA AGPs would be applied to grades 8-12. However, we are choosing to limit
> to data post covid (i.e., 2021-22 and forward). Meaning as of 2024-25, the most we can
> project out is 3 years.

The projection horizon is currently constrained by data availability, not by policy. As the
post-COVID window lengthens toward five years, the EL horizon extends and the impact grows.

## Committee position

Endorsed — [[rec-growth-pursue-nearest-grade-average]] — with the accompanying view that the
adequacy threshold itself should rise ([[rec-growth-adequate-target-above-65]]).

## Related

[[adequate-growth-targets]] · [[michigan-growth-model]] · [[essa-plan-constraints]] ·
[[tac-growth-update-deck-2026-04]]
