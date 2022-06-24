#'fars_summarize_years(years)
#'
#' @description
#' takes a vector of calendar years. For each year that exists in the vector a summary of its
#' data is generated.
#'
#' Usage
#'
#' @importFrom dplyr bind_rows group_by summarize
#' @importFrom tidyr spread
#'
#' fars_summarize_years(years)
#'
#' Arguments
#'
#' @param years - a vector of calendar years
#'
#' @return summaries of the yearly data for each month
#'
#' @examples
#' \dontrun{
#'    fars_summarize_years(c(2013,2014,2015))
#' }
#' @
#' @export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
