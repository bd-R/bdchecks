#' Launch bdchecks Shiny Application
#'
#' `bdchecks` is a function that starts biodiversity check `shiny` app.
#' 
#' @return `shiny::runApp()` result within browser.
#' 
#' @import shiny
#' @import shiny
#' @import shinyBS
#' @import shinydashboard
#' @importFrom DT datatable 
#' @importFrom rgbif occ_search
#' @importFrom spocc occ
#' 
#' @export
#' 
runbdchecks <- function() {
    pathApp <- system.file("shiny", package = "bdchecks")
    return(shiny::runApp(pathApp, launch.browser = TRUE))
}