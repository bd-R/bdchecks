rv <- shiny::reactiveValues(
  data_original = data.frame()
)

data_loaded_task <- function(data) {
  output$contents <- DT::renderDataTable(
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

shiny::observeEvent(input$path_input, {
  shiny::withProgress(message = paste(
    "Reading",
    input$path_input$name, "..."
  ), {
    if (is.null(input$path_input)) {
      return("No data to view")
    }
    if (grepl("zip", tolower(input$path_input$type))) {
      message("Reading DWCA ZIP...")
      rv$data_original <- finch::dwca_read(
        input$path_input$datapath,
        TRUE
      )$data[[1]]
    } else {
      rv$data_original <- data.table::fread(
        input$path_input$datapath, data.table = FALSE
      )
    }
  })
})

shiny::observeEvent(input$query_database, {
  shiny::withProgress(message = paste("Querying", input$query_db, "..."), {
    if (input$query_db == "gbif") {
      rv$data_original <- rgbif::occ_search(
        scientificName = input$scientific_name,
        limit = input$record_size,
        hasCoordinate = switch(input$has_coords,
          "1" = TRUE,
          "2" = FALSE,
          "3" = NULL
        )
      )$data
    } else {
      warnings <- capture.output(
        data <- spocc::occ(
          query = input$scientific_name,
          from = input$query_db,
          limit = input$record_size,
          has_coords = switch(input$has_coords,
            "1" = TRUE,
            "2" = FALSE,
            "3" = NULL
          )
        ),
        type = "message"
      )
      if (length(warnings) > 0) {
        shiny::showNotification(paste(warnings, collapse = " "),
          duration = 6
        )
      }
      rv$data_original <- data[[input$query_db]]$data[[1]]
    }
  })
})

shiny::observe({
  if (nrow(rv$data_original) > 0) {
    darwinizer <- bdDwC::darwinize_names(
      rv$data_original,
      bdDwC:::data_darwin_cloud$data
    )
    fixed <- darwinizer[darwinizer$match_type == "Darwinized", ]
    if (nrow(fixed) > 0) {
      rv$data_original <- bdDwC::rename_user_data(rv$data_original, darwinizer)
      shiny::showNotification(paste(
        "Converted Columns:",
        paste(
          paste(fixed[, 1], collapse = ", "),
          paste(fixed[, 2], collapse = ", "),
          sep = " -> "
        )
      ),
      duration = 7
      )
    }
    data_loaded_task(rv$data_original)
    shinyjs::enable("accept_file")
  }
})

shiny::observeEvent(input$accept_file, {
  shinydashboard::updateTabItems(session, "my_tabs", "datachecks")
})