library(bdchecks)
library(magrittr)
DCresult <- shiny::eventReactive(input$select_dc, {
    performDataCheck(rv$data_original, DConly = paste0("DC_", DCselected()))
})
dc_result_summary <- reactive({
    if (is.null(DCresult())) {
        return(NULL)
    } else {
        summary_DC(DCresult(), fancy = FALSE, filtering_dt = TRUE)
    }
})
output$table_dc <- DT::renderDT(

    dc_result_summary(),
    rownames = FALSE,
    options = list(pageLength = 100,
                   columnDefs = list(list(className = "no_select",
                                          targets = 0:1))),
    selection = list(target = "cell"),
    callback = JS("table.on('click', 'td.no_select', function() {
                     var td = $(this), row = table.row(td.closest('tr'));
                     if ($(td.node()).hasClass('selected')) {
                       $(td.node()).removeClass('selected');
                     }
                   });")
)

selected_cells <- reactive({
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
DCfilt <- shiny::eventReactive(input$DC_remove, {
    if (is.null(dc_result_summary())) {
        return(NULL)
    } else {
        bdchecks:::generateDCfilts(dc_result_summary(), selected_cells())
    }
})
observe({
    if (is.null(DCresult()) | is.null(DCfilt())) {
        rv2$data_after <- rv$data_original
    } else {
        rv2$data_after <- bdchecks:::filterDataCheck(DCresult(), DCfilt())
    }
})
output$vb_n_records1 <- shinydashboard::renderValueBox({
    shinydashboard::valueBox(nrow(rv$data_original),
                             "Records Submitted",
                             color = "aqua")
})
output$vb_n_records2 <- shinydashboard::renderValueBox({
    shinydashboard::valueBox(nrow(rv2$data_after),
                             "Records After Filtering",
                             color = "light-blue")
})
output$vb_n_dc <- shinydashboard::renderValueBox({
    shinydashboard::valueBox(nrow(dc_result_summary()),
                             "Data Checks Performed",
                             color = "olive")
})

output$dwnl_Data <- shiny::downloadHandler(
    filename = function() {
        format(Sys.time(), "filteredData_%Y_%b_%d_%X.csv")
    },
    content = function(file) {
        write.csv(rv2$data_after, file, row.names = FALSE)
    }
)