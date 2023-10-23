

#' #' Title
#' #'
#' #' @param data 
#' #' @param type 
#' #'
#' #' @return
#' #' @export
#' #'
#' #' @examples
#' #' 
#' payments_by_drg_code2 <- function(data, type){
#'   switch(type,
#'          "Average Covered Changes" = NULL,
#'          "Average Total Payments" = NULL,
#'          "Average Medicare Payments" = NULL,
#'          stop("Argument type should be either 'Average Covered Changes', 'Average Total Payments', or 'Average Medicare Payments'.")
#'   )
#'   
#'   data %>%
#'     mutate(drg_code = substr(`DRG Definition`, 1, 3)) %>%
#'     ggplot(aes(x = get(type),
#'                y = drg_code,
#'                color = drg_code)) +
#'     geom_boxplot(outlier.shape = 0.2,
#'                  outlier.size = 0.2) +
#'     theme(legend.position = "none") +
#'     theme(plot.title = element_text(hjust = 0.5)) +
#'     labs(title = "Boxplot of Payments by DRG code",
#'          x = "Average Medicare Payments",
#'          y = "DRG code") 
#' }
