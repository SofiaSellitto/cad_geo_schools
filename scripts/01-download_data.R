#### Preamble ####
# Purpose: Downloads and saves the data from https://www.statcan.gc.ca/en/lode/databases/odef
# Author: Sofia Sellitto 
# Contact: sofia.sellitto@mail.utoronto.ca
# License: MIT
# Pre-requisites: Have downloaded csv data from: https://www.statcan.gc.ca/en/lode/databases/odef 



##loading packages
library(readr)



##Data was downloaded as a zip file, written in as CSV from my files and renamed


#reading in the file
cad_school <- read_csv("C:/Users/gsell/Downloads/my_data/my_data/ODEF_v2_1.csv")




#writing to csv
write_csv(cad_school,here::here("inputs/data/cad_school.csv"))

         