library(datasets)

#Reading data into R
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subsetting the data set to obtain data for 2 days only
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Combining Date and Time variable and creating a new column "DateTime" 

DateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot2.png", width = 480, height = 480)

#Creating a plot

plot(DateTime, globalActivePower, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
# Closing of PNG device
dev.off()