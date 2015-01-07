setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
powerConsum<- read.csv("household_power_consumption.txt", 
                       header = TRUE, sep = ";", na.strings = "?", 
                       colClasses = c("myDate","character","numeric",
                                      "numeric","numeric","numeric",
                                      "numeric","numeric","numeric"))
febData <- subset(powerConsum, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
png(filename = "figure/plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
par(mar = c(4,4,2,2))
plot(strptime(paste(febData$Date, febData$Time), 
              format = "%Y-%m-%d %H:%M:%S"), 
     febData$Global_active_power,type = "s", 
     ylab = "Global Active Power(Kilowatts)",
     xlab = "")

plot(strptime(paste(febData$Date, febData$Time), 
              format = "%Y-%m-%d %H:%M:%S"), 
     febData$Voltage, type = "s", 
     ylab = "Voltage",
     xlab = "datetime")

plot(strptime(paste(febData$Date, febData$Time), 
              format = "%Y-%m-%d %H:%M:%S"), 
     febData$Sub_metering_1,type = "s", 
     ylab = "Energy sub metering",
     xlab = "")
lines(strptime(paste(febData$Date, febData$Time),
               format = "%Y-%m-%d %H:%M:%S"),
      febData$Sub_metering_2, col = "red")
lines(strptime(paste(febData$Date, febData$Time),
               format = "%Y-%m-%d %H:%M:%S"),
      febData$Sub_metering_3, col = "blue")
legend("topright", bty = "n", seg.len = 1, col = c("black","red","blue"), lty = "solid",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(strptime(paste(febData$Date, febData$Time), 
              format = "%Y-%m-%d %H:%M:%S"), 
     febData$Global_reactive_power, type = "s", 
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.off()



