#!/usr/bin/env bash
# Verify every [[wikilink]] in wiki/ resolves to a page, and report orphans.
set -uo pipefail
cd "$(dirname "$0")/.."

slugs=$(find wiki -name '*.md' -exec basename {} .md \; | sort)
links=$(grep -roh '\[\[[^]]*\]\]' wiki --include='*.md' | sed 's/\[\[//; s/\]\]//' | sort -u)

echo "Pages: $(echo "$slugs" | wc -l | tr -d ' ')   Distinct link targets: $(echo "$links" | wc -l | tr -d ' ')"

broken=$(comm -23 <(echo "$links") <(echo "$slugs"))
if [ -n "$broken" ]; then
  echo ""
  echo "BROKEN LINKS (target has no page):"
  while read -r b; do
    [ -z "$b" ] && continue
    echo "  [[$b]]"
    grep -rl "\[\[$b\]\]" wiki --include='*.md' | sed 's/^/      in /'
  done <<< "$broken"
fi

# Orphans: pages nothing links to (index/log/schema/glossary are entry points)
echo ""
echo "ORPHANS (no inbound link):"
orphan=0
while read -r s; do
  case "$s" in index|log|schema|glossary) continue;; esac
  if ! grep -rqh "\[\[$s\]\]" wiki --include='*.md'; then echo "  $s"; orphan=1; fi
done <<< "$slugs"
[ $orphan -eq 0 ] && echo "  none"

# Duplicate slugs would break bare-slug resolution
dupes=$(find wiki -name '*.md' -exec basename {} .md \; | sort | uniq -d)
if [ -n "$dupes" ]; then echo ""; echo "DUPLICATE SLUGS:"; echo "$dupes" | sed 's/^/  /'; fi

[ -n "$broken" ] && exit 1
exit 0
