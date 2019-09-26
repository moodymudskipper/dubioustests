
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dubioustests

*dubioustests* is a testing package for lazy typers who don’t like
parentheses.

It essentially proposes shorthands for *testthat* functions, using a
syntax powered by the *doubt* package, hence its name.

Install with :

``` r
remotes::install_github("moodymudskipper/dubioustests")
```

# Examples

Let’s attach both *dubioustests* and *testthat* and review sets of
equivalent calls.

``` r
library(testthat)
library(dubioustests, warn.conflicts = FALSE)
```

Test if a value is `TRUE` :

``` r
expect_true(is.numeric(2))
?~ is.numeric(2)
```

Test if two values are equal using `all.equal()`

``` r
expect_equal(tan(pi/4), 1)
?e~ tan(pi/4) ? 1
```

Test if two values are identical using `identical()`

``` r
expect_identical(tan(pi/4), 1)
#> Error: tan(pi/4) not identical to 1.
#> Objects equal but not identical
?i~ tan(pi/4) ? 1
#> Error: tan(pi/4) not identical to 1.
#> Objects equal but not identical
```

We can also use the infix notation and write `tan(pi/4) ?i~ 1` instead
of `?i~ tan(pi/4) ? 1`

# Wrap it up with `%?%`

`%?%` is `testthat::test_that()`. The nice thing about it is we don’t
need brackets anymore and the description text comes first.

Putting everything together we get :

``` r
"test that my functions work" %?% {
  ?~ is.numeric(2)
  ?e~ tan(pi/4) ? 1
}
```

## Other aliases ?

The package doesn’t propose other aliases for *testthat* functions.

For many of them it’s just as explicit to use the `?~` or `?e~`
shorthands, and the others might benefit from more verbosity.

``` r
expect_length(4:6, 3)
# using shortcuts for `expect_true()` or `expect_equal()`
?~ length(4:6) == 3
?e~ length(4:6) ? 3
length(4:6) ?e~ 3
```

And if needed we can easily define a new alias:

``` r
`?l~` <- expect_length
?l~ 4:6 ? 4
#> Error: 4:6 has length 3, not length 4.
`?err~` <- expect_error
?err~ stop("foo error")
?err~ stop("foo error") ? "^foo"
?err~ stop("foo error") ? "^bar"
#> Error: `stop("foo error")` threw an error with unexpected message.
#> Expected match: "^bar"
#> Actual message: "foo error"
```
