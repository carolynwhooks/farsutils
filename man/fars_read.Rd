% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fars_read.R
\name{fars_read}
\alias{fars_read}
\title{fars_read(filename)}
\format{
A data frame with columns:

\describe{
\item{STATE}{A value from 1 and 56.}
\item{ST`_CASE}{A 5 digit code.}
\item{VE_TOTAL}{A integer value.}
\item{VE_FORMS}{A integer value.}
\item{PVH_INVL}{A integer value.}
\item{PEDS}{A integer value.}
\item{PERNOTMVIT}{A integer value.}
\item{PERMVIT}{A integer value.}
\item{PERSONS}{A value from 0 to 999+.}
\item{COUNTY}{A value from 0 to 999.}
\item{CITY}{A value from 0 to 9999.}
\item{DAY}{A value from 1 to 31.}
\item{MONTH}{A value from 1 to 12.}
\item{YEAR}{A value from 2013 to 2015.}
\item{DAY_WEEK}{A value from 1 to 7.}}
}
\usage{
fars_read(filename)
}
\arguments{
\item{filename}{\itemize{
\item the name of the file which the data are to be read from. Each row of
the table appears as one line of the file. The file name is relative
to the working directory. Function checks to see if the file exists.
If it already exists the function will stop and print a message
stating that the file does not exist.
}}
}
\value{
dataframe object
}
\description{
Reads a file in csv format and creates a dataframe from it.
First function checks to see if the file exists, if it does not exist the function
will stop and print a message stating that the file does not exist.
}
\details{
C.W 06/15/2022
}
\examples{
\dontrun{
system.file("extdata","accident_2013.csv.bz2",package="farsutils")
fars_read("accident_2013.csv.bz2")
}

}
