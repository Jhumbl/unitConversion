# unitConversion
R Package for converting between units of pressure and converting between units of mass

    if (packageVersion("devtools") < 1.6) {
            install.packages("devtools")
    }

    devtools::install_github("Jhumbl/Unit-Conversion")

### convert_pressure
This function converts between units of:
* Pascal
* Bar
* Atmospheric pressure
* Torr
* Millimeter of Mercury

### convert_weight
This function converts between units of:
* Gram
* Kilogram
* Grain
* Ounce
* Pound

    

## Example Code
To find out what 25atm is in Torr:

    library(unitConversions)
    convert_pressure(25, "atm", "Torr")
    #> 25atm is equal to 19000Torr.
