#' @rdname dc_occurrenceIdNotGuid
dc_occurrenceIdNotGuid <- function(TARGET) {
  grepl(
    "^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[0-9a-f]{4}-[0-9a-f]{12}$",
    tolower(TARGET)
  )
}
