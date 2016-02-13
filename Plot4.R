##Read the data
OrigData <- read.table("household_power_consumption.txt", head = TRUE, sep = ";")
name = colnames(OrigData)

NewData <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), 
                      col.names = name, header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')

##convert date time
NewData$Date <- as.Date(NewData$Date, format = "%d/%m/%Y")

datetime <- paste(as.Date(NewData$Date), NewData$Time)
NewData$Datetime <- as.POSIXct(datetime)

##create the graphs
win.graph(480,480)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(1,1,1,1))

with(NewData, {
  plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.8)
  plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global_rective_power", xlab = "datetime")
  })
