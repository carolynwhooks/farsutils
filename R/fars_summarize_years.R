#'fars_summarize_years(years)
#'
#' @description
#' takes a vector of calendar years. For each year that exists in the vector a summary of its
#' data is generated.
#'
#' @importFrom magrittr %>%
#'
#' @import tidyr dplyr
#' @usage
#'
#'
#' fars_summarize_years(years)
#'
#'
#'
#' @param years - a vector of calendar years
#'
#' @return summaries of the yearly data for each month
#'
#' @examples
#'\dontrun{
#'fars_summarize_years(c(2013,2014,2015))
#'}
#'
#' @export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(.data$year, .data$MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(.data$year, n)
}
