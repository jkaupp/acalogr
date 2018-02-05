#' get a tidy tibble listing the available Calendars on acalog
#'
#'
#' @return
#' @export
#'
#' @examples
getCalendars <- function() {

  url <- "http://engineering_queensu.apis.acalog.com/"

  version <- "v1"

  key <- "fedaf84c6f7c3620cda9a8b5f17a30d3540a7536"

  format <- "xml"

  method <- "getCatalogs"

  full_url <- glue::glue('{url}{version}/content?key={key}&format{format}&method={method}')

  resp <- httr::GET(full_url)

  content <- httr::content(resp, as = "parsed") %>%
    xml_children()


  tibble::tibble(
    "calendar_id" = purrr::discard(gsub("[^0-9]", "", xml2::xml_attr(content, "id")),is.na),
    "calendar_name" = xml_find_all(content, "a:title") %>%
      xml_text()) %>%
    dplyr::arrange(calendar_id)


}


