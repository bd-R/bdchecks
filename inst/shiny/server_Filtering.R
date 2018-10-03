library(bdchecks)
library(magrittr)
DCresult <- eventReactive(input$selectDC, {
    performDataCheck(rv$dataOriginal, DConly = paste0("DC_", DCselected()))
})
DCresultSummary <- reactive({
    if (is.null(DCresult())) {
        return(NULL)
    } else {
        summary_DC(DCresult(), fancy = FALSE, filteringDT = TRUE)
    }
})
output$tableDataChecks <- DT::renderDT(

    DCresultSummary(),
    rownames = FALSE,
    options = list(pageLength = 100,
                   columnDefs = list(list(className = "no_select", targets = 0:1))),
    selection = list(target = "cell"),
    callback = JS("table.on('click', 'td.no_select', function() {
                     var td = $(this), row = table.row(td.closest('tr'));
                     if ($(td.node()).hasClass('selected')) {
                       $(td.node()).removeClass('selected');
                     }
                   });")
)

selectedCells <- reactive({input$tableDataChecks_cells_selected})

proxy <- dataTableProxy("tableDataChecks")
observeEvent(input$selectionToRemove, {
    cells <- 1:nrow(DCresultSummary())
    res <- NULL
    if ("All Passed" %in% input$selectionToRemove) {
        res <- rbind(res, cbind(cells, 2))
    }
    if ("All Failed" %in% input$selectionToRemove) {
        res <- rbind(res, cbind(cells, 3))
    }
    if ("All Missing" %in% input$selectionToRemove) {
        res <- rbind(res, cbind(cells, 4))
    }
    selectCells(proxy, res)
})
rv2 <- reactiveValues(
    dataAfter = data.frame()
)
observeEvent(input$DC_cellClear, {
    selectCells(proxy, NULL)
})
DCfilt <- eventReactive(input$DC_remove, {
    if (is.null(DCresultSummary())) {
        return(NULL)
    } else {
        bdchecks:::generateDCfilts(DCresultSummary(), selectedCells())
    }
})
observe({
    if (is.null(DCresult()) | is.null(DCfilt())) {
        rv2$dataAfter <- rv$dataOriginal
    } else {
        rv2$dataAfter <- bdchecks:::filterDataCheck(DCresult(), DCfilt())
    }
})
output$vb_nRecords1 <- renderValueBox({
    valueBox(nrow(rv$dataOriginal),
             "Records Submitted", 
             color = "aqua")
})
output$vb_nRecords2 <- renderValueBox({
    valueBox(nrow(rv2$dataAfter),
             "Records After Filtering", 
             color = "light-blue")
})
output$vb_nDC1 <- renderValueBox({
    valueBox(nrow(DCresultSummary()),
             "Data Checks Performed", 
             color = "olive")
})

output$dwnl_Data <- downloadHandler(
    filename = function() {format(Sys.time(), "filteredData_%Y_%b_%d_%X.csv")},
    content = function(file) {
        write.csv(rv2$dataAfter, file, row.names = FALSE)
    }
)