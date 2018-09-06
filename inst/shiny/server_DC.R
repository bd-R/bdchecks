library(bdchecks)
DCgroups <- reactive({
    # All available data checks
    DCall <- ls(pos = ("package:bdchecks"), pattern = "^DC_")
    # Add data check group (user specified category) to it's name
    DCgroup <- lapply(DCall, function(x) {
        meta <- `@`(get(x), meta)
        if (input$DCgroupsAvailable == "DarwinCoreClass") {
            data.frame(DC = x, group = gsub("_", " ", meta@description$DarwinCoreClass))
        } else {
            data.frame(DC = x, group = gsub("_", " ", meta@flags[[input$DCgroupsAvailable]]))
        }
    })
    DCgroup <- do.call(rbind, DCgroup)
    DCgroup$DC <- sub("^DC_", "", DCgroup$DC)
    DCgroup
})

# Extract all available checkbox IDs
DCcheckBox <- reactive({
    paste0("DC_chck_", unique(DCgroups()$group))
})
DCselected <- reactive({
    result <- c()
    for(i in DCcheckBox()) {
        result <- c(result, input[[i]])
    }
    result
})
output$DCgroupsCheckBox <- renderUI({
    result <- list()
    # Create chech box for each group
    for (i in unique(DCgroups()$group)) {
        RAW <- checkboxGroupInput(paste0("DC_chck_", i), 
                                  i, 
                                  subset(DCgroups(), group == i)$DC)

        for(i in subset(DCgroups(), group == i)$DC) {
            RAW <- gsub(paste0('<span>', i, '</span>'), 
                        paste0('<span id="DC_', i, '">', i, '</span>'), 
                        RAW)
        }
        result[[i]] <- column(2, HTML(RAW))
    }
    result
})

output$selected_DC <- renderText({
    DCselected()
})

createHoverText <- function(object) {
      object@meta@description$Main
}
hoverInfo <- eventReactive(input$DCgroupsAvailable, {
    DCall <- ls(pos = ("package:bdchecks"), pattern = "^DC_")
    result <- list()
    for(i in DCall) {
        result[[i]] <- bsTooltip(i, createHoverText(get(i)), "top", "hover")
    }
    do.call(tagList, result)
})
output$DCcheckBoxHover <- renderUI({
    hoverInfo()
})

observeEvent(input$selectDC, {
    updateTabItems(session, "myTabs", "filtering")
})