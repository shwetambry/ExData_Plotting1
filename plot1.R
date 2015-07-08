powerdata <- read.table("./household_power_consumption.txt", sep =";", header=TRUE, na.strings="?")
data <- subset(powerdata, Date=="1/2/2007"| Date == "2/2/2007")

format_date_time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %T")
data <- cbind(format_date_time, data)
png("plot1.png",width=480,height=480)
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)",
     main = "Global Active Power", col= "red")
dev.off()
