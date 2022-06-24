#'fars_map_state(state.num, year)
#'
#' @description
#'
#' input takes a state number and  a calendar year.
#' It then:
#'     generates a filename based on the year
#'     reads the data for that year from the file
#'     validates and converts the state.num to an integer
#'
#'     IF the state.num is valid it will select the state data for that year
#'     and make a data frame.
#'     IF the dataframe is empty
#'        it will stop, print a message and return NULL
#'     Otherwise:
#'        It will plot the Longitude and Latitude of accidents in the state that year
#'
#' Usage
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' fars_read_years(years)
#'
#' Arguments
#'
#' @param year - a calendar year
#'
#' @return plot of state which maps accidents for the chosen year
#'
#' @examples
#'
#' \dontrun{
#'  fars_map_state(1,2013)
#'  fars_map_state(2,2015)
#' }
#'
#' @export
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
