shiny::fluidPage(
    shiny::conditionalPanel("!input.select_dc", h2("Select Data Checks")),
        shiny::conditionalPanel("input.select_dc",
            width = 12,
            shiny::checkboxGroupInput(
                "selection_to_remove",
                "Select Data Checks Group to Remove",
                c("All Passed", "All Failed", "All Missing")
            ),
            br(),
            column(width = 12,
                   shiny::actionButton("DC_remove",
                                       "Filter Out Selected Checks",
                                       icon = icon("broom"),
                                       width = 300,
                                       style = "color: #000000;
                                                background-color: #e49c8b;
                                                border-color: #091520;
                                                padding:10px; font-size:120%")
                   ),
            br(), br(), br(),
            column(width = 12,
                   shiny::actionButton("dc_cell_clear", "Clear Selections",
                                       icon = icon("backward"),
                                       width = 300,
                                       style = "color: #000000;
                                                background-color: #e4c88b;
                                                border-color: #091520;
                                                padding:10px; font-size:120%")
                   ),
            br(), br(), br(),
            column(width = 12,
                   shiny::downloadButton(
                        "dwnl_Data", "Download final data",
                        icon = icon("check"),
                        width = 350,
                        style = "color: #000000;
                                 background-color: #71a879;
                                 border-color: #091520;
                                 padding:10px; font-size:120%"
                   )
               ),
            br(), br(), br(),
            shiny::fluidRow(
                column(12,
                    shinydashboard::valueBoxOutput("vb_n_records1", width = 2),
                    shinydashboard::valueBoxOutput("vb_n_records2", width = 2),
                    shinydashboard::valueBoxOutput("vb_n_dc", width = 2),
                offset = 0)
            ),
            br(), br(),
            DT::dataTableOutput("table_dc")
    )
)