##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            ~~
##                       Test Script for working out my issues                     ----
##                                                                            ~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ loading in necessary libraries  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
library(dplyr)
library(tidyverse)
library(janitor)
library(lubridate)
library(here)
library(patchwork)
source("R/rolling_avg.R")


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ reading in the Bisley catchement CSVs  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prm <- read_csv(here::here("data", "RioMameyesPuenteRoto.csv"))|>
  clean_names()|>
  rename(no3 = no3_n, nh4 = nh4_n)

q1 <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))|>
  clean_names()|>
  rename(no3 = no3_n, nh4 = nh4_n)

q2 <- read_csv(here::here("data", "QuebradaCuenca2-Bisley.csv")) |>
  clean_names()|>
  rename(no3 = no3_n, nh4 = nh4_n)

q3 <- read_csv(here::here("data", "QuebradaCuenca3-Bisley.csv"))|>
  clean_names()|>
  rename(no3 = no3_n, nh4 = nh4_n)

#............................test code...........................


# create a subset with only sample date and K
# apply the rolling average function to pull out the rolling average K concentration from 1988-1994
q1c_trial <- q1 |>
  select(sample_date, k) |>
  filter(sample_date <= "1994-12-27", sample_date >= "1988-01-05") |>
  mutate(k_mean = sapply(X = sample_date, 
                         FUN = roll_avg, 
                         sample_date = sample_date,
                         nutrient_conc = k, 
                         win_size_wks = 10))
#....................scale up test to each CSV...................


##~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Q1 Stream Data  ----
##~~~~~~~~~~~~~~~~~~~~~~~~
# applying chemical concentration rolling mean across all columns
q1_roll_avg <- q1 |>
  select(sample_id, sample_date, k, no3, ca, mg, nh4)|>
  filter(sample_date <= "1994-12-27", sample_date >= "1988-01-05")|>
  mutate(k_mean = sapply(X = sample_date, 
                         FUN = roll_avg, 
                         sample_date = sample_date,
                         nutrient_conc = k, 
                         win_size_wks = 10))|>
  mutate(no3_mean = sapply(X = sample_date, 
                           FUN = roll_avg, 
                           sample_date = sample_date,
                           nutrient_conc = no3, 
                           win_size_wks = 10))|>
  mutate(ca_mean = sapply(X = sample_date, 
                          FUN = roll_avg, 
                          sample_date = sample_date,
                          nutrient_conc = ca, 
                          win_size_wks = 10))|>
  mutate(mg_mean = sapply(X = sample_date, 
                          FUN = roll_avg, 
                          sample_date = sample_date,
                          nutrient_conc = mg, 
                          win_size_wks = 10))|>
  mutate(nh4_mean = sapply(X = sample_date, 
                          FUN = roll_avg, 
                          sample_date = sample_date,
                          nutrient_conc = nh4, 
                          win_size_wks = 10))
##~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Q2 Stream Data  ----
##~~~~~~~~~~~~~~~~~~~~~~~~
q2_roll_avg <- q2 |>
  select(sample_id, sample_date, k, no3, ca, mg, nh4)|>
  filter(sample_date <= "1994-12-27", sample_date >= "1988-01-05")|>
  mutate(k_mean = sapply(X = sample_date, 
                         FUN = roll_avg, 
                         sample_date = sample_date,
                         nutrient_conc = k, 
                         win_size_wks = 10))|>
  mutate(no3_mean = sapply(X = sample_date, 
                           FUN = roll_avg, 
                           sample_date = sample_date,
                           nutrient_conc = no3, 
                           win_size_wks = 10))|>
  mutate(ca_mean = sapply(X = sample_date, 
                          FUN = roll_avg, 
                          sample_date = sample_date,
                          nutrient_conc = ca, 
                          win_size_wks = 10))|>
  mutate(mg_mean = sapply(X = sample_date, 
                          FUN = roll_avg, 
                          sample_date = sample_date,
                          nutrient_conc = mg, 
                          win_size_wks = 10))|>
  mutate(nh4_mean = sapply(X = sample_date, 
                           FUN = roll_avg, 
                           sample_date = sample_date,
                           nutrient_conc = nh4, 
                           win_size_wks = 10))
##~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Q3 Stream Data  ----
##~~~~~~~~~~~~~~~~~~~~~~~~
q3_roll_avg <- q3 |>
  select(sample_id, sample_date, k, no3, ca, mg, nh4)|>
  filter(sample_date <= "1994-12-27", sample_date >= "1988-01-05")|>
  mutate(k_mean = sapply(X = sample_date, 
                         FUN = roll_avg, 
                         sample_date = sample_date,
                         nutrient_conc = k, 
                         win_size_wks = 10))|>
  mutate(no3_mean = sapply(X = sample_date, 
                           FUN = roll_avg, 
                           sample_date = sample_date,
                           nutrient_conc = no3, 
                           win_size_wks = 10))|>
  mutate(ca_mean = sapply(X = sample_date, 
                          FUN = roll_avg, 
                          sample_date = sample_date,
                          nutrient_conc = ca, 
                          win_size_wks = 10))|>
  mutate(mg_mean = sapply(X = sample_date, 
                          FUN = roll_avg, 
                          sample_date = sample_date,
                          nutrient_conc = mg, 
                          win_size_wks = 10))|>
  mutate(nh4_mean = sapply(X = sample_date, 
                           FUN = roll_avg, 
                           sample_date = sample_date,
                           nutrient_conc = nh4, 
                           win_size_wks = 10))


##~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ PRM Stream Data  ----
##~~~~~~~~~~~~~~~~~~~~~~~~

prm_roll_avg <- prm |>
  select(sample_id, sample_date, k, no3, ca, mg, nh4)|>
  filter(sample_date <= "1994-12-27", sample_date >= "1988-01-05")|>
  mutate(k_mean = sapply(X = sample_date, 
                         FUN = roll_avg, 
                         sample_date = sample_date,
                         nutrient_conc = k, 
                         win_size_wks = 10))|>
  mutate(no3_mean = sapply(X = sample_date, 
                           FUN = roll_avg, 
                           sample_date = sample_date,
                           nutrient_conc = no3, 
                           win_size_wks = 10))|>
  mutate(ca_mean = sapply(X = sample_date, 
                          FUN = roll_avg, 
                          sample_date = sample_date,
                          nutrient_conc = ca, 
                          win_size_wks = 10))|>
  mutate(mg_mean = sapply(X = sample_date, 
                          FUN = roll_avg, 
                          sample_date = sample_date,
                          nutrient_conc = mg, 
                          win_size_wks = 10))|>
  mutate(nh4_mean = sapply(X = sample_date, 
                           FUN = roll_avg, 
                           sample_date = sample_date,
                           nutrient_conc = nh4, 
                           win_size_wks = 10))

prm_avg_subset <- prm_roll_avg|>
  select(sample_id, sample_date, k_mean, no3_mean, ca_mean, mg_mean, nh4_mean)


