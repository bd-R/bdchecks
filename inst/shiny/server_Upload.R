dataOriginal <- reactive({
    if (is.null(input$pathInput)) {
        return(NULL)
    }
    as.data.frame(data.table::fread(input$pathInput$datapath))
})
output$contents <- DT::renderDataTable({
    DT::datatable(head(dataOriginal()))
})