library(shiny)
library(shinydashboard)
library(DT)
ui <- dashboardPage(title = "BDCHECKS",

    dashboardHeader(title = "BDCHECKS2"),

    dashboardSidebar(sidebarMenu(
        menuItem("Filtering", 
                 tabName = "filtering"),
        menuItem("Data Checks", 
                 tabName = "datachecks")
    )),

    dashboardBody(
        tabItem("filtering", source("./test_UI_Filtering.R")$value)
    )
)

server <- function(input, output, session) {
    source("./test_SR_Filtering.R", TRUE)
}

shinyApp(ui, server)