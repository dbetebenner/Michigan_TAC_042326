---
title: MTTC Meaningfully Different Forms
type: topic
created: 2026-09-10
updated: 2026-09-10
status: active
curated: false
tags: [topic, mttc, licensure, test-security]
---

**State as of April 2026:** OEE's working definition was rejected by the committee, which
supplied a replacement design. Not yet resolved with Pearson.

## The requirement

The new OEE contract with [[pearson]] requires maximising the number of *meaningfully
different* test forms for each field. The MTTC programme must be inclusive, valid, reliable,
secure, and legally defensible.

Goal: a minimum of three forms per field by contract end.

## OEE's working definition

A single rule, applied uniformly across every field: a high fixed ceiling on overall item
overlap between forms, with a slightly lower ceiling on the scorable set.

Rationale offered: standard practice in educator licensure testing; maintains programme
integrity and legal defensibility.

::: {.callout-note}
The specific ceilings are test-security sensitive and are held in the restricted layer —
see `restricted/mttc-form-security-detail.md`. What matters for the argument on this page
is that both sit high enough that consecutive forms share the large majority of their items.
:::

## Why the committee rejected it

Directly, and twice. The committee said the ceiling was far too high to constitute
meaningful difference at all, and then put it in terms of the contract's own horizon: a
handful of forms produced over several years, each sharing most of its items with the
others, cannot reasonably be called meaningfully different.

The objection is not aesthetic. A candidate retesting inside the form repeat interval,
against a small number of live forms that share the large majority of their items, faces
something close to the same test — which is exactly the security and fairness risk the
multiple-form requirement exists to remove.

## The constraint that produced the definition

Low-incidence fields do not generate examinees fast enough.

- Statistical equating needs a minimum of **100 examinees per form**
- Re-using a single form increases security and fairness risk
- Only a small number of forms may be live in any one testing window, and a candidate may
  repeat after a fixed interval — the two figures together are the most sensitive item in
  the corpus and are held in the restricted layer
- Questions are scrambled in both sub-categories

High overlap is how you get more nominal forms out of a small item pool. The committee's
answer is that this is the wrong trade.

## The four groups

OEE sorted the certification tests into four groups by incidence. Groups 1 and 2 build a new
form once a field reaches the 100-examinee equating threshold, differing in which equating
method applies. Groups 3 and 4 do not equate at all and are standard-setting driven, with
Pearson conducting the standard settings and item-level judgements used to build the
operational forms.

The per-group form counts and the exact approach per group are in the restricted layer. One
detail matters publicly: the permitted form range for the highest-volume group was carried
over from the previous contract rather than derived from Michigan's own volumes — which is
what [[rec-mttc-michigan-specific-incidence-categories]] addresses.

OEE's strategy has four parts: categorise tests, examine annual volume per exam, assess
feasibility of equating, and choose a form production method.

## What the committee designed instead

The core move is [[rec-mttc-redefine-per-incidence-group]] — a single overlap rule across four
groups with different volumes is the wrong instrument. Higher-incidence fields, which
accumulate examinees faster, should carry *less* acceptable overlap.

Around it:

- [[rec-mttc-reduce-item-overlap]] — roughly half the working ceiling, adjusted alongside the other variables
- [[rec-mttc-fewer-forms-less-overlap]] — the governing preference
- [[rec-mttc-start-with-standard-setting-form]] — start from a standard-setting form of one scorable and one non-scorable set (20 items); once a form has enough candidates, begin the next; non-scorable items that perform become scorable
- [[rec-mttc-stick-with-100-examinees]] — 100 per form, not 200
- [[rec-mttc-two-year-escalation]] — if 100 cannot be reached in two years, move the field to the next group's process
- [[rec-mttc-automated-item-generation]] — generate cousin items to enlarge the pool
- [[rec-mttc-michigan-specific-incidence-categories]] — define high/medium/low incidence for Michigan

Pearson's own question — if equating is used, what definition and what item overlap would be
needed — is the question the committee's answer is designed to settle, and it remains formally
open. OEE's counter-question, what annual volume yields 100 examinees, is tracked as
[[q-mttc-examinee-accumulation-rate]].

Pearson also asked whether data can be too old. The answer given was yes, dependent on many
variables, and that the next contract needs to define total time to reach testing counts
against rate of testing. Tracked as [[q-mttc-data-staleness]].

## The validity question underneath

[[rec-mttc-define-defensible-inference]]. Asked what inferences can be defended, OEE's answer
was procedural — passing at the cut lets the state certificate a candidate, which lets a
district interview them. The committee asked for a substantive statement instead: what does it
mean when a candidate does not reach the cut, what does performance mean, and what do MTTC
scores represent?

Until that is answered, "meaningfully different" has no criterion. Two forms are meaningfully
different if they support the same inference equally well — and the inference is undefined.

## History

| Meeting | What moved |
|---|---|
| [[2026-04-mttc-meaningfully-different-forms]] | Uniform overlap definition rejected; per-group definition, a roughly halved overlap target, the 100-examinee threshold, and two-year escalation supplied; defensible-inference question raised and unanswered |

## Related

[[mttc-constructed-response-endorsements]] · [[pearson]]
