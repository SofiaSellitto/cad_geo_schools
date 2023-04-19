#### Preamble ####
# Purpose: Downloads and saves the data from https://www.statcan.gc.ca/en/lode/databases/odef
# Author: Sofia Sellitto 
# Date: 29 March 2023
# Contact: sofia.sellitto@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# Any other information needed? None.


library(dplyr)
library(tidyr)
library(ggplot2)
library(marginaleffects)



log_data <- read_csv(here::here("inputs/data/data.csv"))



log_model <- filter(cad_data, Prov_Terr, Facility_Type)
 


#Converting character variables to a factor 
log_model$Facility_Type <- factor(log_model$Facility_Type)
log_model$Prov_Terr <- factor(log_model$Prov_Terr)
head(log_model)

# Filtering the data to include only public and private schools


#estimating
logit_model <- 
  glm(
    Prov_Terr ~ Facility_Type, 
    data = log_model, 
    family = "binomial")

summary(logit_model)


logit_model <- 
  predictions(logit_model) |> 
  as_tibble()

logit_model

#graphing the probability that our model implies 
logit_model |>
  ggplot(aes(
    x = Facility_Type,
    y = estimate, 
    color = Prov_Terr
  )) +
  geom_jitter(width = 0.01, height = 0.01, alpha = 0.3) +
  labs( 
    x = "School Type",
    y = "Estimated Probability of School Type on Province",
    color = "Province"
  ) + 
  theme_classic() + 
  scale_color_brewer(palette = "Set1") +
  theme(legend.position = "bottom")


write_csv(logit_model, here::here("inputs/data/logit_model"))

