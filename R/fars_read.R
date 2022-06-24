#' fars_read(filename)
#'
#' C.W 06/15/2022
#'
#'
#' @description
#'
#' Reads a file in csv format and creates a dataframe from it.
#' First function checks to see if the file exists, if it does not exist the function
#' will stop and print a message stating that the file does not exist.
#'
#' Usage
#'
#' fars_read(filename)
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' Arguments
#'
#' @param filename - the name of the file which the data are to be read from. Each row of
#'                   the table appears as one line of the file. The file name is relative
#'                   to the working directory. Function checks to see if the file exists.
#'                   If it already exists the function will stop and print a message
#'                   stating that the file does not exist.
#'
#' @returns dataframe object
#' @format A data frame with columns:
#' \describe{
#'  \item{STATE}{A value from 1 and 56.}
#'  \item{ST_CASE}{A 5 digit code.}
#'  \item{VE_TOTAL{A integer value.}
#'  \item{VE_FORMS}{A integer value.}
#'  \item{PVH_INVL}{A integer value.}
#'  \item{PEDS}{A integer value.}
#'  \item{PERNOTMVIT}{A integer value.}
#'  \item{PERMVIT}{A integer value.}
#'  \item{PERSONS}{A value from 0 to 999+ .}
#'  \item{COUNTY}{A value from 0 to 999.}
#'  \item{CITY}{A value from 0 to 9999.}
#'  \item{DAY}{A value from 1 to 31.}
#'  \item{MONTH}{A value from 1 to 12.}
#'  \item{YEAR}{A value from 2013 to 2015.}
#'  \item{DAY_WEEK}{A value from 1 to 7.}
#' }
#'
#' @examples
#'
#' \dontrun
#' {
#'    fars_read("accident_2013.csv.bz2")
#' }
#'
#' @export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
