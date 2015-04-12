##Read the entire data set
wholeTable<- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE, na.strings = "?")
##subset by the required dates
data<- wholeTable[wholeTable$Date == "1/2/2007" |wholeTable$Date == "2/2/2007" ,]
data$datetime<- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

##create plot 2
plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

##save to png
dev.copy(png, file = "plot2.png")
dev.off()