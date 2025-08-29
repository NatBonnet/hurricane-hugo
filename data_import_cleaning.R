##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ loading in necessary libraries  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
library(dplyr)
library(tidyverse)
library(janitor)
library(lubridate)
library(here)
library(patchwork)
library(paletteer)
source("R/rolling_avg.R")
source("R/applying_roll_avg.R")


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ reading in the Bisley catchment CSVs for all 3 sites ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ applying apply_roll_avg function to each data set  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

q1_roll_avg  <- apply_roll_avg(q1)
q2_roll_avg  <- apply_roll_avg(q2)
q3_roll_avg  <- apply_roll_avg(q3)
prm_roll_avg <- apply_roll_avg(prm)
