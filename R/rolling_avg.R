#' Rolling Average Function
#' Calculate the rolling average for a data point given a window size. 
#' 
#' @param focal_date A scalar corresponding to the target date.
#' @param sample_date A vector column corresponding to all dates in your table.
#' @param nutrient_conc A vector column corresponding to all nutrient concentrations in your table. 
#' @param win_size_wks A scalar corresponding to the window size. 
#'
#' @returns A scalar corresponding to the rolling average of a specific data point. For example, the rolling average for a chemical concentration of one sample date. 
#' @export
#'
#' @examples
#' moving_average(focal_date = as.Date("1990-04-05"),
#' sample_date = tiny_problem$sample_date, 
#' nutrient_conc = tiny_problem$ca,
#' win_size_wks = 9)

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

