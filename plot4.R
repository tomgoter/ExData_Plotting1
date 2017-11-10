## This script is used to create Plot4 for the Exploratory Data Analysis Week 1 Project

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

#Let's Plot the Data!
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(goodTwoDayData, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
with(goodTwoDayData, plot(twoDayData$DateTime, Voltage, xlab = 'datetime', type = 'l'))
with(twoDayData, plot(DateTime, Sub_metering_1, type='n', xlab = "", ylab = "Energy sub metering"))
points(twoDayData$DateTime, twoDayData$Sub_metering_1, type = 'l', col="black")
points(twoDayData$DateTime, twoDayData$Sub_metering_2, type = 'l', col="red")
points(twoDayData$DateTime, twoDayData$Sub_metering_3, type = 'l', col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(goodTwoDayData, plot(twoDayData$DateTime, Global_reactive_power, xlab = 'datetime', type = 'l'))
dev.off()
