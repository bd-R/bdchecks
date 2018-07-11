library(shiny)
library(shinydashboard)
library(DT)

sidebar <- dashboardSidebar(
    sidebarMenu(
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
    title = "BDCHECKS",
    dashboardHeader(title = "BDCHECKS2"),
    sidebar,
    body
)

server <- function(input, output, session) {
    source("./server_Upload.R", TRUE)
    source("./server_DC.R", TRUE)
    source("./server_Filtering.R", TRUE)
}

shinyApp(ui, server)