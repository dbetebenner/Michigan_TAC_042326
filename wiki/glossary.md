---
title: Glossary
type: glossary
created: 2026-09-10
updated: 2026-09-10
status: active
curated: false
tags: [glossary, reference]
---

Acronyms and terms of art appearing in the Michigan TAC record. Resolve terms here rather than
inferring them — several are Michigan-specific and at least one (AGP) is routinely mistyped in
source documents.

## Assessment programmes and instruments

| Term | Meaning |
|---|---|
| **M-STEP** | Michigan Student Test of Educational Progress. The state summative assessment. Assesses the same content as Smarter Balanced but on a converted scale — hence [[m-step-smarter-concordance]]. |
| **MI-Access** | Michigan's alternate assessment for students with significant cognitive disabilities. The only assessment using the logistic regression growth target method. |
| **MTTC** | Michigan Test for Teacher Certification. Educator licensure testing, administered by [[pearson]] under contract to [[oee]]. |
| **PSAT 8 / 9 / 10, SAT with Essay** | College Board assessments in Michigan's high school programme; carry quantile regression growth targets. |
| **WIDA ACCESS** | English language proficiency assessment for English learners, grades 1–12. See [[wida]]. |
| **WIN Work Readiness Assessments** | New to Michigan's Spring 2026 programme. See [[win-work-readiness]]. |
| **Smarter Balanced Interim Assessments** | Voluntary interim assessments offered to Michigan districts. See [[smarter-balanced-interim-adoption]]. |
| **Tools for Teachers** | Smarter Balanced instructional resource tied to the interim assessments. |

## Growth measurement

| Term | Meaning |
|---|---|
| **SGP** | Student Growth Percentile. The percentage of students with similar score histories having lower growth than this student. Describes growth achieved, normatively. |
| **AGP** | Adequate Growth Percentile. The SGP a student must consistently meet or exceed to reach proficiency within a set timeframe. A criterion target on a normative scale. Rendered `APG` in places in the April minutes. |
| **Growth target timeframe** | The number of years in which a student is expected to reach proficiency. Michigan: 1–3 years for content areas, 1–5 for English language proficiency. |
| **NGA** | Nearest Grade Average. Proposed growth target method borrowing from the nearest grade where a full model is estimable. See [[nearest-grade-average-method]]. |
| **R SGP package** | The R implementation used for Michigan's quantile regression growth targets. |
| **NTILE(50)** | Division into fifty ordered groups. Used in NGA to define norm-group buckets — chosen so each averages 1,000+ R-package AGPs. |
| **Growth-to-standard** | Growth measured against a proficiency criterion, as opposed to purely normative growth. |

## Subscore reporting and psychometrics

| Term | Meaning |
|---|---|
| **Claim** | ELA and mathematics subscore unit. Michigan reports three of four mathematics claims, combining Claims 2 and 4. |
| **Domain** | Science subscore unit — Earth Science (ES), Life Science (LS), Physical Science (PS). |
| **Subscore performance indicator** | The reported band: Above Standard, At/Near Standard, Below Standard, relative to the overall content cut. |
| **CT-PO** | Classification Tree with Proportional Odds. The method under evaluation in [[ct-po-vs-sbac-simulation-deck]]. |
| **SBAC method** | The Smarter Balanced subscore indicator method, currently in use in Michigan. |
| **K-modes** | Clustering method used as a reference point in the deviance comparison. |
| **GMM** | Gaussian Mixture Model. Used to generate true theta values in the simulation. |
| **QWK** | Quadratic Weighted Kappa. The agreement statistic used to report classification accuracy and consistency. |
| **Theta (θ)** | The latent ability estimate. |
| **R2SS** | Raw to Scale Score conversion. |
| **Unidimensionality** | The property of a test measuring a single latent construct. Checked by the Wainer et al. (2001) procedure — Cronbach's α per subtest, then eigendecomposition of the error-corrected covariance matrix, looking for one dominant eigenvalue. |
| **Classification accuracy** | Agreement between assigned category and true category. |
| **Classification consistency** | Agreement between categories assigned on two independent administrations. |
| **Deviance** | Badness-of-fit measure; lower is better. |

## Licensure testing

| Term | Meaning |
|---|---|
| **CRI** | Constructed-Response Item. See [[mttc-constructed-response-endorsements]]. |
| **Meaningfully different forms** | Contractual requirement that MTTC forms differ substantively. OEE's working definition set a single high overlap ceiling across all fields and was rejected by the committee. Specific ceilings are in the restricted layer. See [[mttc-meaningfully-different-forms]]. |
| **Equating** | Statistical adjustment placing scores from different forms on a common scale. Requires a minimum of 100 examinees per form. |
| **Linear / z-score equating** | The two equating approaches specified for MTTC Groups 1 and 2. |
| **Standard setting** | Expert judgement process establishing cut scores. Used for Groups 3 and 4, where equating is infeasible. |
| **Scorable / non-scorable items** | Items that count toward a score, versus embedded field-test items that do not. |
| **Automated item generation** | Producing families of "cousin" items from a common item model. |
| **Conjunctive cut score** | A requirement to reach a minimum on each sub-area, not only on the total. |
| **Incidence** | Candidate volume in a certification field. Determines which of four groups a test falls into. |

## Organisations and policy

| Term | Meaning |
|---|---|
| **MDE** | [[michigan-department-of-education]] |
| **OEAA** | [[oeaa]] — Office of Educational Assessment and Accountability |
| **OEE** | [[oee]] — Office of Educator Excellence |
| **TAC** | [[technical-advisory-committee]] |
| **DRC** | [[data-recognition-corporation]] |
| **MAC** | [[michigan-assessment-consortium]] |
| **MERA** | [[mera]] — Michigan Education Research Association |
| **ESSA** | Every Student Succeeds Act. Federal law requiring growth reporting. Michigan's approved ESSA plan constrains changes to the AGP — see [[essa-plan-constraints]]. |
| **School Index** | Michigan's high-stakes school accountability system. |
| **Parent Dashboard / Student Growth Report / Annual Education Report** | Michigan's public growth reporting surfaces. |
| **EL** | English Learner. |
| **ELP** | English Language Proficiency. |
| **PE/PP** | Points Earned / Points Possible. How social studies subscores are reported. |
| **Break in trend** | An announced discontinuity in a reported series following a methodology change, after which longitudinal comparison is invalid. |

## Cited literature

- Wainer et al. (2001) — the unidimensionality check procedure used in the subscore simulation.
- Sinharay (2014); Gorney and Sinharay (2025) — cited on the limits of the existing subscore
  reporting literature, particularly its multivariate normality assumption.
