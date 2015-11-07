# plot1.R plots Global Active Power (kw) vs. Frequency of household power
# consumption dataset from the Coursera Exploratory Data Analysis course
# histogram plot is saved in a file called plot1.png
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
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()