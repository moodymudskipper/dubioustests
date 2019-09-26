.onAttach <- function(libname, pkgname) {
  doubt::register_ops(c("?~", "?e~", "?i~"))
  invisible()
}
