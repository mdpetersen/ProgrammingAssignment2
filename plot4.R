## Getting dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste((data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 4
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(data, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1,bty="n", col=c("black", "red", "blue"), cex=0.5)
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Reactive Power",xlab="")
  })

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()