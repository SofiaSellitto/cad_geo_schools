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




#### Download ####
## Data was downloaded as a zip file, writing in CSV from my files and renaming the dataframe ##
# read in dataset 

cad_school <- read_csv("C:/Users/gsell/Downloads/my_data/my_data/ODEF_v2_1.csv")




#### Save data ####
write_csv(cad_school,here::here("inputs/data/cad_school.csv"))

         