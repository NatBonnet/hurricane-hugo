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
  filter(Sample_Date <= "1994-12-27", Sample_Date >= "1988-01-05")
#creating new column to say which week of analysis you're looking at


ts_data <- q1_clean |> #trying to roll mean for individual variables
  mutate(k_ts = rollmean(K, k = 12, fill = NA, 
                         align = c("center")))

#' creating a function to find the rolling mean of a specified time interval 
rollavgbyperiod <- function(i,window){
  startdate <- dates[i]-window
  enddate <- dates[i]-1
  interval <- seq(startdate,enddate,1)
  
  k_roll_mean <- value[dates %in% interval]
  return(mean(k_roll_mean))
}



dates <- td_days$Sample_Date
window <- filter(td_days, str_detect(day_of_month, pattern = c(1:28)))
mutate(window = window)                 
res <- sapply(1:length(dates),function(m) rollavgbyperiod(m,window))
res[is.nan(res)] <- NA


td_days <- q1_clean |>
  mutate(day_of_month = lubridate::day(Sample_Date))|>
  mutate(window = lubridate::interval(start = ))
    #make a new column with the day of month 



#` create function to loop over days 1-28 and take the rolling mean by 1 month



ggplot(ts_data, aes(x = Sample_Date, y = `k_ts`))+
  geom_line()
