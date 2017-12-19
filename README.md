# actools
Contains several helper functions for R

## Installation
Make sure you have the package 'devtools' installed, then run:

`devtools::install_github("Prometheus77/actools")`

## Commands

### Between operators
`%btwn%` checks whether the left hand side argument is between the min and max numbers in a vector supplied on the right hand side

`%_btwn_%` a non-inclusive version of `%btwn%`, i.e. `x %_btwn_% c(2,4)` would return `FALSE` for x = 2 and x = 4

### Equivalency operators
`%==%` works like `==` but handles NA, NULL, and empty lists

`%!=%` works like `!=` but handles NA, NULL, and empty lists

### Hard round
`hard_round()` takes a vector and rounds it to the specified number of units in a way that the rounded elements of the vector sum exactly to the rounded sum of the original vector -- useful in preparing financials where you want the rows and columns to sum properly

Example:
```
> x <- c(1.3, 1.3, 1.3)
> sum(x)
[1] 3.9
> round(sum(x)) # sum of elements rounds to 4
[1] 4
> round(x, 0)
[1] 1 1 1
> sum(round(x, 0)) # sum of rounded elements is 3, but needs to be 4
[1] 3
> hard_round(x, 1)
[1] 1 1 2
> sum(hard_round(x, 1)) # sum of rounded elements now matches rounded sum
[1] 4
```
