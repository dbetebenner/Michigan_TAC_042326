---
title: Model the joint density of the three dimensions
type: recommendation
created: 2026-09-10
updated: 2026-09-10
raised: 2026-04-24
addressed-to: OEAA
status: open
curated: false
meeting: 2026-04-23
sources:
  - raw/2026-04-23/minutes/TAC Meeting Notes 0423242026.pdf
tags: [recommendation, subscores, method, psychometrics]
---

**The advice.** "Suggested simulation set up: model the joint density of the three dimensions,
and understand the density of them, determine what are the correlations between dimensions.
Currently assuming linear correlation, so if you consider three dimensions, you will be able to
see what is actually there. Go from joint density to the marginals to placing the cuts in the
marginals; you would want them to be faithful to the joint density as you want to know the
relationship from the three variables from the joint and not just assume."

**Why.** The most technically substantive recommendation of the meeting.

The simulation parameterises the relationship among the three subtests as a single correlation
value — 0.65, 0.70, or 0.75 — which presumes the dependence structure is linear and identical
across the range. The empirical distributions in [[ct-po-vs-sbac-simulation-deck]] are visibly
non-normal and multimodal; a correlation coefficient cannot describe dependence in that setting.
Two variables can share a correlation of 0.7 and have entirely different joint behaviour in the
tails, which is exactly where classification cuts fall.

The proposed sequence — estimate the joint, derive the marginals from it, place the cuts in
marginals that remain faithful to the joint — keeps the dependence structure in the machinery
rather than assuming it away at the start.

**Companion.** [[rec-subscore-establish-scale-then-cuts]] gives the operational ordering;
[[rec-subscore-review-item-parameters]] is the prerequisite check.

**Status.** Open. Directly connected to
[[rec-subscore-support-zeng-collaboration]].

**Related.** [[m-step-subscore-reporting]]
