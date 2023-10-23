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
  if (stat == "mean") {
    data |>
      group_by(`DRG Definition`) |>
      summarize(mean = mean(`Average Medicare Payments`))
  } else if (stat == "median") {
    data |>
      group_by(`DRG Definition`) |>
      summarize(median = median(`Average Medicare Payments`))
  } else if (stat == "sd") {
    data |>
      group_by(`DRG Definition`) |>
      summarize(sd = sd(`Average Medicare Payments`))
  }
}

