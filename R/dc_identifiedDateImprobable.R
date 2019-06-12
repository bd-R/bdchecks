#' @rdname dc_identifiedDateImprobable
dc_identifiedDateImprobable <- function(TARGET) {
  TARGETdate <- as.Date(ifelse(TARGET == "", NA, TARGET), origin = "1970-01-01")
  TARGETdate <= Sys.Date() & TARGETdate >= as.Date("1753-01-01", origin = "1970-01-01")
}
