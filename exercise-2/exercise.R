### Exercise 2: Data Frame Practice with dplyr

## This exercise need the "fueleconomy" package.  Install and load it.
## You should have have access to the `vehicles` data.frame

## Install (if you haven't already) and load the `dplyr`package
## install.packages("dplyr")
library(dplyr)
# You should have have access to the `vehicles` data.frame
##install.packages("fueleconomy")
library(fueleconomy)
View(vehicles)
# Create a data.frame of vehicles from 1997
cars1997 <- filter(vehicles, year== 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(cars1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two_wheel <- filter(vehicles, drive == "2-Wheel Drive", cty  > 20 )

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
filtered <- filter(two_wheel, hwy == min(hwy))
worst_hwy <- select(filtered, id)

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
make_year_filter <- function(my_make, my_year) {
  filtered <- filter(vehicles, make == my_make, year == my_year) %>% filter(hwy == max(hwy))
  filtered
}

# What was the most efficient honda model of 1995?
df <- make_year_filter("Honda", 1995)


