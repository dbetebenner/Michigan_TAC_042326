#!/usr/bin/env bash
# Assert the rendered PDFs use the fonts the design specifies.
#
# WHY THIS EXISTS. Verifying that a font is installed is not the same as verifying
# that the PDF used it. \setmathfont{Noto Sans Math} against a font with no
# OpenType MATH table makes unicode-math emit a warning and carry on with Latin
# Modern Math. Every font check passes, LaTeX exits 0, CI goes green, and the PDF
# ships the wrong math face. That happened here: the local build was correct and
# the published build was not, because nothing inspected the output.
#
# So: check the artifact, not the environment.
set -uo pipefail
cd "$(dirname "$0")/.."

# Latin Modern and Computer Modern are never intentional in this design. Their
# appearance means a fontspec or unicode-math fallback fired somewhere.
FORBIDDEN='LatinModernMath|LMMath|LMRoman|CMSS|ComputerModern|CMR[0-9]|CMMI'

# Documents that contain mathematics and must therefore embed the math face.
# An explicit list, not a heuristic: sniffing the text layer for Greek letters
# false-positives on prose such as "Cronbach's alpha", which is correctly set in
# the body font.
MATH_DOCS=(
  "_site/wiki/analyses/copula-approach-to-subtest-indicators.pdf"
)

fail=0
found_any=0

for pdf in _site/documents/*.pdf _site/wiki/analyses/*.pdf; do
  [ -f "$pdf" ] || continue
  found_any=1
  name=$(basename "$pdf")
  fonts=$(pdffonts "$pdf" 2>/dev/null | tail -n +3 | sed 's/^[A-Z]*+//' | awk '{print $1}')

  if bad=$(printf '%s\n' "$fonts" | grep -E "$FORBIDDEN"); then
    echo "FALLBACK FONT IN $name:"
    printf '%s\n' "$bad" | sed 's/^/    /'
    echo "    A LaTeX font fallback fired. Check \\setmathfont / \\setmainfont in"
    echo "    styles/tac-preamble.tex, and that the named families are installed"
    echo "    with the tables they need — a math font needs an OpenType MATH table."
    fail=1
    continue
  fi

  requires_math=0
  for m in "${MATH_DOCS[@]}"; do [ "$pdf" = "$m" ] && requires_math=1; done

  if [ "$requires_math" -eq 1 ]; then
    if printf '%s\n' "$fonts" | grep -q 'NotoSansMath'; then
      echo "OK      $name — math set in Noto Sans Math"
    else
      echo "MISSING MATH FONT IN $name"
      echo "    This document contains mathematics but embeds no Noto Sans Math."
      echo "    Fonts actually embedded:"
      printf '%s\n' "$fonts" | sed 's/^/      /'
      fail=1
    fi
  else
    echo "OK      $name"
  fi
done

if [ "$found_any" -eq 0 ]; then
  echo "check-pdf-fonts: no PDFs found under _site/ — run scripts/render.sh first" >&2
  exit 1
fi

[ "$fail" -eq 0 ] || exit 1
exit 0
