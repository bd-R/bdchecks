#'
#' Data check order_valid Check if order was found as a value at the rank of
#' order by the specified source authority service.
#'
#'     This data check answers: "Is order information valid?" question.\cr
#' Data check will pass if \strong{The value for order is present and correct.}
#' and will fail if \strong{The value for order is missing or incorrect.}.\cr
#' Dimension of this data check is \strong{} and it's flagging type is:
#' \strong{FLAG}\cr Example of entries that will pass:
#' \code{order=Crocodilia}, such data check would return \code{TRUE}.\cr
#' Example of entries that will fail: \code{order=}, such data check would
#' @name dc_order_valid
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'order_valid')
#' @section samplePassData:
#' The value for order is present and correct.
#' @section sampleFailData:
#' The value for order is missing or incorrect.
#' @section targetDWCField:
#' order
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation
NULL
