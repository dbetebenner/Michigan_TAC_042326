---
title: Session 5 — Simulation Studies on Subtest Indicators
type: session
created: 2026-09-10
updated: 2026-09-10
status: active
curated: false
meeting: 2026-04-24
sources:
  - raw/2026-04-23/minutes/TAC Meeting Notes 0423242026.pdf
  - raw/2026-04-23/presentations/CT-PO vs SBAC simulation results (draft, 4-14-2026).pdf
tags: [session, subscores, psychometrics, reporting]
---

**Presenter:** Ji Zeng (OEAA) · **Day:** April 24, 2026

The minutes date this session `04/204/26`; it is 04/24/26. The full morning of day two.
Artifact: [[ct-po-vs-sbac-simulation-deck]].

## What OEAA brought

The field has asked for more information about M-STEP subscores. Zeng's work asks whether
there is a defensible way to give it to them.

Michigan currently reports subscores for ELA, mathematics, science, and social studies in the
Dynamic Score Reporting Site and on Parent Reports. ELA and mathematics report *claims*;
science reports *domains*; both use performance indicators — Above Standard, At/Near Standard,
Below Standard — relative to the overall content cut. Mathematics Claim 2 (Problem Solving)
and Claim 4 (Modeling and Data Analysis) are combined for reporting because of content
similarity, so four claims yield three reported claim scores. Social studies reports raw
points earned over points possible.

Full thread: [[m-step-subscore-reporting]].

## What the committee said before seeing any results

This is the part of the session that determined everything after it. The committee's position
arrived early and did not move:

> Subscore reporting is used to identify areas of weakness and strength.

> You have to have some difference between the subtests in order to use them to focus on, but
> the subtests are too similar, and it does not provide accurate information for focus due to
> similarity.

> You would have to demonstrate that the subcategories are substantially different.

> We do everything we can to make everything unidimensional, but people are demanding more
> information while wanting the test to be shorter.

> We can either resist allowing them more information, or determine what method can we use
> that will give the "least bad" information.

> Seems detrimental to provide that information from something you developed to not do that.

OEAA's own finding agreed: subscore reporting "doesn't add any unique information."

The committee then chose the second horn — [[rec-subscore-least-bad-information]]. Not "stop
reporting subscores," but "if you must, report the least bad thing, and be honest about it."

## The study

Zeng compared a Classification Tree with Proportional Odds (CT-PO) against the Smarter
Balanced subscore indicator method, with K-modes as a reference.

True theta values from a Gaussian mixture model over 110 replications; operational item
parameters producing 0/1 responses; operational raw-to-scale conversion applied; CT-PO trained
on the first 10 replications and applied to the last 100 for classification accuracy; a second
set of 0/1 responses over 100 replications for classification consistency. Unidimensionality
checked by the Wainer et al. (2001) procedure — Cronbach's α per subtest, observed
variance-covariance matrix, subtract the diagonal error matrix, then eigendecompose `S_true`
and look for a single dominant eigenvalue.

Batch 1 varied component weights, mean vectors, SD vectors, and inter-subtest correlations
(0.65, 0.70, 0.75) — six weight sets, three mean vectors, calibrated to science grades 5, 8,
and 11, giving 18 GMMs per grade and 54 fitted. Batch 2 widened the mean separation and the
SD vectors because Batch 1's conditions were too alike.

## The results

CT-PO beat SBAC on both accuracy and consistency in **every** simulated condition, and had the
lowest deviance against real data at all three grades — 57,574.52 against SBAC's 77,622.43 at
grade 11.

But the results also carry a caveat the minutes state in one line and the figures make stark.
The advantage depends on the three latent dimensions being separable. At the smallest mean
separation both methods return quadratic weighted kappa in the 0.10–0.35 range and are
indistinguishable from each other. The committee saw it: "when the means are close and the
standard deviations are large, then both methods perform poorly."

The eigenvalue check makes the bind explicit — a first eigenvalue near 12.7 against second and
third near 1–2.5. The data really is one dimension.

Recovered figure detail: [[ct-po-vs-sbac-simulation-deck]].

## What the committee advised on method

- [[rec-subscore-model-joint-density]] — model the joint density of the three dimensions and derive the marginals, rather than assuming linear correlation
- [[rec-subscore-establish-scale-then-cuts]] — establish scale, establish cuts, then categorise from the theta estimate
- [[rec-subscore-review-item-parameters]] — before a Batch 3, review the item parameters and the correlations with total score
- [[rec-subscore-support-zeng-collaboration]] — Betebenner to work with Zeng

## What the committee advised on reporting

- [[rec-subscore-report-certainty]] — report a level of certainty with any category, with a measure of error
- [[rec-subscore-parent-think-alouds]] — think-alouds and focus groups with parents
- [[rec-subscore-drill-down-reporting]] — a drill-down from basic information to subscore, standard errors, learning profile
- [[rec-subscore-sample-report-next-meeting]] — bring a sample score report to the next meeting

The reporting advice reframed the problem. OEAA had been asking which method is more accurate.
The committee's answer was that the binding constraint is what a parent understands: "biggest
focus for reporting should be what parents want to know and see." A known defect was raised —
for some subscores the At/Near Standard band cannot be drawn because there is only one data
point.

## A note worth keeping

Among the reporting ideas recorded is using a generative AI model — feeding it the current
report along with parameters for what the report is trying to achieve. The committee raised
it in April 2026, unprompted, as a score-reporting design tool. It is the only mention of AI
in the meeting.

## Open questions

[[q-subscore-score-report-appearance]] · [[q-subscore-correlation-structure]]

## Related

[[2026-04-23-tac-meeting]]
