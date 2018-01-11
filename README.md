# Unit-Conversion
R Package for converting between units of pressure and converting between units of mass

### convert_pressure
This function converts between units of:
*Pascal
*Bar
*Atmospheric pressure
*Torr
*Millimeter of Mercury

### convert_weight
This function converts between units of:
*Gram
*Kilogram
*Grain
*Ounce
*Pound

    if (packageVersion("devtools") < 1.6) {
            install.packages("devtools")
    }

    devtools::install_github("Jhumbl/Unit-Conversion")

## Example Code
To find out what 25atm is in Torr:

    library(Unit-Conversions)
    convert_pressure(25, "atm", "Torr")
