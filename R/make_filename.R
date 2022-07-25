#'make_filename(year)
#'
#' @description
#'
#' takes a year value and creates a filename by concatenating "accident_%d.csv.bz2" where %d is the year.
#' First function converts input year to an integer. Then outputs a character string as the newly created
#' filename.
#'
#' Usage
#'
#' make_filename(year)
#'
#' Arguments
#'
#' @param year - calendar year to add to filename
#'
#' @returns filename as character string
#'
#' @examples
#'    make_filename(2013)
#'    make_filename(2015)
#'
#' @export
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
