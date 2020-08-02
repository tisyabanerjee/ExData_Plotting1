#Reading data
power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
#Renaming data
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subseting data based on date
subpower <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
newdate <- strptime(paste(subpower$Date, subpower$Time, sep = " "), "%d%m%Y %H:%M:%S")
Global_active_power <- as.numeric(as.character(subpower$Global_active_power))
png("plot2.png", width = 480, height = 480)
plot(newdate, Global_active_power, ylab = "Global Active Power (kilowatts)")
dev.off()

