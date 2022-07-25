test_that("fars_summarize_years works", {
  expect_error(fars_summarize_years(c(2017)),regexp=NULL)
})

