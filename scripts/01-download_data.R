#### Preamble ####
# Purpose: Downloads data from the RAWG API into a dataset
# Author: Sakhil Goel
# Date: 19 April 2024
# Contact: s.goel@mail.utoronto.ca
# License: MIT
# Pre-requisites: A rawg.io account for an API key


#### Workspace setup ####
library(httr)
library(jsonlite)
library(dplyr)
library(tidyverse)
library(arrow)
# [...UPDATE THIS...]

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]
# Set API Key and base URL
api_key <- "1cc3d3380bcc4835b4989f5a0e241499"
base_url <- "https://api.rawg.io/api/games"

# Initialize variables for pagination
page_size <- 40  # Number of games per page
total_pages <- 35  # Total number of pages to fetch
current_page <- 1  # Start from the first page

# Create an empty data frame to store all games
game_data <- data.frame()

# Loop through each page and fetch data
while (current_page <= total_pages) {
  # API URL for fetching game data with pagination
  url <- paste0("https://api.rawg.io/api/games?key=", api_key, "&page_size=", page_size, "&page=", current_page)
  
  # Make the API request
  response <- GET(url)
  
  # Check if the request was successful
  if (status_code(response) == 200) {
    data <- content(response, "parsed")
    
    # Extract game data and add to the data frame
    df_games <- do.call(rbind, lapply(data$results, function(x) data.frame(
      name = x$name,
      released = x$released,
      rating = ifelse(is.null(x$rating), NA, x$rating),
      platforms = toString(sapply(x$platforms, function(p) p$platform$name)),
      genres = toString(sapply(x$genres, function(g) g$name)),
      metacritic = ifelse(is.null(x$metacritic), NA, x$metacritic),
      playtime = ifelse(is.null(x$playtime), NA, x$playtime)
      #esrb_rating = ifelse(is.null(x$esrb_rating), NA, x$esrb_rating$rating_slug)
    )))
    
    # Combine current page data with the previous pages
    game_data <- rbind(game_data, df_games)
    
    # Increment page number
    current_page <- current_page + 1
  } else {
    # Print error message if the request failed
    print(paste("Failed to fetch data on page ", current_page, ": ", status_code(response)))
    break
  }
}

# Write to Parquet file
write.csv(game_data, "data/raw_data/game_data.csv")


#games_clean <- games_df %>%
#  select(name, released, rating, platforms, genres) %>%
#  filter(!is.na(rating))  # Filter out games without ratings

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.


         
