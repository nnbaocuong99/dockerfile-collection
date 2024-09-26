# test_script.R

library(testthat)

# Define a simple function to test
add <- function(a, b) {
  a + b
}

# Test cases
test_that("Addition works", {
  expect_equal(add(1, 1), 2)
  expect_equal(add(-1, 1), 0)
  expect_equal(add(0, 0), 0)
})

test_that("Addition with decimals works", {
  expect_equal(add(1.5, 2.5), 4)
  expect_equal(add(0.1, 0.2), 0.3, tolerance = 1e-7)
})

# Run tests
test_results <- test_file("test_script.R")
print(test_results)

# Run tests using: Rscript test_script.R
