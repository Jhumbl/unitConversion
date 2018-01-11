#' Weight Unit Conversion
#' @param value Number to be converted
#' @param fromUnit Unit to be converted from "g", "kg", "gr", "oz" or "lb"
#' @param toUnit Unit to be converted to "g", "kg", "gr", "oz" or "lb"
#' @param dp Number of decimal places to be rounded to
#' @return Value of converted Unit
#' @export

convert_weight <- function(value, fromUnit = c("g", "kg", "gr", "oz",  "lb"), toUnit = c("g", "kg", "gr", "oz",  "lb"), dp = 2){

        units <- c("g", "kg", "gr", "oz",  "lb")

        if (length(fromUnit) != 1){fromUnit <- "g"}
        if (length(toUnit) != 1){toUnit <- "g"}
        if (!(fromUnit %in% units)|!(toUnit %in% units)){stop("Enter either 'g', 'kg', 'gr', 'oz' or 'lb' as units")}

        #Construct conversion matrix
        conversion_matrix <- matrix(c(1, 0.001, 15.43, 0.0353, 0.0022,
                                      1000, 1, 1.54e4, 35.027, 2.205,
                                      0.0648, 6.48e-5, 1, 0.0023, 1.43e-4,
                                      28.35, 0.0284, 437.5, 1, 0.0625,
                                      453.6, 0.4536, 7000, 16, 1), nrow = 5,
                                    ncol = 5, byrow = TRUE)

        rownames(conversion_matrix) <- units
        colnames(conversion_matrix) <- units

        #calculate conversion
        answer <- as.numeric(format(round((value * conversion_matrix[fromUnit, toUnit]), digits = dp)))

        #print answer to console
        cat(value, fromUnit, " is equal to ", answer, toUnit, ".", sep = "")
}

