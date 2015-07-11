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
#Create Plot 4 one by one
par(mfrow = c(2, 2))
plot(powercomp$datetime, powercomp$Global_active_power, ylab = "Global Active Power", type="l", xlab="", cex.lab=0.8, cex.axis=0.8)
plot(powercomp$datetime, powercomp$Voltage, type="l", xlab="datetime", ylab="Voltage", cex.lab=0.8, cex.axis=0.8)
plot(powercomp$datetime,powercomp$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", cex.lab=0.8, cex.axis=0.8)
lines(powercomp$datetime,powercomp$Sub_metering_2,col="red")
lines(powercomp$datetime,powercomp$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.5, y.intersp=0.8, xjust=0)
plot(powercomp$datetime, powercomp$Global_reactive_power, type="l", xlab="datetime",  ylab="Global_reactive_power", cex.lab=0.8, cex.axis=0.8)
#save the plot as PNG in the working directory
dev.copy(png, file="Plot4.png", width=480, height=480)
#close the graphic device 
dev.off()