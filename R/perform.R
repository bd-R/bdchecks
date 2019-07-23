#' Perform Data Checks
#'
#' `perform_dc()` is a function for performing all available data checks
#' on a give data set
#'
#' @param data Data set to perform data checks
#' @param wanted_dc Character vector of names for data checks that should be performed
#' (ie perform only these data checks)
#'
#' @importFrom methods new
#'
#' @return Object of a DataCheckFlagSet class (combined result for all performed
#' data checks)
#'
#' @examples
#' perform_dc(data_bats)
#' 
#' @export
#'
perform_dc <- function(data = NULL, wanted_dc = NULL) {

  # All data checks to perform
  # If not we have to make sure that all wanted dc exist
  if (is.null(wanted_dc)) {
    wanted_dc <- names(data.checks@dc_body)
  }
  result_dc <- list()

  for (i in seq_along(wanted_dc)) {
    idx <- which(names(data.checks@dc_body) == wanted_dc[i])
    stopifnot(length(idx) == 1)
    dc <- data.checks@dc_body[[idx]]

    target_names <- unlist(strsplit(dc@input$Target, ","))
    target_result <- vector("list", length(target_names))
    names(target_result) <- target_names
    for (j in target_names) {
      if (!j %in% colnames(data)) {
        warning(
          "Column ", j, " does not exist in a given dataset;",
          " skipping data check ", dc@name, " for it."
        )
        target_result[[j]] <- NULL
      } else {
        if (dc@name %in% c("countryMismatch", "coordinatePrecisionMismatch")) {
          target_result[[j]] <- get(paste0("dc_", dc@name))(
            data[, j, drop = TRUE],
            data[, dc@input$Dependency$Data, drop = TRUE]
          )
        } else {
          target_result[[j]] <- get(paste0("dc_", dc@name))(
            data[, j, drop = TRUE]
          )
        }
      }
    }
    for (j in seq_along(target_result)) {
      result_dc[[length(result_dc) + 1]] <-
        methods::new("DataCheckFlag",
          name = dc@name,
          target = names(target_result)[j],
          result = target_result[[j]]
        )
    }
  }

  if (length(result_dc) > 0) {
    result_dc <- methods::new("DataCheckFlagSet",
      DC = as.character(lapply(result_dc, function(x) `@`(x, name))),
      flags = result_dc,
      dataOrig = data,
      dataMod = data
    )
    return(result_dc)
  } else {
    return(NULL)
  }
}

#' Find Missing Values
#'
#' Internal function that deals with missing values. For original missing values
#' ("" or NA) it returns NA. For generated NA values it returns NA.
#'
#' @param result Data check modified TARGET vector
#' @param TARGET Original TARGET column that's submitted to datacheck
#'
#' @return result vector with inserted NA and FALSE values
#'
perform_dc_missing <- function(result, TARGET) {
  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}