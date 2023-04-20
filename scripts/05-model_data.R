#### Preamble ####
# Purpose: Downloads and saves the data from https://www.statcan.gc.ca/en/lode/databases/odef
# Author: Sofia Sellitto 
# Contact: sofia.sellitto@mail.utoronto.ca
# License: MIT
# Pre-requisites:None

#Loading packages
library(dplyr)
library(tidyr)
library(ggplot2)
library(marginaleffects)


log_data <- read_csv(here::here("inputs/data/data.csv"))


###In this script I test a potential binomial model###
##However, based on the nature of my data and it being character variables, the model was not of use and thus not presented in my final analysis pdf## 


#Reading in my model data 
log_model <- select(cad_data, Prov_Terr, Facility_Type)

#Recode Facility_Type to binary variable
log_model$Facility_Type <- ifelse(log_model$Facility_Type == "Private", 1, 0)

#Converting character variables to a factor 
log_model$Facility_Type <- factor(log_model$Facility_Type)
log_model$Prov_Terr <- factor(log_model$Prov_Terr)
head(log_model)


logit_model <- glm(
  Facility_Type ~ Prov_Terr, 
  data = log_model, 
  family = "binomial"
)


logit_model <- predictions(logit_model) |>
  as_tibble()


#Graphing model 
logit_model |>
  ggplot(aes(
    x = Prov_Terr,
    y = estimate, 
    color = Facility_Type
  )) +
  geom_jitter(width = 0.01, height = 0.01, alpha = 0.3) +
  labs( 
    x = "Province",
    y = "Estimated Probability of School Type",
    color = "School Type"
  ) + 
  theme_classic() + 
  scale_color_brewer(palette = "Set1") +
  theme(legend.position = "bottom")
