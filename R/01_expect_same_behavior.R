
#' Expectation: do two calls behave the same ?
#'
#' `expect_same_behavior()` tests if two calls trigger the same result,
#'  printed output, messages, warnings and failures. These can be tested separately
#'  or together.
#'
#'  `expect_same_behavior()` is wrapped by the `~+++++?` family of said dubious
#'  operators (powered by the package *doubt*)
#'
#' @param object,expected  Computation and value to compare it to.
#' @param desc Description, if not missing the call will forward `desc` to `test_that`.
#' @param value Wether to test if result is identical.
#' @param output Wether to test if printed output is identical.
#' @param message Wether to test if messages are identical.
#' @param warning Wether to test if warnings are identical.
#' @param failure Wether to test if both calls fail with the same error message.
#'
#' @return Returns `NULL` invisibly.
#' @export
expect_same_behavior <- function(
  object, expected, #desc, # see comment below
  value = TRUE,
  output = TRUE,
  message = TRUE,
  warning = TRUE,
  failure = TRUE){

  # closed for now because ambiguous until doubt::`?` makes available to
  # its function on which side arguments are.

  # if(!missing(desc)){
  #   return(eval.parent(substitute(
  #     testthat::test_that(desc, expect_same_behavior(
  #       object, expected, value = value, output = output, message = message,
  #       warning = warning, failure = failure))
  #   )))
  # }

  # deal with unary case
  quiet <- purrr::safely(purrr::quietly(identity))
  object_chr <- paste(deparse(substitute(object)), collapse="\n")
  object   <- eval(substitute(quiet(object)))
  if(missing(expected)){
    expected_chr <- "TRUE"
    expected <- quiet(TRUE)
  } else {
    expected_chr <- paste(deparse(substitute(expected)), collapse="\n")
    expected <- eval(substitute(quiet(expected)))
  }
  if(value)
    testthat::expect(
      identical(object$result$result, expected$result$result),
      sprintf("`%s` and `%s` don't return the same result.", object_chr, expected_chr))
  if(output)
    testthat::expect(
      identical(object$result$output, expected$result$output),
      sprintf("`%s` and `%s` don't print the same output", object_chr, expected_chr))
  if(message)
    testthat::expect(
      identical(object$result$messages, expected$result$messages),
      sprintf("`%s` and `%s` don't print the same messages", object_chr, expected_chr))
  if(warning)
    testthat::expect(
      identical(object$result$warnings, expected$result$warnings),
      sprintf("`%s` and `%s` don't trigger the same warnings", object_chr, expected_chr))
  if(failure)
    testthat::expect(
      identical(object$error$message, expected$error$message),
      sprintf("`%s` and `%s` don't trigger the same error", object_chr, expected_chr))
  else {
    testthat::expect(is.null(object$error$message), sprintf(
      "\n%s\nfailed with :\n%s", object_chr, object$error$message))
    testthat::expect(is.null(expected$error$message), sprintf(
      "\n%s\nfailed with :\n%s", expected_chr, expected$error$message))
  }

  invisible(NULL)
}
