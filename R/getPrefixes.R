
getPrefixes <- function(calendar_id) {

  content <- api_call("getPrefixes") %>%
    glue::glue("&catalog={calendar_id}") %>%
    httr::GET() %>%
    httr::content(as = "parsed") %>%
    xml2::xml_children() %>%
    xml2::xml_text() %>%
    purrr::discard(~grepl("success", .x))


  tibble::tibble(
    "calendar_id" = calendar_id,
    "course_prefix" = content)

}
