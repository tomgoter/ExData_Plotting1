## This script is used to create Plot1 for the Exploratory Data Analysis Week 1 Project
# Plot one is a red histogram of Global Active Power

# Read the entire data set in with headers and separated by a semicolon
allData = read.table("../household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE, header = TRUE)

# Convert the Date column to Date class variables instead of a character class - need to provide the format
allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")

# Subset the data over the desired two day interval:
# February 1, 2007 and February 2, 2007
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
twoDayData <- subset(allData, Date==startDate | Date==endDate)

#Eliminate ? cases from the Global Active Power column and save to variable 'gap' with numeric type
missingData <- twoDayData$Global_active_power == '?'
gap <- as.numeric(twoDayData$Global_active_power[!missingData])

#Let's Plot the Data!
# It is a simple histogram with the following features:
#  -red bars
#  -Global Active Power as title
#  -Global Active Power (kilowatts) as x-label
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(gap), col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
