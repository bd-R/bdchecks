fluidPage(
    conditionalPanel("!input.acceptFile", 
                     h2("Upload and Accept Dataset")),
    conditionalPanel("input.acceptFile", 
        checkboxGroupInput("chkBoxDC","Select Data Checks:", c("ID" = "ID")),
        textOutput("selected_DC"),
        textOutput("txt"),
        actionButton("selectDC", "Select Data Checks")
    )
)
