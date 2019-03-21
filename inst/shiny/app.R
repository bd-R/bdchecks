library(shiny)
library(shinydashboard)
library(shinyBS)
library(DT)

sidebar <- shinydashboard::dashboardSidebar(
    shinydashboard::sidebarMenu(
        id = "myTabs",
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
    session$onSessionEnded(stopApp)

    shiny::showModal(shiny::modalDialog(
        title = h3("Welcome to bdchecks!"),
        p("Check your data"),
        img(src = "bdverse.png", align = "center", width = "570"),
        shiny::helpText(
            "MIT License ©Tomer Gueta, Vijay Barve, Povilas Gibas,
             Thiloshon Nagarajah, Ashwin Agrawal and Carmel Yohay (2018).",
            br(),
            "bdchecks: Biodiversity Data Checks. R package version 0.1.2"
        ),
        shiny::helpText(
            "Contribute: ",
            a("https://github.com/bd-R/bdchecks",
              href = "https://github.com/bd-R/bdchecks"),
            br(), "Join: ",
            a("https://bd-r-group.slack.com",
              href = "https://bd-r-group.slack.com")
        ),
        size = "m",
        easyClose = TRUE
    ))

    source("./server_Upload.R", TRUE)
    source("./server_DC.R", TRUE)
    source("./server_Filtering.R", TRUE)
}

shiny::shinyApp(ui, server)