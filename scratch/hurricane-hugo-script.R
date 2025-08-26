##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Hurricane Hugo Nutrients in the Bisley Catchement  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


library(dplyr)
library(tidyverse)
library(janitor)
library(lubridate)
library(here)
library(patchwork)
library(zoo)


#read in data
prm <- read_csv(here::here("data", "RioMameyesPuenteRoto.csv"))

q1 <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))

q2 <- read_csv(here::here("data", "QuebradaCuenca2-Bisley.csv"))

q3 <- read_csv(here::here("data", "QuebradaCuenca3-Bisley.csv"))


# moving average dynamically figures out how many input data points are in each- variability instead of moving over the input you move over the output, centered moving average so you get the same number of data points on each side of the 9 weeks
# iterating across outputs- for loops, functions, encapsulation, sapply(): if you can write a solution once, sapply will do it an unlimited number of times 

q1_clean <- q1 |>
  select(Sample_ID, Sample_Date, `K`, `NO3-N`, `Mg`, `Ca`, `NH4-N`) |>
  filter(Sample_Date <= "1994-12-27
", 
         Sample_Date >= "1988-01-05")|> 
  mutate(week = lubridate::week(Sample_Date)) #creating new column to say which week of analysis you're looking at
  clean_names() 

ts_data <- q1_clean |> #trying to roll mean for individual variables
  mutate(k_ts = rollmean(K, k = 12, fill = NA, 
                         align = c("center")))

ggplot(ts_data, aes(x = Sample_Date, y = `k_ts`))+
  geom_line(color = "purple")
