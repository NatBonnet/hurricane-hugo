##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Small example of subsetting data and applying function, then plotting  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#read in data
prm <- read_csv(here::here("data", "RioMameyesPuenteRoto.csv"))

q1 <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))

q2 <- read_csv(here::here("data", "QuebradaCuenca2-Bisley.csv"))

q3 <- read_csv(here::here("data", "QuebradaCuenca3-Bisley.csv"))

# subsetting dataframe by dates referenced in Schaeffer et al
# applying rolling_avg function across all columns by 9 week period

q1c_trial <- q1 |>
  select(Sample_Date, K) |>
  filter(Sample_Date <= "1994-12-27", Sample_Date >= "1988-01-05") |>
  mutate(K_mean = sapply(X = Sample_Date, 
                         FUN = roll_avg, 
                         sample_date = Sample_Date,
                         nutrient_conc = K, 
                         win_size_wks = 9))

# making a simple plot of the result
ggplot(ts_data, aes(x = Sample_Date, y = `k_ts`))+
  geom_line()
