#'fars_read_years(years)
#'
#' @description
#'
#' takes a vector of calendar years. For each year in the vector a dataframe is created for those that have data.
#' If data is not found for a particular year NULL is returned and a warning message is printed
#'
#' Usage
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#'
#' fars_read_years(years)
#'
#' Arguments
#'
#' @param years - a vector of calendar years
#'
#' @return dataframe or NULL value
#'
#' @examples
#' \dontrun{
#'   fars_read_years(c(2013,2014,2015))
#'  }
#'
#' @export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}

