---
title: Michigan Growth Model
type: topic
created: 2026-09-10
updated: 2026-09-10
status: active
curated: false
tags: [topic, growth, background]
---

Background reference for [[adequate-growth-targets]] and [[nearest-grade-average-method]].

Most of what follows was on hidden slides 5–12 of [[tac-growth-update-deck-2026-04]] and was
skipped in the live presentation. The minutes cover it because it came up in discussion.

## Metrics

**Student Growth Percentile (SGP)** — the percentage of students with similar score histories
having lower growth than this student. A normative description of growth achieved.

**Adequate Growth Percentile (AGP)** — the SGP a student must consistently meet or exceed to
reach proficiency within a set timeframe. A criterion-referenced target expressed on a
normative scale.

**Growth target timeframe** — the number of years in which a student is expected to reach
proficiency. Michigan's timeframes were set by empirical review of past student progressions.

Asked how the targets were originally set, the answer in the room was that they came out of
"the R-set that Damian Betebenner built" — the R SGP package.

## Coverage

- Content areas: grades 4–8 and 11. Grades 9 and 10 are computed and delivered to schools in
  the student data file but are **not** included in accountability.
- English language proficiency: grades 1–12.

## Current target methods

| Method | Assessments | Precision |
|---|---|---|
| Quantile regression (R SGP package) | M-STEP, PSAT 8, PSAT 9, PSAT 10, SAT with Essay, WIDA ACCESS | Individual student score history — student, assessment, content area, grade, prior-year-1 and prior-year-2 scaled scores |
| Logistic regression | MI-Access | Group score history — assessment, content area, prior-year-1 performance level. A handful of large buckets |

The logistic regression build sets the growth target cut point at a 50% probability of
proficiency.

The proposed [[nearest-grade-average-method]] sits between the two on precision.

## Timeframe rationale

- Content areas: 1–3 years. Three-year maximum on reliability concerns and Michigan
  legislative policy.
- English learner proficiency: 1–5 years. Five-year maximum on research (which suggests 5–7
  years) and federal policy.

## State-level uses

Public reporting — the Parent Dashboard, the Student Growth Report, the Annual Education
Report. High-stakes school accountability through the School Index. The rationale is
continuous improvement, and growth reporting is required under ESSA.

**Two former uses no longer exist.** From the deck's speaker notes on slide 6, found nowhere
in the minutes:

> Educator Evaluations were repealed from state law. Districts may now conduct those however
> based solely on local policy and do not report them to the state. School grades were also
> repealed from state law.

This narrows the set of high-stakes consumers of growth data, and is relevant to any argument
about how much precision the model must carry.

## Related

[[adequate-growth-targets]] · [[nearest-grade-average-method]] ·
[[tac-growth-update-deck-2026-04]]
