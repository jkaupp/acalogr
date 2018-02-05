#' get a tidy tibble listing the available Calendars on acalog
#'
#' @return tidy tibble of calendars and calendar ids
#' @export
#'
#' @examples
getCalendars <- function() {

  content <- api_call("getCatalogs") %>%
    httr::GET() %>%
    httr::content(as = "parsed") %>%
    xml2::xml_children()

  tibble::tibble(
    "calendar_id" = purrr::discard(gsub("[^0-9]", "", xml2::xml_attr(content, "id")), is.na),
    "calendar_name" = xml2::xml_find_all(content, "a:title") %>%
      xml2::xml_text()) %>%
    dplyr::arrange(.data$calendar_id)

}


