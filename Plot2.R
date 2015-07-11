# read the entire data base
datapower <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?")
# Transform the format of the "date" variable
datapower$Date <- as.Date(datapower$Date, format="%d/%m/%Y")
# create a subset of the data base between "2007-02-01 and 2007-02-02"
powercomp <- datapower[(datapower$Date=="2007-02-01") | (datapower$Date=="2007-02-02"),]
#transform the format of the Time variable and generate a new variable that combines date and time
powercomp <- transform(powercomp, datetime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
#Check that everything looks as expected
str(powercomp)
#Create Plot 2
plot(powercomp$datetime, powercomp$Global_active_power, ylab = "Global Active Power (kilowatts)", type="l", xlab="", cex.lab=0.8, cex.axis=0.8)
#save the plot as PNG in the working directory
dev.copy(png, file="Plot2.png", width=480, height=480)
#close the graphic device 
dev.off()