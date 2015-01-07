setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
powerConsum<- read.csv("household_power_consumption.txt", 
                       header = TRUE, sep = ";", na.strings = "?", 
                       colClasses = c("myDate","character","numeric",
                                      "numeric","numeric","numeric",
                                      "numeric","numeric","numeric"))
febData <- subset(powerConsum, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
png(filename = "figure/plot2.png", width = 480, height = 480)
plot(strptime(paste(febData$Date, febData$Time), 
                format = "%Y-%m-%d %H:%M:%S"), 
     febData$Global_active_power,type = "s", 
     ylab = "Global Active Power (Kilowatts)",
     xlab = "")


dev.off()

