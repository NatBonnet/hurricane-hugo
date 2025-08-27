##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Hurricane Hugo Nutrients in the Bisley Catchement  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library(dplyr)
library(tidyverse)
library(janitor)
library(lubridate)
library(here)
library(patchwork)
source("R/rolling_mean.R")

#read in data
prm <- read_csv(here::here("data", "RioMameyesPuenteRoto.csv"))

q1 <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))

q2 <- read_csv(here::here("data", "QuebradaCuenca2-Bisley.csv"))

q3 <- read_csv(here::here("data", "QuebradaCuenca3-Bisley.csv"))


# for(i in length(files)){
#   
# }


q1_trial <- q1 |>
  select(Sample_Date, K) |>
  filter(Sample_Date <= "1994-12-27", Sample_Date >= "1988-01-05") |>
  mutate(K_mean = sapply(X = Sample_Date, 
                         FUN = roll_avg, 
                         sample_date = Sample_Date,
                         nutrient_conc = K, 
                         win_size_wks = 9))


ggplot(ts_data, aes(x = Sample_Date, y = `k_ts`))+
  geom_line()
