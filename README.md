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
