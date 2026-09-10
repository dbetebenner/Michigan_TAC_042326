#!/usr/bin/env bash
# Fail if any restricted value has reappeared in the public tree.
#
# The corpus is public and some of what vendors present to the committee is not
# publishable — see restricted/README.md. Redaction is a one-time act; this script
# is what keeps it true. Without it, the next meeting's ingest quietly puts the
# numbers back.
#
# Adding a new restricted value: put the detail in restricted/, redact the public
# page by characterisation, then add the literal here.
set -uo pipefail
cd "$(dirname "$0")/.."

# Public tree: everything that is committed or rendered. restricted/ is gitignored
# and raw/ holds the untouched source documents, which are excluded deliberately —
# see the note at the end of this script.
PUBLIC=(wiki documents index.qmd README.md AGENTS.md CLAUDE.md _quarto.yml)

# ── Restricted literals ───────────────────────────────────────────────────
# MTTC form security, April 2026. The 100-examinee equating minimum is NOT here:
# it is a general psychometric threshold, not a Michigan-specific parameter.
PATTERNS=(
  '80%'                       # overall item overlap ceiling
  '75%'                       # scorable set overlap ceiling
  '80 percent'
  '75 percent'
  '40-60%'                    # committee counter-target
  '40–60%'
  '40 to 60'
  '30 days'                   # form repeat interval
  '30-day'
  'two forms may be in operation'
  'two forms can be in operation'
  'Only two forms'
  'min 4, max 8'              # per-group form counts
  'max 8'
  'min 3, max 4'
)

fail=0
for pat in "${PATTERNS[@]}"; do
  # -F: literal, not regex. -w would break on the % and comma forms.
  if hits=$(grep -rInF -- "$pat" "${PUBLIC[@]}" 2>/dev/null); then
    if [ -n "$hits" ]; then
      echo "RESTRICTED VALUE IN PUBLIC TREE: \"$pat\""
      echo "$hits" | sed 's/^/    /'
      fail=1
    fi
  fi
done

if [ "$fail" -eq 0 ]; then
  echo "check-restricted: clean (${#PATTERNS[@]} patterns, $(echo "${PUBLIC[@]}" | wc -w | tr -d ' ') paths)"
  exit 0
fi

cat <<'MSG'

A value held in the restricted layer has reappeared in a published page.
Redact by characterisation, not deletion — the public page should still carry the
argument the specific was evidence for. See restricted/README.md.
MSG
exit 1

# NOTE ON raw/
# raw/ is excluded from the scan on purpose. It holds the source documents exactly
# as distributed, and their fidelity is what makes every claim in the corpus
# auditable. Those PDFs are committed and therefore public. If the vendor material
# in them is itself too sensitive to publish, the fix is to remove those files from
# the repository — not to alter them, and not to make this script pass by editing
# a source document.
