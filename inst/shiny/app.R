source("shiny_functions.R")
source("shiny_modules_server.R")
source("shiny_modules_ui.R")
# options
options(
  # let bigget input files
  shiny.maxRequestSize = 50 * 1024 ^ 2,
  # debug - text (full path)
  shiny.fullstacktrace = TRUE,
  # debug - visual
  shiny.reactlog = TRUE
)

sidebar <- shinydashboard::dashboardSidebar(
  shinydashboard::sidebarMenu(
    id = "my_tabs",
    shinydashboard::menuItem("Upload Data", tabName = "upload"),
    shinydashboard::menuItem("Data Checks", tabName = "datachecks"),
    shinydashboard::menuItem("Filtering", tabName = "filtering")
  )
)
body <- shinydashboard::dashboardBody(
  shinydashboard::tabItems(
    shinydashboard::tabItem("upload", source("./ui_Upload.R")$value),
    shinydashboard::tabItem("datachecks", source("./ui_DC.R")$value),
    shinydashboard::tabItem("filtering", source("./ui_Filtering.R")$value)
  )
)
ui <- shinydashboard::dashboardPage(
  title = "bdchecks",
  shinydashboard::dashboardHeader(title = "bdchecks"),
  sidebar,
  body
)

server <- function(input, output, session) {
  # Automatically stop a Shiny app when closing the browser tab
  session$onSessionEnded(shiny::stopApp)

  shiny::showModal(shiny::modalDialog(
    title = shiny::h3("Welcome to bdchecks!"),
    shiny::p("Check your data"),
    shiny::img(src = "bdverse.png", align = "center", width = "570"),
    shiny::helpText(
      "MIT License ©Tomer Gueta, Vijay Barve, Povilas Gibas,
       Thiloshon Nagarajah, Ashwin Agrawal and Carmel Yohay (2019).",
      shiny::br(),
      "bdchecks: Biodiversity Data Checks. R package version 0.1.9"
    ),
    shiny::helpText(
      "Contribute: ",
      shiny::a("https://github.com/bd-R/bdchecks",
        href = "https://github.com/bd-R/bdchecks"
      ),
      shiny::br(), "Join: ",
      shiny::a("https://bd-r-group.slack.com",
        href = "https://bd-r-group.slack.com"
      )
    ),
    size = "m",
    easyClose = TRUE
  ))

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
        as.data.frame(rv$data_original),
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

  source("./server_DC.R", TRUE)
  source("./server_Filtering.R", TRUE)
}
shiny::shinyApp(ui, server)