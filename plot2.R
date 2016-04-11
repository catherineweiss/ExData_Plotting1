## plot2.R is a code file that constructs a plot 'plot2.png' using
## data from the "Individual Household Electric Power Consumption 
## Data Set", which is part of the UC Irvine Machine Learning 
## Repository.  'plot2.png' is a scatterplot of Global Active Power
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


## STEP 3: Plot a scatterplot of Global Active Power over time.

png(file = "plot2.png") ## opens PNG device and creates 'plot2.png'
                        ## in working directory
with(x.sub, plot(dateTime, Global_active_power, type = "l", 
                 xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

