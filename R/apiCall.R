#' place a call to the acalog api
#'
#' @param method method used for specific requests
#'
#' @return the api payload
#' @export
#'
#' @examples
api_call <- function(method) {

  url <- "http://engineering_queensu.apis.acalog.com/"

  version <- "v1"

  format <- "xml"

  key <- Sys.getenv("ACALOG_KEY")

  glue::glue('{url}{version}/content?key={key}&format{format}&method={method}')


}
