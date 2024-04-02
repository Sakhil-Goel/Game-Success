#### Preamble ####
# Purpose: Simulates a dataset about video game sales
# Author: Sakhil Goel
# Date: 2 April 2024
# Contact: s.goel@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(knitr)

#### Simulate data ####

# Simulate sales for some video games
# Set seed for reproducibility
set.seed(123)

# Define the video game titles
game_titles <- c(
  "Grand Theft Auto 5", "Red Dead Redemption 2", "FF VII", "FF X", "Legend of Zelda: BOTW", "inFamous", "Fallout 3", 
  "Halo", "Halo 2", "Halo 3", "Super Mario 64", "Pokemon Platinum", "Pokemon Red", "Super Mario Galaxy", "Wii Sports", 
  "Persona 5", "FF VII Remake", "God of War", "Call of Duty: Black Ops", "Call of Duty: MW2", "Battlefield 3", 
  "Battlefield 5", "Rocket League", "FIFA 15", "FIFA 20", "NHL 13", "NHL 17", "Madden NFL 14", "CSGO", "The Last of Us",
  "Uncharted 2", "Uncharted 4", "Yakuza 0", "Yakuza 3", "Nier Replicant", "Nier Automata", "NBA 2K21", "NBA 2K13", 
  "Mario Kart 5", "Tomb Raider", "Crash Bandicoot", "Spyro", "Gears of War", "Assassin's Creed", "Mortal Kombat", 
  "Tekken", "Street Fighter", "Devil May Cry", "Forza", "Guitar Hero"
)

# Generate simulated game data
simulated_game_data <- tibble(
  game_title = rep(game_titles, each = 1),
  release_year = sample(1995:2023, length(game_titles), replace = TRUE),
  console = sample(c("PS4", "PS3", "Nintendo 64", "XB One", "XB 360", "Wii", "Nintendo Switch", "PC"),
                   length(game_titles), replace = TRUE),
  genre = sample(c("FPS", "JRPG", "Action", "Adventure", "Sports", "Fighting", "RPG", "Action-Adventure", "Platform"),  
                 length(game_titles), replace = TRUE),
  critic_score = round(runif(length(game_titles), min = 0, max = 10), 1),
  total_sales = round(runif(length(game_titles), min = 0.01, max = 50), 2),
)

head(simulated_game_data)

# Write simulated vote data to CSV
write.csv(simulated_game_data, "data/analysis_data/simulated_game_data.csv", row.names = FALSE)

# Confirm file creation
file.exists("data/analysis_data/simulated_game_data.csv")

