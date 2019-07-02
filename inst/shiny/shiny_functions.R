data_loaded_task <- function(data) {
  DT::renderDataTable(
    DT::datatable({
      if (nrow(data) == 0) {
        return(data)
      }
      result <- as.data.frame(data)
      result <- result[, names(result) %in% c(
        "scientificName",
        "taxonRank",
        "eventDate",
        "country",
        "decimalLatitude",
        "decimalLongitude"
      )]
      result <- cbind(result, data)
      hiding_cols <- c()
      result[] <- lapply(result, as.character)
      nr <- nrow(result)
      # Trim long columns
      # Random sample of rows from columns and define mean length
      for (i in 1:ncol(result)) {
        sampled <- sample(nr, ifelse(nr > 1000, 1000, nr))
        foo <- sapply(result[sampled, i], function(x) {
          nchar(x)
        })
        bar <- mean(foo, na.rm = TRUE)
        if (!is.nan(bar)) {
          if (bar > 50) {
            hiding_cols <- c(hiding_cols, i)
          }
        }
      }
      if (length(hiding_cols) > 0) {
        result <- result[, c(hiding_cols * -1)]
      }
      result
    },
    options = list(scrollX = TRUE)
    )
  )
}
sidebar_panel2 <- function(..., out = NULL, width = 4) {
  shiny::div(
    class = paste0("col-sm-", width),
    shiny::tags$form(class = "well", ...),
    out
  )
}