#' Perform Data Checks
#'
#' `perform_dc()` is a function for performing all available data checks
#' on a give data set
#'
#' @param data Data set to perform data checks
#' @param wanted_dc Character vector of names for data checks that should be 
#' performed (ie perform only these data checks)
#' @param ... A value for the input-based checks
#' (possible choices: temporal_res, spatial_res, lowest_rank, lowest_date)
#'
#' @importFrom methods new
#'
#' @return Object of a DataCheckFlagSet class (combined result for all 
#' performed data checks)
#'
#' @examples
#' perform_dc(data_bats)
#' 
#' @export
#'
perform_dc <- function(data = NULL, wanted_dc = NULL, ...) {

  # All data checks ("tdwg_standard" type) to perform
  # If not we have to make sure that all wanted dc exist
  if (is.null(wanted_dc)) {
    to_keep <- vapply(
      data.checks@dc_body, 
      function(x) x@information$check_type == "tdwg_standard", 
      logical(1)
    )
    wanted_dc <- names(data.checks@dc_body)[to_keep]
  }
  # DataCheckFlagSet object place
  result_dc <- list()
  not_performed <- data.frame()
  for (i in seq_along(wanted_dc)) {
    # Match each check name to data.checks object
    idx <- which(names(data.checks@dc_body) == wanted_dc[i])
    # Stop if any check names are duplicated, MAYBE UNIQUE() INSTEAD?
    stopifnot(length(idx) == 1)
    dc <- data.checks@dc_body[[idx]]
    # Remove any possible white spaces for target columns
    target_names <- gsub(" ", "", dc@input$target)
    target_names <- unlist(strsplit(target_names, ","))
    missing_targets <- target_names[!target_names %in% colnames(data)]
    # Same removal for target2 field
    if (!is.null(dc@input$target2)) {
      target2_names <- gsub(" ", "", dc@input$target2)
      target2_names <- unlist(strsplit(target2_names, ","))
      missing_targets <- c(missing_targets, 
        target2_names[!target2_names %in% colnames(data)]
      )
    }
    # Output any missing targets
    if (length(missing_targets) != 0) {
      # warning(
      #   dc@name, " won't be performed on the following columns, ", 
      #   "because they don't exist in a given dataset: ", 
      #   paste(missing_targets, collapse=", ")
      # )
      not_performed <- rbind(
        not_performed, 
        data.frame(
          check = dc@name, 
          missing_targets = paste(missing_targets, collapse=", ")
        )
      )
    }
    # Keep only existing target columns
    target_names <- target_names[target_names %in% colnames(data)]
    target_result <- vector("list", length(target_names))
    names(target_result) <- target_names
    for (j in target_names) {
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
        # For all input-based data checks
        } else if (dc@information$check_type == "bdclean") {
          target_uniq$res <- get(paste0("dc_", dc@name))(target_uniq$x, ...)
        }
        # Performed unique values are spread to all values
        target_result[[j]] <- merge(
          target_all, target_uniq, "x", sort = FALSE
        )$res
      }
    }
    
    # Merge values (if multiple targets exist) based on data check logic
    if (!is.null(dc@information$resolution$term) && length(target_result) != 0) {
      if (dc@information$resolution$term == "multi_term_logical_AND") {
        target_result <- list(merged_targets = 
          rowSums(do.call("cbind", target_result)) == length(target_result)
        )
      } else if (dc@information$resolution$term == "multi_term_logical_OR") {
        target_result <- list(merged_targets = 
          rowSums(do.call("cbind", target_result)) > 0
        )
      }
    }
    # Match flags to results of data checks
    for (j in seq_along(target_result)) {
      flag <- ifelse(
        target_result[[j]],
        dc@output$output_tdwg_standard_pass,
        dc@output$output_tdwg_standard_fail
      )
      flag[is.na(flag)] <- dc@output$output_tdwg_standard_missing
      # Complete DataCheckFlag object
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
    # Create DataCheckFlagSet from DataCheckFlag
    result_dc <- methods::new("DataCheckFlagSet",
      DC = as.character(lapply(result_dc, function(x) `@`(x, name))),
      flags = result_dc,
      not_performed = not_performed
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
  if (is.character(input)) {
    result[is.na(input) | input == ""] <- NA
  } else {
    result[is.na(input)] <- NA
  }
  return(result)
}
