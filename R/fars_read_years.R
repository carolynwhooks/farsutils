#'fars_read_years(years)
#'
#' @description
#'
#' takes a vector of calendar years. For each year in the vector a dataframe is created for those that have data.
#' If data is not found for a particular year NULL is returned and a warning message is printed
#'
#' @importFrom magrittr %>%
#'
#' @import dplyr
#' @usage
#'
#'
#' fars_read_years(years)
#'
#'
#'
#' @param years - a vector of calendar years
#'
#' @return dataframe or NULL value
#'
#' @examples
#'\dontrun{
#'   testyears <- c(2013,2014)
#'   fars_read_years(testyears)
#'}
#'
#' @export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
        dplyr::mutate(dat, year = year) %>%
        dplyr::select(.data$MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}

