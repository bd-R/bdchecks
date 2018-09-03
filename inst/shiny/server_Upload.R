options(shiny.maxRequestSize = 50 * 1024 ^ 2)
rv <- reactiveValues(
    dataOriginal = data.frame()
)

summarizeDataframe <- function(data) {
    if (nrow(data) == 0) {
        return(data)
    }
    tempData <- as.data.frame(data)
    tempData <-
        tempData[, names(tempData) %in% c(
            "scientificName",
            "taxonRank",
            "eventDate",
            "country",
            "decimalLatitude",
            "decimalLongitude"
        )]
    tempData <- cbind(tempData, data)
    
    hidingCols <- c()
    tempData[] <- lapply(tempData, as.character)
    
    for (i in 1:length(names(tempData))) {
        sample <-
            sample(1:nrow(tempData), size = ifelse(nrow(tempData) > 1000, 1000, nrow(tempData)))
        f <-
            mean(sapply(tempData[sample, i], function(x)
                nchar(x)), na.rm = T)
        
        if (!is.nan(f)) {
            if (f > 50) {
                hidingCols <- c(hidingCols, i)
            }
        }
    }
    
    if (length(hidingCols) > 0) {
        tempData <- tempData[, c(hidingCols * -1)]
    }
    tempData
}

dataLoadedTask <- function(data) {
    output$contents <- DT::renderDataTable(DT::datatable({
        summarizeDataframe(data)
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
        rv$dataOriginal <- data.table::fread(input$pathInput$datapath, 
                                          data.table = FALSE)
    })
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
})

observe({
    darwinizer <- bdDwC::darwinizeNames(rv$dataOriginal,  bdDwC:::dataDarwinCloud$data)
    fixed <- darwinizer[darwinizer$matchType == "Darwinized", ]
    if (nrow(fixed) > 0) {
        rv$dataOriginal <- bdDwC::renameUserData(rv$dataOriginal, darwinizer)
                showNotification(paste(
            "Converted Columns:",
            paste(
                paste(fixed[, 1], collapse = ", "),
                paste(fixed[, 2], collapse = ", "),
                sep = " -> "
            )
        ),
        duration = 7)
    }
    dataLoadedTask(rv$dataOriginal)
})

observeEvent(input$acceptFile, {
    updateTabItems(session, "myTabs", "datachecks")
})