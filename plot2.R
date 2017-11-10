## This script is used to create Plot2 for the Exploratory Data Analysis Week 1 Project

# Read the entire data set in with headers and separated by a semicolon
allData = read.table("../household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE, header = TRUE)

# COmbine the date and time columns into one date class variable- need to provide the format
allData$DateTime <- strptime(paste(allData$Date, allData$Time), format = "%d/%m/%Y %H:%M:%S")
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

# Subset the data over the desired two day interval:
# February 1, 2007 and February 2, 2007
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
twoDayData <- subset(allData, Date == startDate | Date == endDate)

#Eliminate ? cases from the Global Active Power column and use to subset the twoDayData table
missingData <- twoDayData$Global_active_power == '?'
goodTwoDayData <- twoDayData[!missingData,]

#Let's Plot the Data!
# It is a simple line plot with the following features:
#  -x-axis is time or date with no label
#  -y-axis is the global active power
#  -Global Active Power (kilowatts) as y-label
png(filename = "plot2.png", width = 480, height = 480)
with(goodTwoDayData, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
