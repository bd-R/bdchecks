options(shiny.maxRequestSize = 50 * 1024 ^ 2)
rv <- reactiveValues(
    dataOriginal = data.frame()
)

dataLoadedTask <- function(data) {
    output$contents <- DT::renderDataTable(DT::datatable({
        summarizeDataframe(data)
    }, options = list(scrollX = TRUE)))
}

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

observeEvent(input$pathInput, {
    withProgress(message = paste("Reading", input$pathInput$name, "..."), {
        if (is.null(input$pathInput)) {
            return("No data to view")
        }
        if (grepl("zip", tolower(input$pathInput$type))) {
            message("Reading DWCA ZIP...")
            rv$dataOriginal <- finch::dwca_read(input$pathInput$datapath, read = TRUE)$data[[1]]
        } else {
            rv$dataOriginal <- data.table::fread(input$pathInput$datapath, data.table = FALSE)
        }
    })
})

observeEvent(input$queryDatabase, {
    withProgress(message = paste("Querying", input$queryDB, "..."), {
        if (input$queryDB == "gbif") {
            rv$dataOriginal <- rgbif::occ_search(
                    scientificName = input$scientificName,
                    limit = input$recordSize,
                    hasCoordinate = switch(input$hasCoords,
                                           "1" = TRUE,
                                           "2" = FALSE,
                                           "3" = NULL
                   )
            )$data
        } else {
            warnings <- capture.output(
                data <- spocc::occ(
                            query = input$scientificName,
                            from = input$queryDB,
                            limit = input$recordSize,
                            has_coords = switch(input$hasCoords,
                                                "1" = TRUE,
                                                "2" = FALSE,
                                                "3" = NULL
                            )
                        ),
                type = "message"
            )
            if (length(warnings) > 0) {
                showNotification(paste(warnings, collapse = " "),
                                 duration = 6)
            }
            rv$dataOriginal <- data[[input$queryDB]]$data[[1]]
        }
    })
})

observe({
    darwinizer <- bdDwC::darwinizeNames(rv$dataOriginal, bdDwC:::dataDarwinCloud$data)
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
    if (nrow(rv$dataOriginal) > 0) {
        shinyjs::enable("acceptFile") 
    }
})

observeEvent(input$acceptFile, {
    updateTabItems(session, "myTabs", "datachecks")
})