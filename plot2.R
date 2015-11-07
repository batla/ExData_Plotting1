# plot2.R plots Global Active Power (kw) over the course of two days from the
# household power consumption dataset from the Coursera Exploratory Data 
# Analysis course
# plot is saved in a file called plot2.png
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

## string conversions
globalActivePower <- as.numeric(dataSubset$Global_active_power)

## open png device and plot
datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
globalActivePower <- as.numeric(dataSubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()