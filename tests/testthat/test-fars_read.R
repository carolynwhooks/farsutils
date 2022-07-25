test_that("fars_read works", {
  expect_error(fars_read(2013,object=data.frame))
})
