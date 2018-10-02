#' Launch bdchecks Shiny Application
#'
#' `bdchecks` is a function that starts biodiversity check `shiny` app.
#' 
#' @return `shiny::runApp()` result within browser.
#' 
#' @import bdDwC
#' @import shiny
#' @import shinyBS
#' @import shinydashboard
#' @import shinyjs
#' @importFrom data.table fread
#' @importFrom DT datatable 
#' @importFrom finch dwca_read
#' @importFrom rgbif occ_search
#' @importFrom spocc occ
#' 
#' @export
#' 
runbdchecks <- function() {
    pathApp <- system.file("shiny", package = "bdchecks")
    return(shiny::runApp(pathApp, launch.browser = TRUE))
}