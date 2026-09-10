#!/usr/bin/env bash
# Build the full site: both documents in HTML and PDF, plus the whole corpus.
#
# ORDER IS LOAD-BEARING. A Quarto project render cleans output-dir, so the PDFs
# are rendered first, stashed outside _site, and restored after the website
# render. Rendering them last would work too, but rendering them first surfaces
# LaTeX failures before the long website build.
set -euo pipefail
cd "$(dirname "$0")/.."

echo "==> Regenerating wikilink slug map"
Rscript scripts/build-slugmap.R

echo "==> Checking corpus link integrity"
./scripts/check-links.sh

echo "==> Checking no restricted value has reappeared"
./scripts/check-restricted.sh

# Sources rendered to PDF as well as HTML. The analysis page is a memo addressed
# to a named presenter, and is the only page carrying mathematics -- it is what
# exercises the Noto Sans Math path in the PDF channel.
DOCS=(documents/meeting-summary-2026-04.qmd
      documents/ai-native-tac.qmd
      wiki/analyses/copula-approach-to-subtest-indicators.md)
STASH=$(mktemp -d)
trap 'rm -rf "$STASH"' EXIT

echo "==> Rendering PDFs"
for d in "${DOCS[@]}"; do
  [ -f "$d" ] || { echo "    missing $d, skipping"; continue; }
  echo "    $d"
  quarto render "$d" --to pdf
  pdf="${d%.*}.pdf"
  # A single-file render writes next to the source; a project render writes to
  # _site. Handle both.
  for cand in "$pdf" "_site/$pdf"; do
    [ -f "$cand" ] && { mkdir -p "$STASH/$(dirname "$pdf")"; cp "$cand" "$STASH/$pdf"; break; }
  done
done

echo "==> Rendering website"
quarto render

echo "==> Restoring PDFs into _site"
for d in "${DOCS[@]}"; do
  pdf="${d%.*}.pdf"
  if [ -f "$STASH/$pdf" ]; then
    mkdir -p "_site/$(dirname "$pdf")"
    cp "$STASH/$pdf" "_site/$pdf"
    echo "    _site/$pdf"
  fi
done

echo "==> Verifying"
fail=0
for want in index.html wiki/index.html; do
  [ -f "_site/$want" ] || { echo "    MISSING _site/$want"; fail=1; }
done
for d in "${DOCS[@]}"; do
  [ -f "$d" ] || continue
  for ext in html pdf; do
    w="_site/${d%.*}.$ext"
    [ -f "$w" ] || { echo "    MISSING $w"; fail=1; }
  done
done
pages=$(find _site/wiki -name '*.html' | wc -l | tr -d ' ')
echo "    corpus pages rendered: $pages"

echo "==> Checking the PDFs used the right fonts"
./scripts/check-pdf-fonts.sh || fail=1
[ "$fail" -eq 0 ] && echo "==> OK" || { echo "==> INCOMPLETE"; exit 1; }
