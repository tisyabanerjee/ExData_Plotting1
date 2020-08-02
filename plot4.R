#Reading data
power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
#Renaming data
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subseting data based on date
subpower <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
#converting date to day
newdate <- strptime(paste(subpower$Date, subpower$Time, sep = " "), "%d%m%Y %H:%M:%S")
submetering1 <- as.numeric(as.character(subpower$Sub_metering_1))
submetering2 <- as.numeric(as.character(subpower$Sub_metering_2))
submetering3 <- as.numeric(as.character(subpower$Sub_metering_3))
Global_active_power <- as.numeric(as.character(subpower$Global_active_power))
Global_reactive_power <- as.numeric(as.character(subpower$Global_reactive_power))
Voltage <- as.numeric(as.character(subpower$Voltage))
par(mfrow = c(2,2))
#opening png device window
png("plot4.png", width = 480, height = 480)
plot(newdate, Global_active_power, ylab = "Global Active Power (kilowatts)")
plot(newdate, Voltage, xlab = "datetime", ylab = "Voltage")
plot(newdate, submetering1, type = "n", ylab = "Energy sub metering")
with(subpower, lines(newdate, submetering1, type = 1))
with(subpower, lines(newdate, submetering2, type = 1, col = "red"))
with(subpower, lines(newdate, submetering3, type = 1, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
plot(newdate, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power")
#closing device window
dev.off()
