roll_avg <- function(focal_date, date_range, chem, window_size_wks){
  
  #subset the dates within the specific window- returns TRUE/FALSE
  is_in_window <- (date_range > focal_date - (window_size_wks/2) *7) & #putting weeks into days
    (date_range < focal_date + (window_size_wks/2) *7)
  
  # figure out associated concentrations- indexing with trues and falses, what falls within window gets looped through
  window_conc <- chem[is_in_window]
  
  #calculate the mean of the concentrations within the window
  mean_conc <- mean(window_conc, na.rm = TRUE)
  
  return(mean_conc)
}