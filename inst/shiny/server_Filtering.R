library(bdchecks)
library(magrittr)
DCresult <- eventReactive(input$selectDC, {
    write.csv(input$chkBoxDC, "foo.csv2")
    performDataCheck(dataOriginal(), DConly = paste0("DC_", input$chkBoxDC))})
DCresultSummary <- reactive({summary(DCresult(), fancy = FALSE, filteringDT = TRUE)})
output$tableDataChecks <- DT::renderDT(
    DCresultSummary(), 
    rownames = FALSE,
    options = list(pageLength = nrow(DCresultSummary())),
    selection = list(target = "cell"))
selectedCells <- reactive({input$tableDataChecks_cells_selected})

proxy <- dataTableProxy("tableDataChecks")
observeEvent(input$selectionToRemove, {
    cells <- 1:nrow(DCresultSummary())
    res <- NULL
    if ("Passed" %in% input$selectionToRemove) {
        res <- rbind(res, cbind(cells, 2))
    }
    if ("Failed" %in% input$selectionToRemove) {
        res <- rbind(res, cbind(cells, 3))
    }
    if ("Missing" %in% input$selectionToRemove) {
        res <- rbind(res, cbind(cells, 4))
    }
    selectCells(proxy, res)
})
observeEvent(input$DC_cellClear, {
    selectCells(proxy, NULL)
})


DCfilt <- eventReactive(input$DC_remove, {
    bdchecks:::generateDCfilts(DCresultSummary(), selectedCells())
})
dataAfter <- reactive({
    bdchecks:::filterDataCheck(DCresult(), DCfilt())
})
output$nRecordsBefore <- renderTable({
    data.frame(nRecordsBefore = nrow(dataOriginal()),
               nDataChecksBefore =  nrow(DCresultSummary()),
               nRecordsAfter = nrow(dataAfter())) 
})

output$dwnl_Data <- downloadHandler(
    filename = function() {"filteredData.csv"},
    content = function(file) {
        write.csv(dataAfter(), file, row.names = FALSE)
    }
)