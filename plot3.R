##Read the entire data set
wholeTable<- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE, na.strings = "?")
##subset by the required dates
data<- wholeTable[wholeTable$Date == "1/2/2007" |wholeTable$Date == "2/2/2007" ,]
data$datetime<- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

##create plot 3
with(data,plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = ""))
lines(data$datetime,data$Sub_metering_2,col = "red")
lines(data$datetime,data$Sub_metering_3,col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lwd = 0.8)
##save to png
dev.copy(png, file = "plot3.png")
dev.off()