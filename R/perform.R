#' Perform Data Checks
#'
#' `perform_dc()` is a function for performing all available data checks
#' on a give data set
#'
#' @param data Data set to perform data checks
#' @param wanted_dc Character vector of names for data checks that should be 
#' performed (ie perform only these data checks)
#' @param ... A value for the input-based checks
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
perform_dc <- function(data = NULL, wanted_dc = NULL, ...) {

  # All data checks to perform
  # If not we have to make sure that all wanted dc exist
  if (is.null(wanted_dc)) {
    to_keep <- vapply(
      data.checks@dc_body, 
      function(x) x@information$check_type == "tdwg_standard", 
      logical(1)
    )
    wanted_dc <- names(data.checks@dc_body)[to_keep]
  }

  result_dc <- list()

  for (i in seq_along(wanted_dc)) {
    idx <- which(names(data.checks@dc_body) == wanted_dc[i])
    stopifnot(length(idx) == 1)
    dc <- data.checks@dc_body[[idx]]

    target_names <- gsub(" ", "", dc@input$target)
    target_names <- unlist(strsplit(target_names, ","))
    target_result <- vector("list", length(target_names))
    names(target_result) <- target_names
    for (j in target_names) {
      if (!j %in% colnames(data)) {
        #skip instead of warnings, output to data.frame
        warning(
          "Column ", j, " does not exist in a given dataset;",
          " skipping data check ", dc@name, " for it."
        )
        target_result[[j]] <- rep(NA, nrow(data))
      } else {
        if (!is.null(dc@input$target2)) {
          target_result[[j]] <- get(paste0("dc_", dc@name))(
            data[, j, drop = TRUE],
            data[, dc@input$target2, drop = TRUE]
          )
        } else {
          # All targets in a given dataset
          target_all <- data.frame(x = data[, j, drop = TRUE])
          # Unique set of all targets
          target_uniq <- data.frame(x = unique(target_all$x))
          # Perform data check only on the unique set (smaller than all)
          # And after this merge with all set (expand)
          if (dc@information$check_type == "tdwg_standard") {
            target_uniq$res <- get(paste0("dc_", dc@name))(target_uniq$x)
          } else if (dc@information$check_type == "bdclean") {
            target_uniq$res <- get(paste0("dc_", dc@name))(target_uniq$x, ...)
          }
          target_result[[j]] <- merge(
            target_all, target_uniq, "x", sort = FALSE
          )$res
        }
      }
    }
    if (!is.null(dc@information$resolution$term)) {
      target_result <- list(merged_targets = 
        rowSums(do.call("cbind", target_result)) > 0
      )
    }
    for (j in seq_along(target_result)) {
      flag <- ifelse(
        target_result[[j]],
        dc@output$output_tdwg_standard_pass,
        dc@output$output_tdwg_standard_fail
      )
      flag[is.na(flag)] <- dc@output$output_tdwg_standard_missing
      result_dc[[length(result_dc) + 1]] <-
        methods::new("DataCheckFlag",
          name = dc@name,
          target = names(target_result)[j],
          flag = flag,
          result = target_result[[j]]
        )
    }
  }

  if (length(result_dc) > 0) {
    result_dc <- methods::new("DataCheckFlagSet",
      DC = as.character(lapply(result_dc, function(x) `@`(x, name))),
      flags = result_dc
    )
    return(result_dc)
  } else {
    return(NULL)
  }
}

#' Find Missing Values
#'
#' Internal function that deals with missing values. For original missing 
#' values ("" or NA) it returns NA. For generated NA values it returns NA.
#'
#' @param result Data check modified input vector
#' @param input Original input column that's submitted to datacheck
#'
#' @return result vector with inserted NA and FALSE values
#'
perform_dc_missing <- function(result, input) {
  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(input) | input == ""] <- NA
  return(result)
}
