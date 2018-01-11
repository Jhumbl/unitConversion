#' Pressure Unit Conversion
#' @param value Number to be converted
#' @param fromUnit Unit to be converted from "Pa", "bar", "atm", "Torr" or "mmHg"
#' @param toUnit Unit to be converted to "Pa", "bar", "atm", "Torr" or "mmHg"
#' @param dp Number of decimal places to be rounded to
#' @return Value of converted Unit
#' @export

convert_pressure <- function(value, fromUnit = c("Pa", "bar", "atm", "Torr", "mmHg"),
                             toUnit = c("Pa", "bar", "atm", "Torr", "mmHg"), dp = 2){

        units <- c("Pa", "bar", "atm", "Torr", "mmHg")

        if (length(fromUnit) != 1){fromUnit <- "Pa"}
        if (length(toUnit) != 1){toUnit <- "Pa"}
        if (!(fromUnit %in% units)|!(toUnit %in% units)){stop("Enter either 'Pa', 'bar', 'atm', 'Torr' or 'mmHg' as units")}

        # assign conversion factors
        a <- 100000
        b <- 101325
        c <- 760
        d <- 13.5951
        e <- 9.80665

        #Construct conversion matrix
        conversion_matrix <- matrix(c(1, 1/a, 1/b, c/b, 1/d*e,
                                      a, 1, a/b, a*c/b, a/d*e,
                                      b, b/a, 1, c, b/d*e,
                                      b/c, b/a*c, 1/c, 1, b/c*d*e,
                                      d*e, d*e/a, d*e/b, c*d*e/b, 1),
                                    nrow = 5, ncol = 5, byrow = TRUE)
        rownames(conversion_matrix) <- units
        colnames(conversion_matrix) <- units

        #calculate conversion
        answer <- as.numeric(format(round((value * conversion_matrix[fromUnit, toUnit]), digits = dp)))

        #print answer to console
        cat(value, fromUnit, " is equal to ", answer, toUnit, ".", sep = "")

}
