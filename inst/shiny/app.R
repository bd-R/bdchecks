library(shiny)
library(shinydashboard)
library(shinyBS)
library(DT)

sidebar <- dashboardSidebar(
    sidebarMenu(
        id = "myTabs",
        menuItem("Upload Data", tabName = "upload"),
        menuItem("Data Checks", tabName = "datachecks"),
        menuItem("Filtering", tabName = "filtering")
    )
)
body <- dashboardBody(
    tabItems(
        tabItem("upload", source("./ui_Upload.R")$value),
        tabItem("datachecks", source("./ui_DC.R")$value),
        tabItem("filtering", source("./ui_Filtering.R")$value)
    )
)
ui <- dashboardPage(
    title = "bdchecks",
    dashboardHeader(title = "bdchecks"),
    sidebar,
    body
)

server <- function(input, output, session) {

    # Automatically stop a Shiny app when closing the browser tab
    session$onSessionEnded(stopApp)

    showModal(modalDialog(
        title = h3("Welcome to bdchecks!"),
        p("Check your data"),
        img(src = "bdverse.png", align = "center", width = "570"),
        helpText(
            "MIT License ©Tomer Gueta, Vijay Barve, Povilas Gibas, 
             Thiloshon Nagarajah, Ashwin Agrawal and Carmel Yohay (2018).",
            br(),
            "bdchecks: Biodiversity Data Checks. R package version 0.1.2"
        ),
        helpText(
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

shinyApp(ui, server)