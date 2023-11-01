#' Boxplot of Payments by DRG Code
#'
#'Creates a ggplot boxplot of payments for each DRG code in the drg dataframe.
#'
#' @param data a dataframe. Only the drg dataframe is applicable.
#' @param type a string specifying which type of payment to plot. Must be one of "Average Covered Charges", "Average Total Payments", or "Average Medicare Payments".
#'
#' @return A boxplot of specified type of payments by DRG code.
#' @export
#'
#' @examples
#' payments_by_drg_code(drg, "Average Medicare Payments")
#'
#' payments_by_drg_code(drg, "Average Covered Charges")


payments_by_drg_code <- function(data, type){

  switch(type,
         "Average Covered Charges" = NULL,
         "Average Total Payments" = NULL,
         "Average Medicare Payments" = NULL,
         stop("Type should be either 'Average Covered Changes', 'Average Total Payments', or 'Average Medicare Payments'.")
         )

  data %>%
    mutate(drg_code = substr(`DRG Definition`, 1, 3)) %>%
    ggplot(aes(x = get(type),
               y = drg_code,
               color = drg_code)) +
    geom_boxplot(outlier.shape = 0.2,
                 outlier.size = 0.2) +
    theme(legend.position = "none",
          plot.title = element_text(hjust = 0.5)) +
    labs(title = paste("Boxplot of", type, "by DRG code"),
         x = type,
         y = "DRG code")
}
