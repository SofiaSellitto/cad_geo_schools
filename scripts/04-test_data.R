#### Preamble ####
# Purpose: Downloads and saves the data from https://www.statcan.gc.ca/en/lode/databases/odef
# Author: Sofia Sellitto 
# Contact: sofia.sellitto@mail.utoronto.ca
# License: MIT
# Pre-requisites: Have run 00-simulation_data.R


#Read in simulation file 
data_test <- read.csv(here::here("inputs/data/data_sim.csv"))
                      


#Checking bound minimum 
min(data_sim$latitude, na.rm = TRUE) >= 42

#Checking bound maximum
max(data_sim$longitude, na.rm = TRUE) <= -52

#Checking that the number of unique values is appropriate 
length(unique(data_sim$school_type)) >= 2

#Checking for column types
all(sapply(data_sim[c("school_name", "school_type", 
                      "cad_address", "cad_city", "prov_terr")], is.character))             
