powerConsumption<-read.table("household_power_consumption.txt", sep = ";", skip=66637 ,nrows=2880, 
                             col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                                         "Sub_metering_2","Sub_metering_3"))

powerConsumption$Date<-as.Date(powerConsumption$Date, format="%d/%m/%Y")

datetime<-paste(powerConsumption$Date, powerConsumption$Time)
powerConsumption$datetime <- as.POSIXct(datetime)

png(filename='plot2.png', width=480, height=480, units='px')
plot(powerConsumption$Global_active_power ~ powerConsumption$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()

