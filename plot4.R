# get Data
source("loadData.R")
data <- loadData()

#Graphical Device is PNG
png(filename = "plot4.png" , width = 480, height = 480)


#Graphic with 2 lnes and two columns
par(mfrow=c(2,2))


# Graphic 1 Plot
plot(data$DateTime, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# Graphic 2 Plot
plot(data$DateTime, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Graphic 3 Plot
plot(data$DateTime, data$Sub_metering_1, col = "black",
     type="l",
     xlab=PlotXLabel,
     ylab=PlotYLabel)

lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"), c("Sub_metering_1", 
                                                   "Sub_metering_2", "Sub_metering_3"), lty=1)

# Graphic 4 Plot
plot(data$DateTime, data$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(data$DateTime, data$Global_reactive_power)

# Close Graphical device
dev.off()
