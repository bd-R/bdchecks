rv <- reactiveValues(
    dataOriginal = data.frame()
)
dataLoadedTask <- function(data) {
    showNotification("Read Data Succesfully", duration = 2)
    output$contents <- DT::renderDataTable(DT::datatable({
        head(data)
    }, options = list(scrollX = TRUE)))
    # output$dataOriginalRows <- renderText(nrow(data))
    # output$dataOriginalColumns <- renderText(length(data))
    # output$dataOriginalSpecies <-
    #     renderText(length(unique(data$scientificName)))
}
observeEvent(input$pathInput, {
    withProgress(message = paste("Loading", input$pathInput, "..."), {
        if (is.null(input$pathInput)) {
            return(NULL)
        }
        dataOriginal <- data.table::fread(input$pathInput$datapath, 
                                          data.table = FALSE)
    })
    dataLoadedTask(dataOriginal)
})
observeEvent(input$queryDatabase, {
    dataTMP <- list()
    for(i in input$queryDB[1]) {
        withProgress(message = paste("Querying", i, "..."), {
            dataTMP[[i]] <- spocc::occ(input$scientificName, i,
                                       input$recordSize)[[i]]$data[[1]]
        })
    }
    rv$dataOriginal <- do.call(rbind, dataTMP)
    dataLoadedTask(rv$dataOriginal)
})