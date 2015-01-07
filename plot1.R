setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
powerConsum<- read.csv("household_power_consumption.txt", 
                       header = TRUE, sep = ";", na.strings = "?", 
                       colClasses = c("myDate","character","numeric",
                                  "numeric","numeric","numeric",
                                  "numeric","numeric","numeric"))
febData <- subset(powerConsum, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png(filename = "figure/plot1.png", width = 480, height = 480)
hist(febData$Global_active_power, ylim = c(0,1200),col = "red", 
     main = "Global Active Power", 
     xlab ="Global Active Power (Kilowatts)", ylab = "Frequency")
dev.off()
