powerdata <- read.table("./household_power_consumption.txt", sep =";", header=TRUE, na.strings="?")
data <- subset(powerdata, Date=="1/2/2007"| Date == "2/2/2007")

format_date_time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %T")
data <- cbind(format_date_time, data)

png("plot4.png",height=480, width=480)
par(mfcol=c(2,2))

plot(data$format_date_time,data$Global_active_power,type="l",xlab="",
     ylab="Global Active Power(kilowatts)")
plot(data$format_date_time, data$Sub_metering_1,type="l",
     xlab="",ylab="Energy sub metering")
lines(data$format_date_time,data$Sub_metering_2,col="red")
lines(data$format_date_time,data$Sub_metering_3,col="blue")
legend("topright",lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(data$format_date_time,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(data$format_date_time,data$Global_reactive_power,type="l",xlab="datetime")

par(mfcol=c(1,1))
dev.off()
