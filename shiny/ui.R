fluidPage(
    fluidPage(
        fluidRow(
            checkboxGroupInput(inputId  = "selectionToRemove", 
                               label    = "Data Checks to Remove", 
                               choices  = c("Passed", "Failed", "Missing"), 
                               selected = c("Failed")),
            actionButton("DC_remove", "Remove"),
            actionButton("DC_cellClear", "Clear Selections"),
            downloadButton("dwnl_Data", "Download final as a .csv file"),
            tableOutput("nRecordsBefore")
        ),
        fluidRow(
            DT::dataTableOutput("tableDataChecks")
        )
    )
)