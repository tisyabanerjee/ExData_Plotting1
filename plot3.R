#Reading data
power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
#Renaming data
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subseting data based on date
subpower <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
#converting date to day
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
submetering1 <- as.numeric(as.character(subpower$Sub_metering_1))
submetering2 <- as.numeric(as.character(subpower$Sub_metering_2))
submetering3 <- as.numeric(as.character(subpower$Sub_metering_3))
#opening png device window
png("plot3.png", width = 480, height = 480)
plot(subpower$Time, submetering1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(subpower$Time, submetering1)
lines(subpower$Time, submetering2, col = "red")
lines(subpower$Time, submetering3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
#closing device window
dev.off()