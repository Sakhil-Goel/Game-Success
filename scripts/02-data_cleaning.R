#### Preamble ####
# Purpose: Cleans the downloaded data
# Author: Sakhil Goel
# Date: 19 April 2024
# Contact: s.goel@mail.utoronto.ca
# License: MIT
# Pre-requisites: File named game_data.csv

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_csv("data/raw_data/game_data.csv")

cleaned_data <- raw_data %>%
  filter(!is.na(metacritic)) %>%
  mutate(
    platforms = str_count(platforms, pattern = ",") + 1,
    released = year(as.Date(released, format = "%Y-%m-%d")),
  )
#### Save data ####
write.csv(cleaned_data, "data/analysis_data/cleaned_game_data.csv")
write_parquet(cleaned_data, "data/analysis_data/cleaned_game_data.parquet")
