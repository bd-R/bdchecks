dc_result <- shiny::eventReactive(input$select_dc, {
  bdchecks::perform_dc(rv$data_original, dc_selected())
})
dc_result_summary <- shiny::reactive({
  if (is.null(dc_result())) {
    return(NULL)
  } else {
    bdchecks::dc_summary(dc_result(), fancy = FALSE, filtering_dt = TRUE)
  }
})
output$table_dc <- DT::renderDT(
  dc_result_summary(),
  rownames = FALSE,
  options = list(
    pageLength = 100,
    columnDefs = list(list(
      className = "no_select",
      targets = 0:1
    ))
  ),
  selection = list(target = "cell"),
  callback = DT::JS("table.on('click', 'td.no_select', function() {
    var td = $(this), row = table.row(td.closest('tr'));
    if ($(td.node()).hasClass('selected')) {
      $(td.node()).removeClass('selected');
    }});"
  )
)
selected_cells <- shiny::reactive({
  input$table_dc_cells_selected
})
proxy <- DT::dataTableProxy("table_dc")
shiny::observeEvent(input$selection_to_remove, {
  cells <- 1:nrow(dc_result_summary())
  res <- NULL
  if ("All Passed" %in% input$selection_to_remove) {
    res <- rbind(res, cbind(cells, 2))
  }
  if ("All Failed" %in% input$selection_to_remove) {
    res <- rbind(res, cbind(cells, 3))
  }
  if ("All Missing" %in% input$selection_to_remove) {
    res <- rbind(res, cbind(cells, 4))
  }
  DT::selectCells(proxy, res)
})
rv2 <- shiny::reactiveValues(
  data_after = data.frame()
)
shiny::observeEvent(input$dc_cell_clear, {
  DT::selectCells(proxy, NULL)
})
dc_filt <- shiny::eventReactive(input$dc_remove, {
  if (is.null(dc_result_summary())) {
    return(NULL)
  } else {
    bdchecks:::dc_filter_generate(dc_result_summary(), selected_cells())
  }
})
shiny::observe({
  if (is.null(dc_result()) | is.null(dc_filt())) {
    rv2$data_after <- rv$data_original
  } else {
    rv2$data_after <- bdchecks:::dc_filter(dc_result(), dc_filt())
  }
})
output$vb_n_records1 <- shinydashboard::renderValueBox({
  shinydashboard::valueBox(nrow(rv$data_original),
    "Records Submitted",
    color = "aqua"
  )
})
output$vb_n_records2 <- shinydashboard::renderValueBox({
  shinydashboard::valueBox(nrow(rv2$data_after),
    "Records After Filtering",
    color = "light-blue"
  )
})
output$vb_n_dc <- shinydashboard::renderValueBox({
  shinydashboard::valueBox(nrow(dc_result_summary()),
    "Data Checks Performed",
    color = "olive"
  )
})
output$dwnl_Data <- shiny::downloadHandler(
  filename = function() {
    format(Sys.time(), "filteredData_%Y_%b_%d_%X.csv")
  },
  content = function(file) {
    write.csv(rv2$data_after, file, row.names = FALSE)
  }
)