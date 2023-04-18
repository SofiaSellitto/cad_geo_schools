#### Preamble ####
# Purpose: Downloads and saves the data from https://www.statcan.gc.ca/en/lode/databases/odef
# Author: Sofia Sellitto 
# Date: 29 March 2023
# Contact: sofia.sellitto@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# Any other information needed? None.

#### Workspace setup ####
library(tidyverse)
library(readr)

set.seed(123)


#### Simulate data ####

#using the variables present within the df, and imputing example values

school_name <- sample(c('St. Michaels Catholic Secondary School', 
                        'Robert F. Hall Catholic Secondary School', 'St. John
                        the Baptist Catholic elemtary School', 'Hillcrest
                        Public School', 'Dalhousie Public School'), size = 100,
                        replace = TRUE ) 

school_type <- sample(c('public', 'private', 'catholic', 'francophone', 
                        'first nations school'), size = 100, replace = TRUE)

ISCED_level <- sample(c( '0-1'), size = 100, replace = TRUE)

cad_address <- sample(c('200 Blackthorn St, Winnipeg, R3G 2T4', 
                        '283 Thomas Randall Dr, Halifax, NS B3S 1R1',
                        '1914 Queen St E, Toronto, ON M4L 1H4', '501 Old St
                        Patrick St, Ottawa ON K1N 8R3', '593 Trim Rd, Orleans, 
                        ON K4A 3P4'), size = 100, replace = TRUE)

cad_city <- sample(c('Toronto', 'Montreal', 'Vancouver', 'Calgary','Edmonton',
                     'Quebec City', 'Victoria', 'Winnipeg'), 
                      size = 100, replace = TRUE)

prov_terr <- sample(c('ON', 'QC', 'NS', 'NB', 'MB', 'BC', 'PE', 'SK', 'AB',
                      'NL', 'NT', 'YT', 'NV'), size = 100, replace = TRUE)

latitude <- runif(10, 42, 70)

longitude <- runif(10, -141, -52)


#creating the data frame and calling on the variables

data_sim <- data_frame( 
  school_name,
  school_type,
  ISCED_level,
  cad_address,
  cad_city,
  prov_terr,
  latitude,
  longitude,
  )

# write simulation on csv for testing 
write_csv(data_sim, here::here("inputs/data/data_sim.csv"))
