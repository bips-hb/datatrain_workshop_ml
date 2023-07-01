if (as.logical(Sys.getenv("IN_DOCKER", unset = "FALSE"))) {
  message("Assuming you're running in a Docker container, so I'm not loading renv!")
} else {
  source("renv/activate.R")
}

# Placeholder library-calls are only here such that renv will
# pick these packages up as dependencies automatically, as they are not directly loaded
# anywhere in the workshop, but needed as indirect dependencies or for interactive use.
if (FALSE) {
  library(rmarkdown)
  library(ragg)
  library(commonmark)
  library(precrec)
  library(ranger)
  library(xgboost)
  library(patchwork)
  library(e1071)
  library(apcluster)
  library(remotes)
  library(usethis)
  library(styler)
}
