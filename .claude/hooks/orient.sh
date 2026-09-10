#!/usr/bin/env bash
# SessionStart digest for the Michigan TAC corpus. Read-only and bounded.
set -uo pipefail
cd "$(git rev-parse --show-toplevel 2>/dev/null || echo .)" || exit 0
[ -d wiki ] || exit 0

echo "── Michigan TAC corpus ──────────────────────────────────────"
echo "You own wiki/. You never modify raw/. Conventions: wiki/schema.md"
echo ""

# Meetings ingested
echo "Meetings ingested:"
for f in wiki/meetings/*.md; do
  [ -e "$f" ] || continue
  printf '  %s\n' "$(sed -n 's/^title: //p' "$f" | head -1)"
done

# Recommendation register by status
echo ""
echo "Recommendations by status:"
for s in open accepted in-progress closed declined superseded; do
  n=$(grep -l "^status: $s$" wiki/recommendations/*.md 2>/dev/null | wc -l | tr -d ' ')
  [ "$n" -gt 0 ] && printf '  %-12s %s\n' "$s" "$n"
done

# Items explicitly due at the next meeting
echo ""
echo "Explicitly carried to the next meeting:"
grep -l 'due at the fall\|fall TAC meeting\|next meeting' wiki/recommendations/*.md wiki/questions/*.md 2>/dev/null \
  | head -5 | while read -r f; do
      printf '  %s\n' "$(sed -n 's/^title: //p' "$f" | head -1)"
    done

# Unresolved questions
echo ""
echo "Open questions: $(ls wiki/questions/*.md 2>/dev/null | wc -l | tr -d ' ')"
for f in wiki/questions/*.md; do
  [ -e "$f" ] || continue
  printf '  - %s\n' "$(sed -n 's/^title: //p' "$f" | head -1)"
done

# Last log entries
echo ""
echo "Recent corpus activity:"
grep -m 3 '^## \[' wiki/log.md 2>/dev/null | sed 's/^## /  /'

echo ""
echo "Start at wiki/index.md. Cite page paths; never assert from memory."
echo "─────────────────────────────────────────────────────────────"
