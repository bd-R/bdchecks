fluidPage(
    titlePanel("Upload Data"),
    sidebarLayout(
        sidebarPanel(
            bsCollapse(multiple = FALSE, open = "Upload Local File",
                       bsCollapsePanel("Upload Local File", 
                                       fileInput("pathInput",
                                                 "Choose a csv file",
                                                 multiple = FALSE,
                                                 c("text/csv",
                                                   "text/comma-separated-values,text/plain",
                                                   ".csv")
                                       ),
                                       style = "info"

                       ),
                       bsCollapsePanel("Query Data From a Database",
                                       textInput("scientificName",
                                                 h3("Scientific Name:"),
                                                 "Puma concolor"),
                                       sliderInput("recordSize",
                                                   h3("Record Size:"),
                                                   500,
                                                   min = 0, max = 50000),
                                       checkboxGroupInput("queryDB",
                                                          h3("Online Database:"),
                                                          list("GBIF" = "gbif",
                                                               "Bison" = "bison",
                                                               "Inat" = "inat",
                                                               "eBird" = "ebird",
                                                               "Ecoengine" = "ecoengine",
                                                               "Vertnet" = "vertnet"),
                                                          "gbif"
                                       ),
                                       br(),
                                       div(id = "queryDatabaseDiv",
                                           class = "activeButton",
                                           actionButton("queryDatabase", 
                                                        "Query Database", 
                                                        icon("download"))), 
                                       style = "success"
                       )
            )
        ),
        mainPanel(
            actionButton("acceptFile", "Accept Dataset"),
            DT::dataTableOutput("contents")
        )
    )
)