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

  source("./server_Upload.R", TRUE)
  source("./server_DC.R", TRUE)
  source("./server_Filtering.R", TRUE)
}
shiny::shinyApp(ui, server)