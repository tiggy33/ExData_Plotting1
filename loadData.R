
# Function to retrieve data from file
loadData <- function() {
  
  #Numerical columns in data
  StartNumericalCol <- 3
  EndNumericalCol   <- 9
  
  # loading datatable library
  library(data.table)
  file    <- "household_power_consumption.txt"
  
  # Read file in a datatable
  data <- fread(file, header=TRUE, sep=";", colClasses="character",  na="?")
  
  # format dates
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  
  # Get data of two days
  newdata <-  data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02"]
  newdata <- data.frame(newdata)
  
  # Convert some columns to numeric format
  for(col in c(StartNumericalCol:3)) {
    newdata[,col] <- as.numeric(as.character(newdata[,col]))
  }
  
  
  # Format DateTime
  newdata$DateTime <- paste(newdata$Date, newdata$Time)
  newdata$DateTime <- strptime(newdata$DateTime, format = "%Y-%m-%d %H:%M:%S")
  
  # return data
  return (newdata)
  
}