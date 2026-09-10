#!/usr/bin/env bash
# Verify every [[wikilink]] in wiki/ resolves to a page, and report orphans.
set -uo pipefail
cd "$(dirname "$0")/.."

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

# Build a stripped copy of the corpus with fenced code blocks and inline code
# spans removed, then do all link extraction against that.
#
# WHY. R's double-bracket indexing -- x[["df"]], gmm[[j]] -- is syntactically
# identical to a wikilink, so a naive grep over the raw markdown reports every one
# as a broken link. Inline spans matter too: `[[slug]]` inside backticks documents
# the convention rather than using it. filters/wikilinks.lua ignores both, because
# it only rewrites Str inlines and never touches Code or CodeBlock nodes -- so the
# checker has to make the same distinction or it disagrees with the renderer.
while IFS= read -r f; do
  out="$TMP/$(printf '%s' "$f" | tr '/' '_')"
  awk '
    /^[[:space:]]*(```|~~~)/ { fence = !fence; next }
    fence { next }
    { gsub(/`[^`]*`/, ""); print }
  ' "$f" > "$out"
done < <(find wiki -name '*.md')

CORPUS="$TMP/all.txt"
cat "$TMP"/wiki_* > "$CORPUS" 2>/dev/null

slugs=$(find wiki -name '*.md' -exec basename {} .md \; | sort)
links=$(grep -o '\[\[[^]]*\]\]' "$CORPUS" | sed 's/\[\[//; s/\]\]//' | sort -u)

echo "Pages: $(echo "$slugs" | wc -l | tr -d ' ')   Distinct link targets: $(echo "$links" | wc -l | tr -d ' ')"

broken=$(comm -23 <(echo "$links") <(echo "$slugs"))
if [ -n "$broken" ]; then
  echo ""
  echo "BROKEN LINKS (target has no page):"
  while IFS= read -r b; do
    [ -z "$b" ] && continue
    echo "  [[$b]]"
    for s in "$TMP"/wiki_*; do
      grep -q "\[\[$b\]\]" "$s" && echo "      in $(basename "$s" | tr '_' '/')"
    done
  done <<< "$broken"
fi

# Orphans: pages nothing links to. index/log/schema/glossary are entry points.
echo ""
echo "ORPHANS (no inbound link):"
orphan=0
while IFS= read -r s; do
  case "$s" in index|log|schema|glossary) continue;; esac
  if ! grep -q "\[\[$s\]\]" "$CORPUS"; then echo "  $s"; orphan=1; fi
done <<< "$slugs"
[ $orphan -eq 0 ] && echo "  none"

# Duplicate slugs would break bare-slug resolution.
dupes=$(find wiki -name '*.md' -exec basename {} .md \; | sort | uniq -d)
if [ -n "$dupes" ]; then echo ""; echo "DUPLICATE SLUGS:"; echo "$dupes" | sed 's/^/  /'; fi

[ -n "$broken" ] && exit 1
exit 0
