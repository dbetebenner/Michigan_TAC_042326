---
title: Session 3 — Accountability Growth Methodology Targets
type: session
created: 2026-09-10
updated: 2026-09-10
status: active
curated: false
meeting: 2026-04-23
sources:
  - raw/2026-04-23/minutes/TAC Meeting Notes 0423242026.pdf
  - raw/2026-04-23/presentations/TAC Growth Update - 2026 04.pptx
tags: [session, growth, accountability, essa]
---

**Presenters:** Chad Bailey (OEAA) and Jessalyn Smith ([[data-recognition-corporation]]) ·
**Day:** April 23, 2026

Artifact: [[tac-growth-update-deck-2026-04]]. The agenda scheduled this first, at 9:30am.

## The problem OEAA brought

Michigan's accountability index is overwhelmingly identifying **high schools**. OEAA does not
believe that reflects where the instructional problem actually is.

The mechanism is arithmetic. An Adequate Growth Percentile is the growth a student must
sustain to reach proficiency within a set timeframe, and Michigan's content-area timeframe
caps at three years. A grade 11 student has one year left. The same proficiency gap therefore
demands a far more aggressive growth target in high school than in elementary school — and
ELA shows a bigger average AGP gap than mathematics.

As stated in the room: the current identification "indicates a systemic district instructional
problem, but the identification needs to go back to the entire district experience, K-12."
Current research says a school needs five to seven years to meet growth. Michigan gives high
school three at most, and grade 11 one.

The model is working as designed. The design is the problem.

Full thread: [[adequate-growth-targets]].

## What was tried and failed

DRC set out to build a model that could produce a grade 12 target from a grade 11 prior,
examining the grade 9–11 sequence in both mathematics and ELA, restricted to final SGPs.
Predictors SGP 2023 and SGP 2024, outcome SGP 2025. Linear, polynomial, and quantile
regression were tried, with main and interaction effects.

None of it fit. In the presenters' own words, "none of this is great." Conditioning on
performance level had been tried earlier and was "not too promising." Piecewise modelling was
floated, as was predicting a pseudo grade 12 score and running SGPs on it.

Recorded as [[drc-grade-12-projection-explorations]].

## What OEAA proposed instead

The **Nearest Grade Average** method, previously used in 2018-19 for the PSAT 8/9 and SAT
transition. Rather than modelling each student, it computes an average AGP for a norm group
defined by assessment, content area, grade, and prior-year achievement NTILE(50), borrowing
from the nearest grade where a full model is estimable. NTILE(50) was chosen so that each
bucket averages 1,000 or more R-package AGPs — precision traded for stability.

It lets every high school grade project three years out, the same as elementary and middle.
It is slightly less precise than the R SGP package and considerably more precise than the
logistic regression method used for MI-Access.

Full thread: [[nearest-grade-average-method]].

## What the committee advised

The committee's response ran past the method question into what growth targets are *for*.

- [[rec-growth-pursue-nearest-grade-average]] — pursue this avenue
- [[rec-growth-adequate-target-above-65]] — adequate growth should be set above the 65th percentile, not the 50th
- [[rec-growth-support-all-students]] — build a system that supports all students, not one that communicates urgency
- [[rec-growth-research-how-agps-are-used]] — find out whether AGPs are actually used, and used well
- [[rec-growth-survey-interpretation-consistency]] — survey whether elementary and high schools read the same data the same way
- [[rec-growth-present-to-mera]] — take it to MERA for additional feedback

The sharpest exchange concerned low-achieving schools. The committee's position was that for
such schools "the norm actually tells you more than the growth," that the 60th percentile is
already adequate for them, and — bluntly — "your job is to get these kids to have more than a
year's worth of learning in a year." Against OEAA's reluctance to report raw numbers because
they discourage, the committee's answer was to raise the bar rather than to soften the report.

And underneath: "schools should not be focusing on proficiency; their goal is to produce and
maximize growth."

## What blocks it

The AGP as currently defined is written into Michigan's approved ESSA plan. Changing it
requires a plan amendment — a department-wide undertaking. OEAA believes the technical update
presented here is within its own authority, but because it touches all grades it would require
an announced break in trend.

Full thread: [[essa-plan-constraints]].

## Open questions

[[q-growth-break-in-trend-communication]] · [[q-growth-desirable-impact]]

## Related

[[michigan-growth-model]] · [[2026-04-23-tac-meeting]]
