dc_groups <- shiny::reactive({
  # All available data checks
  # Safe way to retun all available DC's as other packages might also have
  # variable with `^DC_`
  dc_return <- function() {
      library(bdchecks)
      ls(pos = ("package:bdchecks"), pattern = "^DC_")
  }
  dc_all <- dc_return()
  # Add data check group (user specified category) to it's name
  dc_group <- lapply(dc_all, function(x) {
    meta <- `@`(get(x), meta)
    if (input$dc_groups_vailable == "DarwinCoreClass") {
      data.frame(
        DC = x,
        group = gsub("_", " ", meta@description$DarwinCoreClass)
      )
    } else {
      data.frame(
        DC = x,
        group = gsub("_", " ", meta@flags[[input$dc_groups_vailable]])
      )
    }
  })
  dc_group <- do.call(rbind, dc_group)
  dc_group$DC <- sub("^DC_", "", dc_group$DC)
  dc_group
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
        paste0("<span id=\"DC_", i, "\">", i, "</span>"),
        chkbox
      )
    }
    result[[i]] <- shiny::column(2, shiny::HTML(chkbox))
  }
  result
})

output$selected_DC <- shiny::renderText({
  dc_selected()
})

create_hover_text <- function(object) {
  object@meta@description$Main
}
hover_info <- shiny::eventReactive(input$dc_groups_vailable, {
  dc_all <- ls(pos = ("package:bdchecks"), pattern = "^DC_")
  result <- list()
  for (i in dc_all) {
    result[[i]] <- shinyBS::bsTooltip(
      i,
      create_hover_text(get(i)),
      "top", "hover"
    )
  }
  do.call(shiny::tagList, result)
})
output$dc_check_box_hover <- shiny::renderUI({
  hover_info()
})

shiny::observeEvent(input$select_dc, {
  shinydashboard::updateTabItems(session, "my_tabs", "filtering")
})