---
title: M-STEP / Smarter Balanced Concordance
type: topic
created: 2026-09-10
updated: 2026-09-10
status: active
curated: false
tags: [topic, concordance, reporting, interim]
---

**State as of April 2026:** two draft layouts reviewed, substantial committee feedback on
communication, one unresolved placeholder, and a suggestion that would make the whole artifact
unnecessary.

## What it is

A table mapping Smarter Balanced interim scale scores to M-STEP scale scores, by subject
(ELA, Math), grade (3–7), and performance level (1–4). Each cell gives lowest and highest
scale score on each side. Built by OEAA to promote use of the interim assessments —
see [[smarter-balanced-interim-adoption]].

The M-STEP assesses the same content as Smarter Balanced but its scale scores have been
converted, so the two are not directly comparable without a crosswalk.

Draft: [[interim-concordance-table-examples]].

## The committee's reading

The committee treated this as a **communication** artifact and reviewed it accordingly. Its
feedback clusters into three concerns.

**Say what the number means.** The worked example says a student "could score" a given M-STEP
score. Asked what *could* means, the answer was "student would most likely score, or something
along those lines." A concordance table's entire job is to convey a probabilistic mapping to
people who are not psychometricians, and "or something along those lines" is not a definition.
The table also carries its own disclaimer that it "is not a perfect prediction," without
quantifying the imperfection.

**Put the conclusion first.** [[rec-concordance-move-key-takeaway-to-top]] — key takeaway and
performance level information belong at the top of the document, not after the explanatory
narrative.

**Show the work.** [[rec-concordance-publish-formula]] — districts and schools will want the
formula used, not only the lookup table. Extended in
[[rec-concordance-build-theta-tool]] to a tool where a district could enter a theta value
directly.

## The suggestion that would obviate it

[[rec-interim-ask-sbac-embed-mstep-score]]. The committee asked how much the interim reports
themselves can be modified and whether the corresponding M-STEP score could simply be inserted.
The answer was that this is a question for Smarter Balanced.

If Smarter Balanced can embed the M-STEP concordant score in the interim report, the
concordance table stops being a document educators must find, read, and apply correctly, and
becomes a number that appears where they are already looking. That is a strictly better
outcome than any layout revision and it remains unasked.

## The intended workflow

Students take the interim assessment; scores come from [[data-recognition-corporation]];
educators consult the concordance table. Baseline administration is three times per year
though it varies, and a student score is returned each administration.

The committee asked what other systems do and was told they make predictions of student
performance on the summative test. OEAA's stated preference is for the present-tense framing —
what a student would score *today* — over an end-of-year projection, on the grounds that it
better supports acting on the result. That framing preference is defensible and is not
currently stated in the document itself.

## Unresolved

Both draft examples end with "Additional blueprint information can be found at XXXXXX."

## A route to quantifying "could"

Michigan holds interim and M-STEP scores on many of the same students, which is what makes a
concordance possible at all — but the table maps band to band, discarding the joint
distribution. [[copula-approach-to-subtest-indicators]] observes that a copula fitted to that
pair yields the conditional distribution of the M-STEP score given an interim score, turning
"could score" into a statement with a measured spread. Same machinery as the subscore problem,
different pair, data already collected.

## History

| Meeting | What moved |
|---|---|
| [[2026-04-smarter-balanced-interim]] | Two layouts reviewed; feedback on ordering, formula transparency, and the meaning of "could"; Smarter Balanced embedding raised as the preferable path |

## Related

[[smarter-balanced-interim-adoption]] · [[interim-concordance-table-examples]]
