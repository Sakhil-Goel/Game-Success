# Determining Success in the Video Game Industry

## Overview

This paper aims to analyze factors contributing to the commercial success of video games. Using data from the RAWG Video Games Database API, we explore how various attributes such as genre, platform, playtime, and release year affect a game's success, defined by its Metacritic score.

## Fetching Data

This repo uses the RAWG API to obtain video game information in order to create the dataset.
Here are the steps needed to access the data:
1. Create an account on https://rawg.io/
2. Find your API key using https://rawg.io/apidocs
3. In the `01-download_data.R` script, enter your API key into the API key variable

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as created using the RAWG API.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

The abstract and introduction were written with the help of ChatGPT and the entire chat history is available in inputs/llms/usage.txt.
