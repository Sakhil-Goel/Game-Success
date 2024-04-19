#### Preamble ####
# Purpose: Create a logisitc regression model on the data
# Author: Sakhil Goel
# Date: 19 April 2024
# Contact: s.goel@mail.utoronto.ca
# License: MIT
# Pre-requisites: File named analysis_data.parquet


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(dplyr)
library(arrow)
library(stringr)
library(ggplot2)

#### Read data ####
analysis_data <- read_parquet(file = "data/analysis_data/cleaned_game_data.parquet")

analysis_data <- analysis_data %>%
  mutate(
    num_genres = str_count(genres, pattern = ",") + 1,
    num_platforms = str_count(platforms, pattern = ",") + 1,
    release_year = year(as.Date(released, format = "%Y-%m-%d")),
    success = as.numeric(metacritic > 80)  # Creating a binary success variable directly
  )

# Plot distribution of number of platforms
analysis_data |>
  ggplot(aes(x = num_genres)) +
  geom_bar()

### Model data ####
first_model <- 
  stan_glm(
    success ~ num_platforms + num_genres + playtime + release_year,
    family = binomial(link = "logit"),  # Use logistic regression
    data = analysis_data,
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 123
    )

# Summary of the model
print(summary(model))


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


