## plot4.R is a code file that constructs a plot 'plot4.png' using
## data from the "Individual Household Electric Power Consumption 
## Data Set", which is part of the UC Irvine Machine Learning 
## Repository.  'plot4.png' is a group of 4 scatterplots 
## over the time period 2007/02/01 to 2007/02/02.


## STEP 1: Assume that dataset has been downloaded from
## "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## into current working directory and unzipped.  
## Read dataset 'household_power_consumption.txt' into R.

data <- read.csv2("household_power_consumption.txt")


## STEP 2: Subset dataset to date period 2007/02/01 to 2007/02/02.

x <- data  ## makes a copy of dataframe
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
x.sub <- x[(x$Date == "2007-02-01" | x$Date == "2007-02-02"), ]
x.sub$dateTime <- paste(x.sub$Date, x.sub$Time) ## Adds a new variable "dateTime"
x.sub$dateTime <- strptime(x.sub$dateTime, format = "%Y-%m-%d %H:%M:%S")
x.sub$Global_reactive_power <- as.numeric(x.sub$Global_reactive_power)
x.sub$Sub_metering_1 <- as.numeric(x.sub$Sub_metering_1)
x.sub$Sub_metering_2 <- as.numeric(x.sub$Sub_metering_2)
x.sub$Sub_metering_3 <- as.numeric(x.sub$Sub_metering_3)

## STEP 3: Plot 4 scatterplots.

png(file = "plot4.png") ## opens PNG device and creates 'plot3.png'
## in working directory
par(mfrow = c(2,2))
with(x.sub, plot(dateTime, Global_active_power, type = "l", 
            xlab = "", ylab = "Global Active Power", main = ""))
with(x.sub, plot(dateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(x.sub, plot(dateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(x.sub, lines(dateTime, Sub_metering_2, type="l", col = "red"))
with(x.sub, lines(dateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(x.sub, plot(dateTime, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()

