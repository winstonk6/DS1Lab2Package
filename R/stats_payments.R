#' Statistics for Average Medicare Payments
#'
#'Calculates the mean, median, standard deviation, or all of these statistics for average Medicare payments
#'based on \code{stat} over all DRG codes.
#'
#'
#' @param data a dataframe. Only the drg dataframe is applicable.
#' @param stat a string specifying which statistic to return. Must be one of "mean", "median", "sd", or "all".
#'
#' @return A tibble with the calculated statistic(s) for average Medicare payments, grouped by DRG code.
#' @export
#'
#' @examples
#' stats_payments(drg, "mean")
#'
#' stats_payments(drg, "all")
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

