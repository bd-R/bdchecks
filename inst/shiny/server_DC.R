library(bdchecks)
DCall <- ls(pos = ("package:bdchecks"), pattern = "^DC_")
output$selected_DC <- renderText({ 
    length(DCall)
})

dsnames <- gsub("DC_", "", DCall)
cb_options <- list()
cb_options[dsnames] <- dsnames
updateCheckboxGroupInput(session, "chkBoxDC",
                   label = "Select Data Checks:",
                   choices = cb_options,
                   selected = "")

output$txt <- renderText({
    saveRDS(input$chkBoxDC, "~/Desktop/a.RDS")
    icons <- paste(input$chkBoxDC, collapse = ", ")
    paste("You chose", icons)
  })