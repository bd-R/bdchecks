sidebar_panel2 <- function (..., out = NULL, width = 4) {
    div(class = paste0("col-sm-", width),
        tags$form(class = "well", ...),
        out
    )
}
online_databases <- list(
    "GBIF (Global Biodiversity Information Facility)" = "gbif",
    "iDigBio (Integrated Digitized Biocollections)" = "idigbio",
    "EcoEngine (Berkeley Ecoinformatics Engine)" = "ecoengine",
    "Vertnet (Vertebrate Network)" = "vertnet",
    "BISON (Biodiversity Information Serving Our Nation)" = "bison",
    "iNaturalist" = "inat",
    "ALA (Atlas of Living Australia)" = "ala",
    "OBIS (Ocean Biogeographic Information System)" = "obis",
    "AntWeb" = "antweb"
)

shiny::fluidPage(
    shiny::titlePanel("Upload Data"), shiny::sidebarLayout(
        sidebar_panel2(
            shiny::bsCollapse(multiple = FALSE,
                       open = "Upload Local File",
                       shiny::bsCollapsePanel("Upload Local File",
                            shiny::fileInput(
                                "path_input",
                                h3("CSV / DWCA ZIP file input"),
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
                       shiny::bsCollapsePanel("Query Data From a Database",
                           shiny::textInput("scientific_name",
                                            h3("Scientific Name:"),
                                            "Puma concolor"),
                           shiny::numericInput("record_size",
                                               h3("Record Size:"),
                                               500),
                           shiny::selectInput("has_coords",
                                              h3("Records Filter:"),
                                              list("With Coordinates" = "1",
                                            "Without Coordinates" = "2",
                                            "No Filter" = "3"
                                        ),
                                        3
                            ),
                            shiny::radioButtons("query_db",
                                                h3("Online Database:"),
                                                online_databases,
                                               "gbif"
                            ),
                            br(),
                            div(id = "queryDatabaseDiv",
                                class = "activeButton",
                                shiny::actionButton("query_database",
                                                    "Query Database",
                                                    icon("download")
                                )
                            ),
                            style = "success"
                       )
            ),
            out = shinyjs::disabled(shiny::actionButton(
                "accept_file", 
                "Accept Dataset",
                icon = icon("check"),
                width = 210,
                style = "color: #000000;
                        background-color: #71a879;
                        border-color: #091520;
                        padding:10px; font-size:120%"
            ))
        ),
        shiny::mainPanel(
            DT::dataTableOutput("contents")
        )
    )
)