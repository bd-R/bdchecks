module_uploaddata <- function(input, output, session, rv) {
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

  return(rv)
}