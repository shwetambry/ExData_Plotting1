powerdata <- read.table("./household_power_consumption.txt", sep =";", header=TRUE, na.strings="?")
data <- subset(powerdata, Date=="1/2/2007"| Date == "2/2/2007")

format_date_time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %T")
data <- cbind(format_date_time, data)

png("plot2.png",height=480,width=480)
plot(data$format_date_time,data$Global_active_power,type="l",xlab="",
     ylab="Global Active Power(kilowatts)")
dev.off()
