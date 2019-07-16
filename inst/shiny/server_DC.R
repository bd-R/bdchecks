dc_groups <- shiny::reactive({
  # Add data check group (user specified category) to it's name
  dc_group <- lapply(bdchecks:::data.checks@dc_body, function(x) {
    if (input$dc_groups_vailable == "DarwinCoreClass") {
      data.frame(
        DC = x@name,
        group = gsub("_", " ", x@description$DarwinCoreClass)
      )
    } else {
      data.frame(
        DC = x@name,
        group = gsub("_", " ", x@flags[[input$dc_groups_vailable]])
      )
    }
  })
  do.call(rbind, dc_group)
})

# Extract all available checkbox IDs
dc_check_box <- shiny::reactive({
  paste0("DC_chck_", unique(dc_groups()$group))
})
dc_selected <- shiny::reactive({
  result <- c()
  for (i in dc_check_box()) {
    result <- c(result, input[[i]])
  }
  result
})
output$dc_groups_check_box <- shiny::renderUI({
  result <- list()
  # Create chech box for each group
  for (i in unique(dc_groups()$group)) {
    chkbox <- shiny::checkboxGroupInput(
      paste0("DC_chck_", i),
      i,
      subset(dc_groups(), group == i)$DC
    )

    for (i in subset(dc_groups(), group == i)$DC) {
      chkbox <- gsub(
        paste0("<span>", i, "</span>"),
        paste0("<span id=\"", i, "\">", i, "</span>"),
        chkbox
      )
    }
    result[[i]] <- shiny::column(2, shiny::HTML(chkbox))
  }
  result
})

hover_info <- shiny::eventReactive(input$dc_groups_vailable, {
  output$dc_check_box_hover <- shiny::renderUI({
    result <- lapply(bdchecks:::data.checks@dc_body, function(x) {
      shinyBS::bsTooltip(x@name, x@description$Main, "top", "hover")
    })
    do.call(shiny::tagList, result)
  })
})

shiny::observeEvent(input$select_dc, {
  shinydashboard::updateTabItems(session, "my_tabs", "filtering")
})