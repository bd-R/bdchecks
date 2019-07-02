rv <- shiny::reactiveValues(
  data_original = data.frame()
)
rv <- shiny::callModule(
  module_uploaddata,
  "main",
  rv
)
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
    output$contents <- data_loaded_task(rv$data_original)
    shinyjs::enable("accept_file")
  }
})

shiny::observeEvent(input$accept_file, {
  shinydashboard::updateTabItems(session, "my_tabs", "datachecks")
})