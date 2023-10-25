#' Statistics for Average Medicare Payments
#'
#'This function returns the mean, median, or standard deviation for average medicare payments based on the \code{stat} grouped by DRG code.
#'
#'
#' @param data a dataframe
#' @param stat a string name for which statistic to return
#'
#' @return A statistic for average medicare payments grouped by DRG code
#' @export
#'
#'
#' @examples
#' stats_payments(drg, "mean")
#'
#'
stats_payments <- function(data, stat) {
  grouped_data <- data %>%
    group_by(`DRG Definition`)

  switch(stat,
         mean = summarise(grouped_data, mean = mean(`Average Medicare Payments`)),
         median = summarise(grouped_data, median = median(`Average Medicare Payments`)),
         sd = summarise(grouped_data, sd = sd(`Average Medicare Payments`)),
         all = summarise(grouped_data,
                         mean = mean(`Average Medicare Payments`),
                         median = median(`Average Medicare Payments`),
                         sd = sd(`Average Medicare Payments`)),
         stop("Stat should be 'mean', 'median', 'sd', or 'all'."))
}

