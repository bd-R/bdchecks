fluidPage(
    conditionalPanel("!input.selectDC", h2("Select Data Checks")),
    conditionalPanel("input.selectDC", 
            width = 12, checkboxGroupInput("selectionToRemove", 
                               "Select Data Checks Group to Remove", 
                               c("All Passed", "All Failed", "All Missing")),
            br(), 
            column(width = 12, actionButton("DC_remove", "Filter Out Selected Checks",
                               icon = icon("broom"), 
                               width = 300,
                               style = "color: #000000; background-color: #e49c8b; border-color: #091520;
                                        padding:10px; font-size:120%")),
            br(), br(), br(),
            column(width = 12, actionButton("DC_cellClear", "Clear Selections",
                               icon = icon("backward"), 
                               width = 300,
                               style = "color: #000000; background-color: #e4c88b; border-color: #091520;
                                        padding:10px; font-size:120%")),
            br(), br(), br(),
            column(width = 12, downloadButton("dwnl_Data", "Download final data",
                               icon = icon("check"), 
                               width = 350,
                               style = "color: #000000; background-color: #71a879; border-color: #091520;
                                        padding:10px; font-size:120%")),
            br(), br(), br(),
            fluidRow(
                column(12, 
                    valueBoxOutput("vb_nRecords1", width = 2), 
                    valueBoxOutput("vb_nRecords2", width = 2), 
                    valueBoxOutput("vb_nDC1", width = 2),
                offset = 0)
            ),
            br(), br(),
            DT::dataTableOutput("tableDataChecks")
    )
)