##Read the entire data set
wholeTable<- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE, na.strings = "?")
##subset by the required dates
data<- wholeTable[wholeTable$Date == "1/2/2007" |wholeTable$Date == "2/2/2007" ,]
data$datetime<- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

##write plot to png directly to fix the legend

png("plot4.png")

##create plot 4
par(mfcol = c(2,2))
##top left
plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

##bottom left
with(data,plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = ""))
lines(data$datetime,data$Sub_metering_2,col = "red")
lines(data$datetime,data$Sub_metering_3,col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lwd = 0.8, bty = "n")

##top right
with(data, plot(datetime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
##bottom right
with(data,plot(datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))
##save to png
#dev.copy(png, file = "plot4.png")
dev.off()