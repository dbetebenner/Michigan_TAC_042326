---
title: M-STEP Subscore Reporting
type: topic
created: 2026-09-10
updated: 2026-09-10
status: active
curated: false
tags: [topic, subscores, reporting, psychometrics]
---

**State as of April 2026:** a better method identified and validated in simulation, against a
committee position that the underlying enterprise is close to indefensible. The tension is
unresolved and is the most interesting open problem in the corpus.

## What Michigan reports now

Subscores for ELA, mathematics, science, and social studies, in the Dynamic Score Reporting
Site for building and district staff and in Parent Reports.

- ELA and mathematics report **claims**; science reports **domains**. Both use subscore
  performance indicators based on the Smarter Balanced method.
- Mathematics Claim 2 (Problem Solving) and Claim 4 (Modeling and Data Analysis) are combined
  for reporting because of content similarity — four claims, three reported claim scores.
- Social studies reports raw points earned over points possible.

The performance indicator graph places a student relative to the range of possible performance
within each claim or domain, in three bands:

| Band | Meaning |
|---|---|
| Above Standard | Performance on the standards in the claim is above the overall content cut |
| At/Near Standard | At or near the overall content cut |
| Below Standard | Below the overall content cut |

**A known defect:** for some subscores the At/Near Standard band cannot be drawn at all,
because there is only one data point.

## Why the field wants more

Districts have asked for more information on subscores and how they relate to the performance
indicators. The demand is real and is not going away.

## Why the committee thinks it cannot be met

The argument, made before any results were shown:

1. Subscore reporting is used to identify areas of relative weakness and strength.
2. That use requires the subtests to actually differ.
3. The subtests are too similar. OEAA's own analysis finds subscores add no unique information.
4. Tests are deliberately engineered *toward* unidimensionality, and the field simultaneously
   wants more information from shorter tests.
5. Therefore reporting subscores from such a test is providing "that information from something
   you developed to not do that."

The simulation confirms point 4 quantitatively. The Wainer et al. (2001) check on the simulated
data yields a first eigenvalue near 12.7 against second and third near 1–2.5. The data really
is one dimension.

## The position the committee actually took

Not "stop." The committee framed a choice — "we can either resist allowing them more
information, or determine what method can we use that will give the *least bad* information" —
and chose the second: [[rec-subscore-least-bad-information]]. The operative phrase was a
"happy medium between no information and inaccurate information from scale scores."

## The method question

[[ct-po-vs-sbac-simulation-deck]] compares a Classification Tree with Proportional Odds
against the Smarter Balanced method, with K-modes as reference.

CT-PO wins on deviance against real data at all three grades tested, and wins on both
classification accuracy and consistency in every simulated condition. But the margin depends
on how separable the three latent dimensions are, and at realistic separations both methods
return quadratic weighted kappa low enough that neither supports individual-level reporting.

The committee's methodological advice was to stop assuming linear correlation:
[[rec-subscore-model-joint-density]] — model the joint density of the three dimensions, go
from the joint to the marginals, and place cuts in the marginals faithful to the joint.
Sequencing: [[rec-subscore-establish-scale-then-cuts]].

Existing literature was criticised by the presenter on two grounds — that it treats subscore
reporting as prediction of true subtest performance, and that it assumes multivariate
normality. The empirical distributions in the deck are visibly non-normal, which supports the
second criticism directly.

## The reporting question

The committee's most useful move was to reframe. The binding constraint is not which method is
more accurate; it is what a parent understands. "Biggest focus for reporting should be what
parents want to know and see."

- [[rec-subscore-report-certainty]] — any reported category carries a level of certainty and a measure of error
- [[rec-subscore-parent-think-alouds]] — ask parents what the report tells them, before redesigning it
- [[rec-subscore-drill-down-reporting]] — layer the report: basic information, then subscore, then standard errors, then learning profile
- [[rec-subscore-sample-report-next-meeting]] — bring a sample report in the fall

Reporting the certainty is what makes "least bad" honest rather than merely less wrong.

## Timeline

No hard timeline, but a decision must be made in the **spring** for the following year's
results.

## History

| Meeting | What moved |
|---|---|
| [[2026-04-subtest-performance-indicators]] | CT-PO shown superior to the SBAC method empirically and in simulation; committee accepted the method while questioning the enterprise; advice redirected to joint-density modelling and to parent comprehension; sample report promised for fall |

## Related

[[ct-po-vs-sbac-simulation-deck]] · [[smarter-balanced]]
