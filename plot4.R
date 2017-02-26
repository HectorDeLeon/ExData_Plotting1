library(datasets)

#Reading data into R
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subsetting the data set to obtain data for 2 days only
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Combining Date and Time variable and creating a new column "DateTime" 

DateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subSetData$Global_active_power)
Voltage <- as.numeric(subSetData$Voltage)
Sub_Metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_Metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_Metering_3 <- as.numeric(subSetData$Sub_metering_3)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#Creating plots
#Plot 1 - Global Active Power
plot(DateTime, globalActivePower, type ="l", xlab = "", ylab = "Global Active Power")
#Plot 2 - Voltage
plot(DateTime, Voltage, type ="l", xlab = "datetime", ylab = "Voltage")
#Plot 3 - Sub Metering
plot(DateTime, Sub_Metering_1, type ="l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_Metering_2, type="l", col="red")
lines(DateTime, Sub_Metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = 1, col = c("black", "red", "blue"))
#Plot 4 - Global Reactive Power
plot(DateTime, globalReactivePower, type ="l", xlab = "datetime", ylab = "Global Reactive Power")
# Closing of PNG device
dev.off()