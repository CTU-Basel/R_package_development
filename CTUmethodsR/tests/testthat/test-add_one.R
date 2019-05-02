context("adding one")
 
test_that("Ones added as expected.", {
  expect_equal(add_one(1), 2)
  expect_equal(add_one(11.1), 12.1)
  expect_equal(add_one(1336), 1337)
})

test_that("Errored as expected.", {
  expect_error(add_one("Astring"))
})
