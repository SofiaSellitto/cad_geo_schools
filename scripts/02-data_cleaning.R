#### Preamble ####
# Purpose: Downloads and saves the data from https://www.statcan.gc.ca/en/lode/databases/odef
# Author: Sofia Sellitto 
# Contact: sofia.sellitto@mail.utoronto.ca
# License: MIT
# Pre-requisites: run 01-download_data.R


#Loading packages
library(tidyverse)
library(readr)
library(dplyr)
library(janitor)


#Calling on data to clean 
cad_school <- read_csv(here::here("inputs/data/cad_school.csv"))



#Removing unwanted variables that will not be used for analysis 
cad_school_remove <- cad_school |>
  select(Facility_Name, Facility_Type, ISCED020, ISCED1, ISCED2, ISCED3, 
         Full_Addr, City, Prov_Terr, Postal_Code, CSDNAME, Longitude, Latitude, 
          )|>
  filter(Facility_Type %in% c("School", "Public", "Francophone", "Catholic", "Public School", 
                              "Private School", "Private", "First Nations School"))

#Removing  missing values
cad_school_remove <- cad_school_remove |> 
  na.omit()


#Combining the values "Public" & "Public School" as "Public" 
cad_school_remove <- cad_school_remove |>
  mutate(Facility_Type = ifelse(Facility_Type %in% c("Public", 
                                                     "Public School"), 
                                "Public", Facility_Type))

#Combining the values "Private" & "Private School" as "Private" 
cad_school_remove <- cad_school_remove |>
  mutate(Facility_Type = ifelse(Facility_Type %in% c("Private", 
                                                     "Private School"), 
                                "Private", Facility_Type))

#Removing missing variables that were input as '..' by replacing them as NA 
cad_school_remove <- replace(cad_school_remove, cad_school_remove == "..",
                             NA)

cad_school_remove <- na.omit(cad_school_remove)


#changing lat/ long from character to numeric 
cad_school_remove$Latitude <- as.numeric(cad_school_remove$Latitude)
cad_school_remove$Longitude <- as.numeric(cad_school_remove$Longitude)


data <- cad_school_remove


#writing to CSV
write_csv(data, here::here("inputs/data/data.csv"))

