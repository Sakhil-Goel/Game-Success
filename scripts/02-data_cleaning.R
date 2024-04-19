#### Preamble ####
# Purpose: Cleans the downloaded data
# Author: Sakhil Goel
# Date: 19 April 2024
# Contact: s.goel@mail.utoronto.ca
# License: MIT
# Pre-requisites: File named game_data.parquet

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_csv("data/raw_data/game_data.csv")

cleaned_data <- game_data %>%
  filter(!is.na(rating) & !is.na(metacritic))

#### Save data ####
write_parquet(cleaned_data, "data/analysis_data/analysis_data.parquet")
