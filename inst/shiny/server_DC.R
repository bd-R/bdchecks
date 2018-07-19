library(bdchecks)
DCgroups <- reactive({
    # All available data checks
    DCall <- ls(pos = ("package:bdchecks"), pattern = "^DC_")
    # Add data check group (user specified category) to it's name
    DCgroup <- lapply(DCall, function(x) {
        meta <- `@`(get(x), meta)
        if (input$DCgroupsAvailable == "DarwinCoreClass") {
            data.frame(DC = x, group = meta@description$DarwinCoreClass)
        } else {
            data.frame(DC = x, group = meta@flags[[input$DCgroupsAvailable]])
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
    saveRDS(result, "foo.RDS")
    result
})
output$DCgroupsCheckBox <- renderUI({
    result <- list()
    # Create chech box for each group
    for (i in unique(DCgroups()$group)) {
        result[[i]] <- checkboxGroupInput(paste0("DC_chck_", gsub(" ", "_", i)), 
                                          gsub(" ", "_", i), 
                                          subset(DCgroups(), group == i)$DC)
    }
    result
})

output$selected_DC <- renderText({
    DCselected()
})