---
title: CT-PO vs SBAC Simulation Results Deck
type: artifact
created: 2026-09-10
updated: 2026-09-10
status: active
curated: false
meeting: 2026-04-23
sources:
  - raw/2026-04-23/presentations/CT-PO vs SBAC simulation results (draft, 4-14-2026).pdf
  - raw/2026-04-23/extracted/simulation-figures-read.md
tags: [artifact, presentation, subscores, psychometrics]
---

Ji Zeng (OEAA). 52 pages, marked draft and dated 4-14-2026. Presented in
[[2026-04-subtest-performance-indicators]].

This is the most substantively dense artifact in the corpus and the one the current minutes
process handles worst. Roughly thirty of its fifty-two pages are chart images with no text
beyond a repeated title. Text extraction yields ~680 words; the actual findings are in the
pictures. They were recovered here by rendering every page and reading it.

## Structure

Table of contents → empirical data explorations → the K-modes/CT-PO/SBAC deviance
comparison → simulation procedures → the Wainer et al. (2001) unidimensionality check →
Batch 1 conditions and 16 result slides → Batch 2 conditions and 10 result slides →
conclusions.

## The empirical warrant (pp. 5–7)

Three panels per grade — Earth Science, Life Science, Physical Science — overlaying an
empirical KDE, a three-component Gaussian mixture, and a single Normal.

- Grade 5: fitted Normal μ = 1492.8, σ = 23.5 (ES, LS), σ = 23.4 (PS); range ~1440–1560.
- Grade 11: μ = 1792.9, σ = 24.0 (ES); μ = 1792.8, σ = 23.3 (LS); μ = 1792.9, σ = 22.6 (PS).

The empirical densities are visibly multimodal and left-shouldered. The single Normal
over-peaks the centre and under-fits both shoulders; the 3-GMM tracks the empirical curve
closely. **This is the warrant for abandoning the multivariate normal assumption** that Zeng
criticises in the existing literature, citing Sinharay (2014) and Gorney and Sinharay (2025).
None of it is in the minutes.

## Deviance comparison (p. 8)

| Grade | K-modes deviance | CT-PO deviance | SBAC deviance |
|---|---|---|---|
| 5 | 71,894.50 | **71,675.26** | 97,032.84 |
| 8 | 73,622.17 | **71,757.89** | 85,159.56 |
| 11 | 61,396.68 | **57,574.52** | 77,622.43 |

CT-PO lowest at every grade; SBAC substantially worst.

## Unidimensionality of the simulated data (p. 18)

Pooled KDE of the three eigenvalues of `S_true`. The first eigenvalue is centred near 12.7
and spans roughly 10–16; the second and third both sit between 1 and 2.5 — a dominant
eigenvalue by a factor of six to eight.

This is the committee's objection stated quantitatively. Subscores are being extracted from
data that is, by construction and by check, essentially one dimension.

## Results

**Within a single condition** (pp. 19–20): accuracy QWK clusters tightly at 0.63–0.66 for
both methods, sitting almost on the identity line. The dumbbell plot over 25 samples shows
CT-PO ahead of SBAC in every sample for Earth Science and Life Science, near-overlapping for
Physical Science — a consistent win, but a small one, on the order of 0.01–0.05 QWK.

**Across Batch 1 conditions** (pp. 23–38): CT-PO accuracy spans ~0.56–0.78 against SBAC's
~0.50–0.68, and **every point lies above the identity line**. Consistency shows the same
pattern in a tighter band, CT-PO ~0.60–0.74 against SBAC ~0.52–0.65. No reversal at any of
the tested correlations (ρ = 0.65, 0.70, 0.75).

**Across Batch 2 conditions** (pp. 42–51), where the separation between the three latent
component means is varied:

| Mean vector | Approximate accuracy QWK range, both methods |
|---|---|
| μ = [-0.25, 0, 0.25] | 0.10 – 0.35 |
| μ = [-0.50, 0, 0.50] | 0.25 – 0.55 |
| μ = [-0.75, 0, 0.75] | 0.35 – 0.70 |
| μ = [-1.00, 0, 1.00] | 0.45 – 0.82 |

**The caveat that matters.** CT-PO's advantage is a function of how separable the three
latent subtest dimensions actually are. At the smallest separation the points hug the
identity line and both methods produce classification too poor to report. As separation
grows, both improve and CT-PO's margin widens. Since the test is deliberately engineered
toward unidimensionality, the realistic operating region is the *left* end of that table.

The committee reached this conclusion in the room — the minutes record "when the means are
close and the standard deviations are large, then both methods perform poorly" — but without
the figures there is no way to see how severe it is.

## Conclusions as stated

> The CT-PO method has shown its advantage over the SBAC method via both the empirical and
> simulation data.

> More simulation conditions will be explored, which include but are not limited to varying
> item numbers, higher correlations among subtests, different mean and SD vectors, etc.

## Related

[[m-step-subscore-reporting]] · [[2026-04-subtest-performance-indicators]] ·
[[rec-subscore-model-joint-density]] · [[rec-subscore-report-certainty]]
