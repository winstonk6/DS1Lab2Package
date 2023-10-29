#' Boxplot of Payments by DRG Code
#'
#' @param data a dataframe
#' @param type a string indicating which type of payment to plot
#'
#' @return Returns a boxplot of payments by DRG code
#' @export
#'
#' @examples
#' payments_by_drg_code(drg, "Average Medicare Payments")
#'


payments_by_drg_code <- function(data, type){
  switch(type,
         "Average Covered Charges" = NULL,
         "Average Total Payments" = NULL,
         "Average Medicare Payments" = NULL,
         stop("Argument type should be either 'Average Covered Changes', 'Average Total Payments', or 'Average Medicare Payments'.")
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
