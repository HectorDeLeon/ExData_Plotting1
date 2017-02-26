setwd("C:/Nata Docs/Data Science/Course 4 - Exploratory Analysis/week1")
getwd()

library(datasets)

#Reading data into R
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subsetting the data set to obtain data for 2 days only
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot1.png", width = 480, height = 480)

#Creating a histogram
hist(globalActivePower, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
# Closing of PNG device
dev.off()