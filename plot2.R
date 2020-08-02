#Reading data
power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
#Renaming data
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subseting data based on date
subpower <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
#converting date to day
newdate <- strptime(paste(subpower$Date, subpower$Time, sep = " "), "%d%m%Y %H:%M:%S")
Global_active_power <- as.numeric(as.character(subpower$Global_active_power))
#opening png device window
png("plot2.png", width = 480, height = 480)
plot(newdate, Global_active_power, type = 1, ylab = "Global Active Power (kilowatts)")
#closing device window
dev.off()