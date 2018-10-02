sidebarPanel2 <- function (..., out = NULL, width = 4) {
    div(class = paste0("col-sm-", width), 
        tags$form(class = "well", ...),
        out
    )
}

fluidPage(
    titlePanel("Upload Data"),
    sidebarLayout(
        sidebarPanel2(
            bsCollapse(multiple = FALSE, open = "Upload Local File",
                       bsCollapsePanel("Upload Local File", 
                                       fileInput("pathInput",
                                                 h3("CSV / DWCA ZIP file input"),
                                                 FALSE,
                                                 accept = c("text/csv",
                                                            "text/comma-separated-values,text/plain",
                                                            ".csv",
                                                            ".zip",
                                                            "application/zip"
                                                            )
                                                ),
                                       style = "info"

                       ),
                       bsCollapsePanel("Query Data From a Database",
                                       textInput("scientificName",
                                                 h3("Scientific Name:"),
                                                 "Puma concolor"),
                                       numericInput("recordSize",
                                                   h3("Record Size:"),
                                                   500),
                                       selectInput("hasCoords",
                                                   h3("Records Filter:"),
                                                   list("With Coordinates" = "1",
                                                        "Without Coordinates" = "2",
                                                        "No Filter" = "3"
                                                    ),
                                                    3
                                        ),
                                    radioButtons("queryDB",
                                                 h3("Online Database:"),
                                                 list("GBIF (Global Biodiversity Information Facility)" = "gbif",
                                                      "iDigBio (Integrated Digitized Biocollections)" = "idigbio",
                                                      "EcoEngine (Berkeley Ecoinformatics Engine)" = "ecoengine",
                                                      "Vertnet (Vertebrate Network)" = "vertnet",
                                                      "BISON (Biodiversity Information Serving Our Nation)" = "bison",
                                                      "iNaturalist" = "inat",
                                                      "ALA (Atlas of Living Australia)" = "ala",
                                                      "OBIS (Ocean Biogeographic Information System)" = "obis",
                                                      "AntWeb" = "antweb"
                                                ),
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
            ),
            out = shinyjs::disabled(actionButton("acceptFile", "Accept Dataset",
                               icon = icon("check"), 
                               width = 210,
                               style = "color: #000000; background-color: #71a879; border-color: #091520;
                                        padding:10px; font-size:120%"))
        ),
        mainPanel(
            DT::dataTableOutput("contents")
        )
    )
)