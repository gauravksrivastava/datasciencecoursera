## Load required libraries
library(dplyr)

## Stop execution if input file does not exist 
## in the current working directory
if(!file.exists("household_power_consumption.txt")) {
  stop ("Input file does not exist")
}

## Extract the first row from the input file
## This will be used later to form the dataset
header <- read.delim("household_power_consumption.txt", nrow=1, sep=";",header=FALSE, stringsAsFactors=FALSE)

## This 'if' block is skipped if the subset data exists locally
if(!file.exists("subset.RData")){
  ## Read only 1/2/2007 and 2/2/2007 rows
  data <- grep("^[1-2]/2/2007", readLines("household_power_consumption.txt"),value=TRUE)
  
  ## Write these into a file
  ## For multiple executions of this R script, this file comes handy
  ## Because the subset is created and saved locally in the first run
  ## And this local copy is used in any subsequent run
  fileConn<-file("subset.RData")
  writeLines(data, fileConn)
  close(fileConn)
}

## Read the subset data
dataset <- read.delim("subset.RData", sep=";", header=FALSE, stringsAsFactors=FALSE)
## Provide column names to the dataset
names(dataset) <- header

## Mutate dataset to collapse the Date and Time columns into one
dataset <- dataset %>% mutate (Date_Time = paste(Date, Time, sep = " ")) %>% select (Date_Time, Global_active_power:Sub_metering_3) 
## Convert the new Date_Time column to Posixlt
dataset$Date_Time <- strptime(dataset$Date_Time, "%d/%m/%Y %H:%M:%S") 

## Open png device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

## Plot nothing initially
with(dataset, plot(dataset$Date_Time, dataset$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))

## Plot Sub_metering_1 lines
lines(dataset$Date_Time, dataset$Sub_metering_1, type = "l", col = "black")

## Plot Sub_metering_2 lines
lines(dataset$Date_Time, dataset$Sub_metering_3, type = "l", col = "blue")

## Plot Sub_metering_3 lines
lines(dataset$Date_Time, dataset$Sub_metering_2, type = "l", col = "red")

## Plot the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), lwd = c(4, 4, 4), col = c("black", "red", "blue"))

## Device Off
dev.off()