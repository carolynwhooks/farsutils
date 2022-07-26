
<!-- README.md is generated from README.Rmd. Please edit that file -->

# farsutils

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/carolynwhooks/farsutils.svg?branch=main)](https://travis-ci.com/carolynwhooks/farsutils)
[![R-CMD-check](https://github.com/carolynwhooks/farsutils/workflows/R-CMD-check/badge.svg)](https://github.com/carolynwhooks/farsutils/actions)
<!-- badges: end -->

The goal of farsutils is to provide utilities to read, summarize and
plot accident data from yearly accident data the Highway Traffic Safety
Adminitration Fatality Analysis Reporting System FARS.

## Installation

You can install the development version of farsutils like so:

``` r
install_github("carolynwhooks/farsutils")
```

## Example

This is a basic example which shows you how to solve a common problem: -
Reading in sample data included with the package

``` r
suppressPackageStartupMessages(library(farsutils))
## Reading in sample data included with the package
fileName <- system.file("extdata","accident_2013.csv.bz2",package="farsutils")
data2013 <- fars_read(fileName)
head(data2013,2)
#> # A tibble: 2 × 50
#>   STATE ST_CASE VE_TOTAL VE_FORMS PVH_INVL  PEDS PERNOTMVIT PERMVIT PERSONS
#>   <dbl>   <dbl>    <dbl>    <dbl>    <dbl> <dbl>      <dbl>   <dbl>   <dbl>
#> 1     1   10001        1        1        0     0          0       8       8
#> 2     1   10002        2        2        0     0          0       2       2
#> # … with 41 more variables: COUNTY <dbl>, CITY <dbl>, DAY <dbl>, MONTH <dbl>,
#> #   YEAR <dbl>, DAY_WEEK <dbl>, HOUR <dbl>, MINUTE <dbl>, NHS <dbl>,
#> #   ROAD_FNC <dbl>, ROUTE <dbl>, TWAY_ID <chr>, TWAY_ID2 <chr>, MILEPT <dbl>,
#> #   LATITUDE <dbl>, LONGITUD <dbl>, SP_JUR <dbl>, HARM_EV <dbl>,
#> #   MAN_COLL <dbl>, RELJCT1 <dbl>, RELJCT2 <dbl>, TYP_INT <dbl>,
#> #   WRK_ZONE <dbl>, REL_ROAD <dbl>, LGT_COND <dbl>, WEATHER1 <dbl>,
#> #   WEATHER2 <dbl>, WEATHER <dbl>, SCH_BUS <dbl>, RAIL <chr>, NOT_HOUR <dbl>, …
```
