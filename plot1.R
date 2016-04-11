## plot1.R is a code file that constructs a plot 'plot1.png' using
## data from the "Individual Household Electric Power Consumption 
## Data Set", which is part of the UC Irvine Machine Learning 
## Repository.  'plot1.png' is a histogram of Global Active Power
## over the time period 2007/02/01 to 2007/02/02.


## STEP 1: Download dataset into current working directory, unzip file
##     and read into R.

if(!file.exists("data")) {
        dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/raw.zip", method = "curl")  
setwd("data")
unzip("raw.zip", exdir = "./")
data <- read.csv2("household_power_consumption.txt")


## STEP 2: Subset dataset to date period 2007/02/01 to 2007/02/02.

x <- data  ## makes a copy of dataframe
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
x.sub <- x[(x$Date == "2007-02-01" | x$Date == "2007-02-02"), ]
x.sub$dateTime <- paste(x.sub$Date, x.sub$Time) ## Adds a new variable "dateTime"
x.sub$dateTime <- strptime(x.sub$dateTime, format = "%Y-%m-%d %H:%M:%S")
x.sub$Global_active_power <- as.numeric(x.sub$Global_active_power)


## STEP 3: Plot a histogram of Global Active Power.

png(file = "plot1.png") ## opens PNG device and creates 'plot1.png'
                        ## in working directory
hist(x.sub$Global_active_power, 
        col = "red", 
        xlab = "Global Active Power (kilowatts)", 
        main = "Global Active Power")
dev.off()

