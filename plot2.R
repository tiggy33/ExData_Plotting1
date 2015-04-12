# get Data
source("loadData.R")
data <- loadData()

#Graphical Device is PNG
png(filename = "plot2.png" , width = 480, height = 480)
plot(data$DateTime, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Close Graphical device
dev.off()