module_uploaddata_ui <- function(id_namespace) {
  ns <- shiny::NS(id_namespace)
  shinyBS::bsCollapse(
    multiple = FALSE,
    open = "Upload Local File",
    shinyBS::bsCollapsePanel("Upload Local File",
      shiny::fileInput(
        ns("path_input"),
        shiny::h3("CSV / DWCA ZIP file input"),
        FALSE,
        accept = c(
          "text/csv",
          "text/comma-separated-values,text/plain",
          ".csv",
          ".zip",
          "application/zip"
        )
      ),
      style = "info"
    ),
    shinyBS::bsCollapsePanel("Query Data From a Database",
      shiny::textInput(
        ns("scientific_name"),
        shiny::h3("Scientific Name:"),
        "Puma concolor"
      ),
      shiny::numericInput(
        ns("record_size"),
        shiny::h3("Record Size:"),
        500
      ),
      shiny::selectInput(
        ns("has_coords"),
        shiny::h3("Records Filter:"),
        list(
          "With Coordinates" = "1",
          "Without Coordinates" = "2",
          "No Filter" = "3"
        ),
        3
      ),
      shiny::radioButtons(
        ns("query_db"),
        shiny::h3("Online Database:"),
        online_databases,
        "gbif"
      ),
      shiny::br(),
      shiny::div(
        id = "queryDatabaseDiv",
        class = "activeButton",
        shiny::actionButton(
          ns("query_database"),
          "Query Database",
          shiny::icon("download")
        )
      ),
      style = "success"
    )
  )
}