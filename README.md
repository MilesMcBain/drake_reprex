# drake_reprex

Steps to reproduce this issue observed on drake:

1. Run the plan in a terminal with:

```
$ Rscript drake.r
```

2. change the computation in the `calc_result2` function, e.g. `result1 * 3`

3. Run the plan in the terminal again. And observe this output:

```
outdated() targets: result1 result2 
v All targets are already up to date.
```

## Things that do work

If `calc_result2` is replaced by the actual inline computation, e.g. `result2 = result1 * 3`, the change is detected and plan is rebuilt.

If the value of `vars` is changed in `drake.R` the change is detected and the plan is rebuilt.

If the `lapply` is removed and `plan_var` is set globally in `drake.R` like so:

```
## Load your packages, e.g. library(drake).
source("./packages.R")

## Load your R files
invisible(lapply(list.files("./R", full.names = TRUE), source))

## _drake.R must end with a call to drake_config().
## The arguments to drake_config() are basically the same as those to make().
## lock_envir allows functions that alter the random seed to be used. The biggest
## culprits of this seem to be interactive graphics e.g. plotly and mapdeck.

plan_var <- 2


cat(paste("outdated() targets:", paste(outdated(the_plan), collapse = " "), "\n"))

make(the_plan, lock_envir = FALSE)
```

changes to `calc_result2` are detected and the plan is rebuilt.
