fluidPage(
    shinyjs::useShinyjs(),
    conditionalPanel("!input.acceptFile", 
                     h2("Upload and Accept Dataset")),
    conditionalPanel("input.acceptFile", 
        radioButtons("DCgroupsAvailable", 
                     "Select category to group data checks:",
                     c("Darwin Core Class" = "DarwinCoreClass",
                       "Dimension" = "Dimension",
                       "Warning Type" = "Warning",
                       "Output Type" = "Output",
                       "Severity" = "Severity"),
                     "DarwinCoreClass"),
        uiOutput("DCgroupsCheckBox"),
        uiOutput("DCcheckBoxHover"),
        textOutput("selected_DC"),
        actionButton("selectDC", "Select Data Checks")
    )
)
