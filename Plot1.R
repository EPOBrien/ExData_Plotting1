#This first block of code installs the R functions needed to run this program
#NOTE: Select "No" when asked if you want to restart R

install.packages("datasets") #installs the devices function calls for printing and saving to a graphs file
library(datasets) #loads the function calls into my library 

install.packages("data.table") #Installs the functions I will use to read the data
library(data.table) #Loads the functions into my library of R functions

# The first block of code sets my working directory, gets and conditions the data for the graph I want to make
# NOTE:  I call the built-in R spreadsheet editor for ease of inspecting the data, date ranges, format and coding, etc.
# NOTE:  You must use the editor to set "character" to "numeric" and close the editor to save the values. 
# I prefer this method as I am able to visually inspect the data 
# and get a sense of what validation rules, ranges, and other tests I might use and inspect to ensure the data is properly conditioned.  

getwd()  #Identifies my current working directory
setwd("C:/Users/p/Documents/R Homework Data") #Changes my working folder to the one where I store my homework assignments

totaldataset <- fread("household_power_consumption.txt") #Reads the target file into a data frame called "totaldataset"
datasubset <- subset(totaldataset, Date == "1/2/2007" | Date == "2/2/2007") #Creates a subset of the total data set limited to the days of interest
datasubset <- edit(datasubset) #I call the built-in R spreadsheet to look at the data and toggle "character" variabes to "numerics"
date <- datasubset$Date #Creates a short label for the string of data called "Date" in the data subset
time <- datasubset$Time  #Creates a short label for the string of data called "Time in the data subset
datetime <- as.POSIXct(paste(date,time), format = "%d/%m/%Y %H:%M:%S") #Merges the Date variable and Time variable into a single datetime group

#The following code customizes the base histogram 

hist(datasubset$Global_active_power, #Calls the histogram building function and points to dataset "datasubset", variable "Global_active_power
     breaks = 12, #Ensures I get 12 bars
     main = paste("Global Active Power", "" ), #Embeds the graph title at the top margin
     col = "red1", #Sets the bar color to red
     xlab = "Globl Active Power (Kilowatts)") #Enbeds the x-axis title at the bottom margin
axis(side=2, at=seq(0, 1200, by=200)) #The default scaling was already 0-1,200 by breaks of 200, but changing the "200" to "100" would let me add intermediate tic marks

#The following code copies the graph to the .png device



png("plot1.png",  width = 480, height = 480, units = "px")

hist(datasubset$Global_active_power, #Calls the histogram building function and points to dataset "datasubset", variable "Global_active_power
     breaks = 12, #Ensures I get 12 bars
     main = paste("Global Active Power", "" ), #Embeds the graph title at the top margin
     col = "red1", #Sets the bar color to red
     xlab = "Globl Active Power (Kilowatts)") #Enbeds the x-axis title at the bottom margin
     axis(side=2, at=seq(0, 1200, by=200)) #The default scaling was already 0-1,200 by breaks of 200, but changing the "200" to "100" would let me add intermediate tic marks

dev.off()

