#' @rdname dc_dataGeneralised
#' 
#' @param TARGET a vector of data generalization value. To pass must a an empty
#' value.
#' 
dc_dataGeneralised <- function(TARGET) {
  result <- is.na(TARGET) | TARGET == ""
  return(result)
}
