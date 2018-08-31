#!/usr/bin/env r

if (is.null(argv) | length(argv)<1) {
  cat("Usage: installr.r pkg1 [pkg2 pkg3 ...]\n")
  q()
}

## adjust as necessary, see help('download.packages')
repos <- "https://cran.rstudio.com"

## set local library
lib.loc <- unlist(strsplit(Sys.getenv("R_LIBS_USER"), .Platform$path.sep))[1L]
# lib.loc <- "/usr/local/lib/R/site-library"

install.packages(argv, lib.loc, repos)
