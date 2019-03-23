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
#' @importFrom data.table fread
#' @importFrom DT datatable
#' @importFrom finch dwca_read
#' @importFrom rgbif occ_search
#' @importFrom shinyjs enable disabled useShinyjs
#' @importFrom spocc occ
#'
#' @export
#'
run_bdchecks <- function() {
  path_app <- system.file("shiny", package = "bdchecks")
  return(shiny::runApp(path_app, launch.browser = TRUE))
}