
#' Shorthands for 'testthat' expectations
#'
#' These operators are powered by the package *doubt* and make testing very compact.
#' * `?~` is `testthat::expect_true()`
#' * `?e~` is `testthat::expect_equal()`
#' * `?i~` is `testthat::expect_identical`
#' These operators have various interesting properties
#' * They support the unary notation, which allows us to write `?~ is.numeric(2)`
#' * They support infix notation AND left hand side n-ary notation so that you
#'  choose between `tan(pi/4) ?e~ 1`, or, `?e~ tan(pi/4) ? 1`
#' * They have the lowest precedence, which means for instance that `2 ?i~ 1 + 1`
#' doesn't need brackets.
#'
#' rather than `TRUE ?e~ is.numeric(2)`.
#'
#' @inheritParams testthat::expect_equal
#' @name shorthands
NULL

#' Create a test
#'
#' This is an infix version of `testthat::test_that()`, compact and handy to
#' highlight the description and spare brackets.
#'
#' @rdname shorthands
#' @export
`%?%` <- testthat::test_that

#' @rdname shorthands
#' @export
`?~`  <- testthat::expect_true

#' @rdname shorthands
#' @export
`?e~`  <- testthat::expect_equal

#' @rdname shorthands
#' @export
`?i~`  <- testthat::expect_identical


#' @inheritParams testthat::expect_equal
#' @name dubious_test_ops
NULL

#' @rdname dubious_test_ops
#' @export
`?+++++~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, T, T, T, T)))

#' @rdname dubious_test_ops
#' @export
`?++++.~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, T, T, T, F)))

#' @rdname dubious_test_ops
#' @export
`?+++.+~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, T, T, F, T)))

#' @rdname dubious_test_ops
#' @export
`?+++..~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, T, T, F, F)))

#' @rdname dubious_test_ops
#' @export
`?++.++~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, T, F, T, T)))

#' @rdname dubious_test_ops
#' @export
`?++.+.~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, T, F, T, F)))

#' @rdname dubious_test_ops
#' @export
`?++..+~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, T, F, F, T)))

#' @rdname dubious_test_ops
#' @export
`?++...~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, T, F, F, F)))

#' @rdname dubious_test_ops
#' @export
`?+.+++~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, F, T, T, T)))

#' @rdname dubious_test_ops
#' @export
`?+.++.~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, F, T, T, F)))

#' @rdname dubious_test_ops
#' @export
`?+.+.+~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, F, T, F, T)))

#' @rdname dubious_test_ops
#' @export
`?+.+..~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, F, T, F, F)))

#' @rdname dubious_test_ops
#' @export
`?+..++~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, F, F, T, T)))

#' @rdname dubious_test_ops
#' @export
`?+..+.~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, F, F, T, F)))

#' @rdname dubious_test_ops
#' @export
`?+...+~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, F, F, F, T)))

#' @rdname dubious_test_ops
#' @export
`?+....~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, T, F, F, F, F)))

#' @rdname dubious_test_ops
#' @export
`?.++++~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, T, T, T, T)))

#' @rdname dubious_test_ops
#' @export
`?.+++.~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, T, T, T, F)))

#' @rdname dubious_test_ops
#' @export
`?.++.+~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, T, T, F, T)))

#' @rdname dubious_test_ops
#' @export
`?.++..~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, T, T, F, F)))

#' @rdname dubious_test_ops
#' @export
`?.+.++~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, T, F, T, T)))

#' @rdname dubious_test_ops
#' @export
`?.+.+.~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, T, F, T, F)))

#' @rdname dubious_test_ops
#' @export
`?.+..+~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, T, F, F, T)))

#' @rdname dubious_test_ops
#' @export
`?.+...~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, T, F, F, F)))

#' @rdname dubious_test_ops
#' @export
`?..+++~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, F, T, T, T)))

#' @rdname dubious_test_ops
#' @export
`?..++.~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, F, T, T, F)))

#' @rdname dubious_test_ops
#' @export
`?..+.+~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, F, T, F, T)))

#' @rdname dubious_test_ops
#' @export
`?..+..~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, F, T, F, F)))

#' @rdname dubious_test_ops
#' @export
`?...++~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, F, F, T, T)))

#' @rdname dubious_test_ops
#' @export
`?...+.~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, F, F, T, F)))

#' @rdname dubious_test_ops
#' @export
`?....+~` <- function(object, expected) eval.parent(substitute(expect_same_behavior(object, expected, F, F, F, F, T)))
