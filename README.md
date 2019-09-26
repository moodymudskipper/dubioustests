
# dubioustests

*dubioustests* is a testing package for lazy typers with
parentheses-phobia.

It essentially proposes shorthands for *testthat* functions, using a
syntax powered by the *doubt* package, hence its name.

Install with :

``` r
remotes::install_github("moodymudskipper/dubioustests")
```

## Examples

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

## Wrap it up with `%?%`

`%?%` is `testthat::test_that()` but the description text comes first
and we don’t need parentheses anymore.

Putting everything together we get :

``` r
"test that my functions work" %?% {
  ?~  is.numeric(2)
  ?e~ tan(pi/4) ? 1
}
```

## Other aliases ?

The package doesn’t propose other aliases for *testthat* functions at
the moment.

In many case the `?~` or `?e~` shorthands do the job just fine though.
The two following expressions would only differ by the error message
they would generate but they’re explicit either way.

``` r
test_that("a few things work as they should", {
  expect_length(4:6, 4)
  expect_gt(4, 5)
  expect_match("foobar","^bar")
})
#> Error: Test failed: 'a few things work as they should'
#> * 4:6 has length 3, not length 4.
#> * 4 is not strictly more than 5. Difference: -1
#> * "foobar" does not match "^bar".
#> Actual value: "foobar"

"a few things work as they should" %?% {
  ?~ length(4:6) == 4
  ?~ 4 > 5
  ?~ grepl("^bar","foobar")
}
#> Error: Test failed: 'a few things work as they should'
#> * length(4:6) == 4 isn't true.
#> * 4 > 5 isn't true.
#> * grepl("^bar", "foobar") isn't true.
```

And if needed we can easily define new dubious aliases :

``` r
`?len~` <- expect_length
`?err~` <- expect_error
?len~ 4:6 ? 4
#> Error: 4:6 has length 3, not length 4.
?err~ stop("foo error")
?err~ stop("foo error") ? "^foo"
?err~ stop("foo error") ? "^bar"
#> Error: `stop("foo error")` threw an error with unexpected message.
#> Expected match: "^bar"
#> Actual message: "foo error"
```
