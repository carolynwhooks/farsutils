test_that("fars_map_state works", {
  expect_error(fars_map_state(1,2017),regexp = NULL)
})

