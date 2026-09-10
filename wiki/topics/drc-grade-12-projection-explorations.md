---
title: DRC Grade 12 Projection Explorations
type: topic
created: 2026-09-10
updated: 2026-09-10
status: superseded
curated: false
tags: [topic, growth, drc, negative-result]
---

**State as of April 2026:** a negative result, reported honestly, and superseded within the
same session by [[nearest-grade-average-method]].

This page exists because negative results are the first thing a minutes process discards and
the first thing a successor needs.

## The goal

Develop a model that could produce a growth target for grade 12 students given a grade 11
prior — extending the projection horizon at the top of the system where
[[adequate-growth-targets]] is most strained.

## The data

A three-year sequence, grades 9 to 11, for both mathematics and English language arts.
Restricted to final SGPs; the work would need extending to scale scores.

Predictors: SGP 2023 and SGP 2024. Outcome: SGP 2025.

(The source deck states predictors SGP 2024 and SGP 2025 with outcome SGP 2025, which is
self-contradictory. See [[tac-growth-update-deck-2026-04]].)

## What was tried

Linear models. Polynomial models. Quantile regression. Main effects on the SGPs and
interaction effects between them.

## The result

None of the model fit was good. No usable model was found.

Reported to the committee as: "DRC and the OEAA are looking for recommendations, as *none of
this is great*."

## What had already been ruled out

Conditioning on performance level. DRC had started that work previously and found it "not too
promising."

## What was floated but not pursued

- Piecewise modelling
- Working between scale scores rather than SGPs
- Predicting a pseudo grade 12 score and then running SGPs on it

The last of these was posed as an open question by OEAA and DRC jointly and drew no recorded
committee response.

## Why it failed, as far as the record shows

The record does not say. What it establishes is that the failure was of *model fit* on SGP-to-SGP
prediction, which is a plausible outcome — an SGP is already a residualised quantity, and
predicting one residual from two others discards most of the signal that made the original
projection possible. Extending to scale scores, which DRC named as the needed next step, would
test that reading.

## Related

[[adequate-growth-targets]] · [[nearest-grade-average-method]] ·
[[data-recognition-corporation]]
