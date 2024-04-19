#### Preamble ####
# Purpose: Tests the cleaned data
# Author: Sakhil Goel
# Date: 19 April 2024
# Contact: s.goel@mail.utoronto.ca
# License: MIT
# Pre-requisites: File named cleaned_game_data.parquet


#### Workspace setup ####
library(tidyverse)
library(testthat)

game_data <- read_parquet(here::here("data/analysis_data/cleaned_game_data.parquet"))

#### Test data ####

# Test for No Missing Values
test_that("data has no missing values", {
  expect_true(all(!is.na(game_data)))
})

# Test for Expected Number of Rows and Columns
test_that("data has the correct dimensions", {
  expect_equal(nrow(game_data), 1180)
  expect_equal(ncol(game_data), 6)
})

# Test for Correct Data Types
test_that("data types are correct", {
  expect_is(game_data$platforms, "numeric")
  expect_is(game_data$playtime, "numeric")
  expect_is(game_data$released, "numeric")
  expect_is(game_data$metacritic, "numeric")
  expect_is(game_data$name, "character")
})

# Test for Non-Negative Values
test_that("no negative values in playtime and platforms", {
  expect_true(all(game_data$playtime >= 0))
  expect_true(all(game_data$platforms >= 0))
})

# Test for Date Ranges
test_that("release dates are within the expected range", {
  expect_true(all(game_data$released >= 1994 & game_data$released <= 2023))
})

# Test for Duplicate Rows
test_that("data contains no duplicate rows", {
  expect_equal(nrow(game_data), nrow(unique(game_data)))
})

