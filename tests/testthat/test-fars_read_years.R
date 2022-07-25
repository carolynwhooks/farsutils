test_that("fars_read_years works", {
  expect_warning(fars_read_years(c(2017)),regexp=NULL)
})
