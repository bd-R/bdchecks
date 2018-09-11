#' Launch bdchecks Shiny Application
#'
#' `bdchecks` is a function that starts biodiversity check `shiny` app.
#' 
#' @return `shiny::runApp()` result within browser.
#' 
#' @import DT
#' @import shiny
#' @import shinyBS
#' @import shinydashboard
#' @import shinyFiles
#' 
#' @export
#' 
runbdchecks <- function() {
    pathApp <- system.file("shiny", package = "bdchecks")
    return(shiny::runApp(pathApp, launch.browser = TRUE))
}