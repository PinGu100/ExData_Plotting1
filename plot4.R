powerConsumption<-read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";",
                             col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                                         "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

powerConsumption$Date<-as.Date(powerConsumption$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(powerConsumption$Date), powerConsumption$Time)
powerConsumption$datetime <- as.POSIXct(datetime)

png(filename='plot4.png',width=480,height=480, units='px')
par(mfrow=c(2,2))

plot(powerConsumption$Global_active_power ~ powerConsumption$datetime, type = "l",
     ylab = "Global Active Power", xlab = "")

plot(powerConsumption$Voltage ~ powerConsumption$datetime, type = "l",
     ylab = "Voltage", xlab = "datetime")

plot(powerConsumption$Sub_metering_1 ~ powerConsumption$datetime, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(powerConsumption$Sub_metering_2 ~ powerConsumption$datetime, col = 'Red')
lines(powerConsumption$Sub_metering_3 ~ powerConsumption$datetime, col = 'Blue')

legend("topright", col = c("black", "red", "blue"),  lty=1, lwd=2, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(powerConsumption$Global_reactive_power ~ powerConsumption$datetime, type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()