#!/usr/bin/env bash
# Run the R in wiki/analyses/copula-approach-to-subtest-indicators.md.
#
# The memo tells Ji Zeng the code runs. That claim decays the moment anyone edits
# a block, so it is checked rather than asserted: this extracts every ```r fence
# in order and executes it, supplying only the two things the memo itself says the
# reader must provide — the data extract and the mixture inverse-CDF.
#
# It does not check the numbers. The synthetic stand-in is not Michigan's data.
# It checks that the API calls, argument names, and object shapes are right, which
# is where sketched code actually goes wrong.
set -uo pipefail
cd "$(dirname "$0")/.."

MD="wiki/analyses/copula-approach-to-subtest-indicators.md"
[ -f "$MD" ] || { echo "check-memo-r: $MD not found" >&2; exit 1; }

# --vanilla throughout. A user ~/.Rprofile that sets options(error = ...) makes
# Rscript exit 0 even on stop(), so a check run under the developer's personal R
# config cannot fail. Build tooling must not depend on that config either way.
if ! command -v Rscript >/dev/null 2>&1; then
  echo "check-memo-r: SKIP (no Rscript)"
  exit 0
fi
if ! Rscript --vanilla -e 'quit(status = !all(c("copula","data.table") %in% rownames(installed.packages())))' >/dev/null 2>&1; then
  echo "check-memo-r: SKIP (copula and/or data.table not installed)"
  exit 0
fi

TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT
SCRIPT="$TMP/memo.R"

# The stubs, and only the stubs. Anything else the code needs is a bug in the memo.
cat > "$SCRIPT" <<'PRE'
suppressPackageStartupMessages({library(copula); library(data.table)})
set.seed(1)
dt_g11 <- as.data.table(setNames(as.data.frame(
  qnorm(rCopula(3000, tCopula(c(0.72, 0.66, 0.70), dim = 3, dispstr = "un", df = 6)))),
  c("ES", "LS", "PS")))
qgmm <- function(u, fit) qnorm(u)
gmm_by_subtest <- list(NULL, NULL, NULL)
n_sim <- 1000
PRE

awk '/^```r$/{f=1;next} /^```$/{f=0;next} f' "$MD" >> "$SCRIPT"

blocks=$(grep -c '^```r$' "$MD")
if out=$(Rscript --vanilla "$SCRIPT" 2>&1); then
  echo "check-memo-r: OK — $blocks R blocks run end to end"
  exit 0
else
  echo "check-memo-r: the R in $MD does not run"
  printf '%s\n' "$out" | sed 's/^/    /' | tail -25
  exit 1
fi
