fluidPage(
    titlePanel("Upload Data"),
    sidebarLayout(
        sidebarPanel(
            fileInput("pathInput", "Choose File"),
            actionButton("acceptFile", "Accepth File")
    ),
    mainPanel(
        DT::dataTableOutput('contents')
    )
  )
)