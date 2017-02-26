## Exploratory Data Analysis, Week 1, Plot1

## download the household_power_consumption.zip and unzip into the working directory
power <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = c("NA", "?"))
str(power)  ## Date listed as factor, need to convert to a date format for subsetting

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
str(power)  ## Date now listed as a date format "YYYY-mm-dd"

#subset the dataset to the dates 2007-02001, 2007-02-02
power.sub = power[(power$Date == "2007-02-01" | power$Date == "2007-02-02"),]
str(power.sub)  ## file reduced to 2880 obs of 9 variable

# combine the Date and Time data into a timestamp for plotting
power.sub <- transform(power.sub, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
str(power.sub)

# plot a histogram of Global Active Power, 480x480 pixels as a PNG
png("Plot1.png", height=480, width=480, units = 'px')
hist(power.sub$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
