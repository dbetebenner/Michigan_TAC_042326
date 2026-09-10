---
name: ingest-meeting
description: Ingest a new TAC meeting's materials into the corpus — extract sources, author artifact and session pages, extend topics, create recommendations, and update prior recommendation statuses. Use when new meeting materials arrive, or when asked to "ingest the September meeting", "add the fall meeting", or "process these minutes".
---

# ingest-meeting

You are adding a meeting to an existing corpus, not building a new one. The single most valuable
thing you will do is **update the status of prior recommendations** — everything else is
recording; that is accounting.

## Steps

1. **Place the sources.** `raw/<YYYY-MM-DD>/{agenda,minutes,presentations}/`. Preserve original
   filenames exactly. Never edit anything under `raw/`.

2. **Extract.** Run `scripts/extract-sources.sh <YYYY-MM-DD>`. It writes text, slide content
   including hidden slides and speaker notes, and page images for image-heavy PDFs into
   `raw/<date>/extracted/` (gitignored).

3. **Read the images.** For any deck whose text extraction is thin relative to its page count,
   read the rendered page images. In April this step recovered the entire substance of a 52-page
   simulation deck. Do not skip it because the text extraction "looks complete" — check the ratio
   of words to pages.

4. **Author artifact pages** — one per source document, with `sources:` provenance and a section
   on what the document contains that no other source does, plus any defects.

5. **Author session pages** — one per agenda session. Separate what was presented, what was
   asked, and what was advised. Note any disagreement between the agenda and the minutes.

6. **Extend topics, do not fork them.** Grep `wiki/topics/` first. Add a row to the existing
   topic's history table and update its "state as of" line. Create a new topic only when the
   thread is genuinely new.

7. **Create recommendation pages** — one per discrete piece of advice. See the
   `meeting-synthesizer` agent for how to split them.

8. **Update prior recommendations.** Walk `wiki/recommendations/open-recommendations-april-2026.md`
   and every open recommendation. For each, ask whether this meeting touched it. If so, change
   `status:` **and** say in the body which meeting moved it and what happened. Then update the
   register.

9. **Update questions.** Answered questions get the answer and a status change. New questions get
   pages.

10. **Update `index.md`; append to `log.md`.** The log entry should say what this meeting added
    *that the source record did not already contain* — that is the corpus's reason to exist.

11. **Verify.** `scripts/check-links.sh`, then run the `corpus-lint` agent.

## The trap

Creating a parallel structure for the new meeting — `topics/growth-targets-fall-2026.md`
alongside `topics/adequate-growth-targets.md`. This is how the corpus rots, and it destroys
exactly the longitudinal view that justifies building it. Topics and recommendations are
**shared across meetings**. Only artifacts and sessions are per-meeting.

## If you have a real transcript

Then attribution becomes possible for the first time. Attribute to individuals where the
transcript supports it, and record in the meeting page that this meeting has transcript-level
attribution while April does not. Do not retroactively attribute April.
