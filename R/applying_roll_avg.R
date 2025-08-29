
#' Apply Rolling Average Function
#' applies the rolling_avg function across all columns of interest in Bisley dataset
#'
#' @param data A dataframe including columns start_date, end_date, and the specified nutrients
#' @param nutrients A vector corresponding to the nutrients of interest.
#' @param start_date  A scalar corresponding to the target start date.
#' @param end_date A scalar corresponding to the target end date.
#' @param win_size_wks A scalar representing the number of weeks to apply the rolling average across.
#'
#' @returns A data frame in the global environment with columns containing the rolling average of each target nutrient
#' @export
#'
#' @examples
#' apply_moving_avg(data = q1)

#creating a function with the same inputs as the rolling average function automated that can be fed any of the Bisley datasets
#setting start and end date as the same for each dataset
# window size to apply the function to is 10 weeks
apply_roll_avg <- function(data, 
                           nutrients = c("k", "no3", "ca", "mg", "nh4"), #creating vector of target nutrients to feed into function
                           start_date = "1988-01-05", 
                           end_date = "1994-12-27", 
                           win_size_wks = 10) {
  data |> #feed in dataset 
    select(sample_id, sample_date, all_of(nutrients)) |> #select all nutrient columns from cleaned data and sample_id + sample_date to perform analysis on
    filter(sample_date >= start_date, sample_date <= end_date) |>
    mutate(across(all_of(nutrients), #appling roll_avg
                  ~ sapply(sample_date, roll_avg, 
                           sample_date = sample_date, 
                           nutrient_conc = ., 
                           win_size_wks = win_size_wks),
                  .names = "{.col}_mean"))
}