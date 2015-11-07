# plot4.R creates four plots:
# 1. Global Active Power over two days
# 2. Voltage usage over two days
# 3. Energy Submetering over two days
# 4. Global Re-active Power over two days
# from household power consumption dataset from the Coursera Exploratory Data 
# Analysis course
# plot is saved in a file called plot4.png
# script assumes household_power_consumption.txt is downloaded into
# ./data

## ingest data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, 
                   dec=".", na.strings="?")

## convert date to 'YYYY-MM-DD' format using as.Date() - personal preference
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## subset data for the two required days
dataSubset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## date, string conversions
globalActivePower <- as.numeric(dataSubset$Global_active_power)
datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
globalActivePower <- as.numeric(dataSubset$Global_active_power)
globalReactivePower <- as.numeric(dataSubset$Global_reactive_power)
voltage <- as.numeric(dataSubset$Voltage)
subMetering1 <- as.numeric(dataSubset$Sub_metering_1)
subMetering2 <- as.numeric(dataSubset$Sub_metering_2)
subMetering3 <- as.numeric(dataSubset$Sub_metering_3)

## open png device and make plots
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()