roll_avg <- function(focal_date, sample_date, nutrient_conc, win_size_wks){
  
  #subset the dates within the specific window- returns TRUE/FALSE
  is_in_win <- (sample_date > focal_date - (win_size_wks/2) *7) & #putting weeks into days
    (sample_date < focal_date + (win_size_wks/2) *7)
  
  # figure out associated concentrations- indexing with trues and falses, what falls within window gets looped through
  win_conc <- nutrient_conc[is_in_win]
  
  #calculate the mean of the concentrations within the window
  result <- mean(win_conc, na.rm = TRUE)
  
  return(result)
}

