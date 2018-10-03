fluidPage(
    shinyjs::useShinyjs(),
    conditionalPanel("!input.acceptFile", 
                     h2("Upload and Accept Dataset")),
    conditionalPanel("input.acceptFile",
        fluidRow(
            column(width = 2,
                radioButtons("DCgroupsAvailable", 
                             "Select category to group data checks:",
                             c("Darwin Core Class" = "DarwinCoreClass",
                               "Dimension" = "Dimension",
                               "Warning Type" = "Warning",
                               "Output Type" = "Output",
                               "Severity" = "Severity"),
                               "DarwinCoreClass")
            ),
            column(width = 3,
                actionButton("selectDC", "Accept Data Checks",
                                   icon = icon("check"), 
                                   width = 210,
                                   style = "color: #000000; background-color: #71a879; border-color: #091520;
                                            padding:10px; font-size:120%")
            ),
            br(), br(),
            column(12, style = "margin-bottom:10px; border-bottom:2px solid")
        ),
        br(), br(),
        fluidRow(
            uiOutput("DCgroupsCheckBox")
        ),
        uiOutput("DCcheckBoxHover")
    )
)