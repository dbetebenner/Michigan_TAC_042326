#!/usr/bin/env Rscript
# Generate _slugmap.yml: the slug -> output-path map that filters/wikilinks.lua
# uses to resolve [[bare-slug]] links.
#
# Slugs are unique wiki-wide; scripts/check-links.sh enforces that. Titles come
# from each page's frontmatter so a link renders as the page's real title rather
# than its slug.

root <- normalizePath(file.path(dirname(sub("^--file=", "", grep("^--file=",
          commandArgs(trailingOnly = FALSE), value = TRUE)[1])), ".."))
setwd(root)

files <- list.files("wiki", pattern = "[.]md$", recursive = TRUE, full.names = TRUE)

first_title <- function(path) {
  lines <- readLines(path, warn = FALSE, n = 40)
  # Frontmatter must open on line 1; read title: up to the closing fence.
  if (length(lines) == 0L || !grepl("^---\\s*$", lines[1])) return(NA_character_)
  close_at <- which(grepl("^---\\s*$", lines))[2]
  if (is.na(close_at)) return(NA_character_)
  hit <- grep("^title:\\s*", lines[2:(close_at - 1L)], value = TRUE)
  if (length(hit) == 0L) return(NA_character_)
  val <- sub("^title:\\s*", "", hit[1])
  trimws(gsub('^"|"$', "", val))
}

esc <- function(x) gsub('"', '\\\\"', x)

entries <- vapply(files, function(f) {
  slug <- sub("[.]md$", "", basename(f))
  # wiki/topics/foo.md -> wiki/topics/foo.html
  href <- sub("[.]md$", ".html", f)
  title <- first_title(f)
  if (is.na(title)) title <- slug
  sprintf('  %s:\n    path: "%s"\n    title: "%s"', slug, href, esc(title))
}, character(1))

writeLines(c("wikislugs:", entries), "_slugmap.yml")
cat(sprintf("_slugmap.yml: %d slugs\n", length(entries)))
