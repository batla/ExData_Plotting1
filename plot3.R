# plot3.R plots Energy Submetering 1-3 over the course of two days from the
# household power consumption dataset from the Coursera Exploratory Data 
# Analysis course
# plot is saved in a file called plot3.png
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
subMetering1 <- as.numeric(dataSubset$Sub_metering_1)
subMetering2 <- as.numeric(dataSubset$Sub_metering_2)
subMetering3 <- as.numeric(dataSubset$Sub_metering_3)

## open png device and plot
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Sub_metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()