## Load your packages, e.g. library(drake).
source("./packages.R")

## Load your R files
invisible(lapply(list.files("./R", full.names = TRUE), source))

## _drake.R must end with a call to drake_config().
## The arguments to drake_config() are basically the same as those to make().
## lock_envir allows functions that alter the random seed to be used. The biggest
## culprits of this seem to be interactive graphics e.g. plotly and mapdeck.

vars <- 1


cat(paste("outdated() targets:", paste(outdated(the_plan), collapse = " "), "\n"))

invisible(lapply(vars, function(plan_var) {
  make(the_plan, lock_envir = FALSE)
}))

