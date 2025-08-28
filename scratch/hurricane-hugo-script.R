##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            ~~
##                       LOADING IN NECESSARY LIBRARIES                     ----
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
prm <- read_csv(here::here("data", "RioMameyesPuenteRoto.csv"))

q1 <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))

q2 <- read_csv(here::here("data", "QuebradaCuenca2-Bisley.csv"))

q3 <- read_csv(here::here("data", "QuebradaCuenca3-Bisley.csv"))

#............................test code...........................


# create a subset with only sample date and K
# apply the rolling average function to pull out the rolling average K concentration from 1988-1994
q1c_trial <- q1 |>
  select(Sample_Date, K) |>
  filter(Sample_Date <= "1994-12-27", Sample_Date >= "1988-01-05") |>
  mutate(K_mean = sapply(X = Sample_Date, 
                         FUN = roll_avg, 
                         sample_date = Sample_Date,
                         nutrient_conc = K, 
                         win_size_wks = 10))

