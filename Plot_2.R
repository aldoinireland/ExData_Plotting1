#### This code is for Plot 2 of project 1 for the Coursera course "Exploratory Data Analysis"
#### Date: 07/01/2014
#### Author: Alan Walters

## load the data into R
data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subset the data to only review the required period
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates as discussed in project notes
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2 create
plot(data$Global_active_power~data$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")


## Saving to file plot 2
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()