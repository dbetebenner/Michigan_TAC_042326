#!/usr/bin/env bash
# Regenerate derived text and page images from a meeting's sources into
# raw/<date>/extracted/. Output is gitignored. No source document is ever modified.
#
# Sources live in two trees. Most are public in raw/<date>/. Documents held back for
# test-security or vendor reasons live in restricted/raw/<date>/, which is gitignored
# and present only on a machine that has the restricted layer — see restricted/README.md.
# Both are scanned; extraction of what is present succeeds either way.
set -euo pipefail
cd "$(dirname "$0")/.."

DATE="${1:-2026-04-23}"
SRC="raw/$DATE"
RSRC="restricted/raw/$DATE"
OUT="$SRC/extracted"
[ -d "$SRC" ] || { echo "No such meeting directory: $SRC" >&2; exit 1; }
mkdir -p "$OUT"

if [ -d "$RSRC" ]; then
  echo "Extracting $SRC and $RSRC -> $OUT"
else
  echo "Extracting $SRC -> $OUT"
  echo "  note: no restricted layer on this machine; documents held back from the"
  echo "        public repo will be absent. See restricted/README.md."
fi

# ── PDFs: text layer ──────────────────────────────────────────────────────
# Unmatched globs expand to nothing, so a missing restricted tree is a no-op.
shopt -s nullglob
for f in "$SRC"/agenda/*.pdf "$SRC"/minutes/*.pdf "$SRC"/presentations/*.pdf \
         "$RSRC"/agenda/*.pdf "$RSRC"/minutes/*.pdf "$RSRC"/presentations/*.pdf; do
  base=$(basename "$f" .pdf)
  pdftotext -layout "$f" "$OUT/${base}.txt"
  words=$(wc -w < "$OUT/${base}.txt" | tr -d ' ')
  pages=$(pdfinfo "$f" 2>/dev/null | awk '/^Pages:/{print $2}')
  echo "  $base — ${words} words, ${pages:-?} pages"

  # An image-heavy deck yields few words per page. Render it so the figures can
  # be read visually; this is where the substance of such a deck actually lives.
  if [ -n "${pages:-}" ] && [ "$pages" -gt 3 ] && [ "$((words / pages))" -lt 60 ]; then
    echo "      low text density — rendering page images"
    mkdir -p "$OUT/${base}-pages"
    pdftoppm -r 110 -png "$f" "$OUT/${base}-pages/p"
  fi
done

# ── PowerPoint: slide text, hidden slides, speaker notes ──────────────────
for f in "$SRC"/presentations/*.pptx "$RSRC"/presentations/*.pptx; do
  base=$(basename "$f" .pptx)
  python3 scripts/extract_pptx.py "$f" > "$OUT/${base}.txt"
  echo "  $base — $(grep -c '^===== SLIDE' "$OUT/${base}.txt") slides, $(grep -c 'HIDDEN' "$OUT/${base}.txt" || true) hidden, $(grep -c '^  --- NOTES' "$OUT/${base}.txt" || true) with notes"
done

# ── Word ──────────────────────────────────────────────────────────────────
for f in "$SRC"/presentations/*.docx "$RSRC"/presentations/*.docx; do
  base=$(basename "$f" .docx)
  textutil -convert txt -stdout "$f" > "$OUT/${base}.txt"
  echo "  $base — $(wc -l < "$OUT/${base}.txt" | tr -d ' ') lines"
done

echo "Done. Read any *-pages/ directories visually before authoring."
