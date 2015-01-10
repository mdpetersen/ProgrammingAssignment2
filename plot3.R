## Getting dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste((data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), cex=0.5)

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()