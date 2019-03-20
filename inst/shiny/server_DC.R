library(bdchecks)
DCgroups <- reactive({
    # All available data checks
    DCall <- ls(pos = ("package:bdchecks"), pattern = "^DC_")
    # Add data check group (user specified category) to it's name
    DCgroup <- lapply(DCall, function(x) {
        meta <- `@`(get(x), meta)
        if (input$dc_groups_vailable == "DarwinCoreClass") {
            data.frame(DC = x,
                       group = gsub("_", " ",
                                    meta@description$DarwinCoreClass))
        } else {
            data.frame(DC = x,
                       group = gsub("_", " ",
                                    meta@flags[[input$dc_groups_vailable]]))
        }
    })
    DCgroup <- do.call(rbind, DCgroup)
    DCgroup$DC <- sub("^DC_", "", DCgroup$DC)
    DCgroup
})

# Extract all available checkbox IDs
dc_check_box <- reactive({
    paste0("DC_chck_", unique(DCgroups()$group))
})
DCselected <- reactive({
    result <- c()
    for (i in dc_check_box()) {
        result <- c(result, input[[i]])
    }
    result
})
output$dc_groups_check_box <- shiny::renderUI({
    result <- list()
    # Create chech box for each group
    for (i in unique(DCgroups()$group)) {
        RAW <- shiny::checkboxGroupInput(paste0("DC_chck_", i),
                                         i,
                                         subset(DCgroups(), group == i)$DC)

        for (i in subset(DCgroups(), group == i)$DC) {
            RAW <- gsub(paste0("<span>", i, "</span>"),
                        paste0("<span id=\"DC_", i, "\">", i, "</span>"),
                        RAW)
        }
        result[[i]] <- column(2, HTML(RAW))
    }
    result
})

output$selected_DC <- shiny::renderText({
    DCselected()
})

create_hover_text <- function(object) {
      object@meta@description$Main
}
hover_info <- shiny::eventReactive(input$dc_groups_vailable, {
    DCall <- ls(pos = ("package:bdchecks"), pattern = "^DC_")
    result <- list()
    for (i in DCall) {
        result[[i]] <- shinyBS::bsTooltip(i,
                                          create_hover_text(get(i)),
                                          "top", "hover")
    }
    do.call(shiny::tagList, result)
})
output$dc_check_box_hover <- shiny::renderUI({
    hover_info()
})

shiny::observeEvent(input$select_dc, {
    shinydashboard::updateTabItems(session, "myTabs", "filtering")
})